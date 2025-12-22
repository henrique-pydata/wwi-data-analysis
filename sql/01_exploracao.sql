-- Análise Temporal de Pedidos 
-- Quantidade de pedidos por ano 
SELECT 
    YEAR([Order Date Key]) AS Ano,
    COUNT([Order Key])     AS Pedidos
FROM Fact.[Order]
GROUP BY YEAR([Order Date Key])
ORDER BY Pedidos DESC;



-- Média mensal de pedidos por ano 
SELECT 
    Ano,
    AVG(Pedidos) AS Media_Mensal
FROM (
    SELECT 
        YEAR([Order Date Key])  AS Ano,
        MONTH([Order Date Key]) AS Mes,
        COUNT([Order Key])      AS Pedidos
    FROM Fact.[Order]
    GROUP BY YEAR([Order Date Key]), MONTH([Order Date Key])
) dados
GROUP BY Ano;



-- Pedidos por mês e ano 
SELECT 
    YEAR([Order Date Key])  AS Ano,
    MONTH([Order Date Key]) AS Mes,
    COUNT([Order Key])      AS Pedidos
FROM Fact.[Order]
GROUP BY YEAR([Order Date Key]), MONTH([Order Date Key])
ORDER BY Ano, Mes;



-- Análise de Pedidos Por Cliente


-- Total de clientes únicos 
SELECT 
    COUNT(DISTINCT [Customer Key]) AS Total_Clientes
FROM Fact.[Order];


-- Ranking de clientes por quantidade de pedidos
SELECT 
    Customer_Key,
    Pedidos,
    DENSE_RANK() OVER (ORDER BY Pedidos DESC) AS Rank_Cliente
FROM (
    SELECT 
        [Customer Key] AS Customer_Key,
        COUNT([Order Key]) AS Pedidos
    FROM Fact.[Order]
    GROUP BY [Customer Key]
) ranking_customer;


-- Valor médio gasto por cliente 
SELECT 
    [Customer Key] AS Customer_Key,
    AVG([Total Excluding Tax]) AS Ticket_Medio
FROM Fact.[Order]
GROUP BY [Customer Key]
ORDER BY Ticket_Medio DESC;



-- Ticket médio geral
SELECT 
    AVG([Total Excluding Tax]) AS Ticket_Medio_Geral
FROM Fact.[Order];
-- 767.61


-- Classificação de clientes acima ou abaixo do ticket médio
SELECT 
    Status,
    COUNT(Customer_Key) AS Quantidade_Clientes
FROM (
    SELECT 
        Customer_Key,
        CASE 
            WHEN Ticket_Medio < 767.61  THEN 'Abaixo da média'
            ELSE 'Acima da média'
        END AS Status
    FROM (
        SELECT 
            [Customer Key] AS Customer_Key,
            AVG([Total Excluding Tax]) AS Ticket_Medio
        FROM Fact.[Order]
        GROUP BY [Customer Key]
    ) clientes_media
) classificacao
GROUP BY Status;


-- Análise de Pedidos Por Região

-- Ranking de cidades por número pedidos
SELECT 
    Estado,
    Cidade,
    Pedidos,
    DENSE_RANK() OVER (PARTITION BY Estado ORDER BY Pedidos DESC) AS Rank_Cidade
FROM (
    SELECT 
        [State Province] AS Estado,
        [City]           AS Cidade,
        COUNT([Order Key]) AS Pedidos
    FROM Fact.[Order] AS T1
    LEFT JOIN Dimension.[City] AS T2 
        ON T1.[City Key] = T2.[City Key]
    GROUP BY [State Province], [City]
) dados
ORDER BY Estado, Rank_Cidade;



SELECT *


FROM Dimension.[Customer]