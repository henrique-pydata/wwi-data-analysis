SELECT 

    T1.[Order Key],
    T1.[Customer Key],
    T1.[Quantity],
    T1.[Unit Price],
    T1.[Total Excluding Tax],
    T1.[Total Including Tax],

    T2.[City],
    T2.[State Province],

    T3.[Customer],

    T4.[Date],
    T4.[Month],
    T4.[Short Month],
    T4.[Calendar Month Number] AS Month_Number,
    T4.[Calendar Year] AS Year

FROM Fact.[Order] AS T1

LEFT JOIN Dimension.[City] AS T2 ON T1.[City Key] = T2.[City Key]
LEFT JOIN Dimension.[Customer] AS T3 ON T1.[Customer Key] = T3.[Customer Key]
LEFT JOIN Dimension.[Date] AS T4 ON T1.[Order Date Key] = T4.[Date]
