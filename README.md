# WWI Orders Performance Analysis

Base de dados fictícia da WideWorldImporters. O projeto tem como foco analisar a performance de pedidos, integrando diferentes ferramentas como Power BI, Python e SQL para treinar o fluxo completo de análise de dados.

## Estrutura do repositório

- `/notebooks/` → Jupyter Notebooks
- `/sql/` → Scripts SQL
- `/bi/` → Arquivos Power BI (.pbix)
- `/docs/` → Insights, imagens e documentação

## Como usar

1. Abrir os notebooks em `/notebooks/`
2. Executar os scripts SQL em `/sql/`
3. Abrir os arquivos Power BI em `/bi/`
4. Para facilitar, deixei um CSV com a base utilizada na análise dentro da pasta `/docs/exports/` (`orders_data.csv`) e também um notebook na raiz do projeto que utiliza esse CSV, permitindo que qualquer pessoa rode a análise sem precisar se conectar ao banco de dados.


### Pré-visualização do Dashboard

![Dashboard Preview](bi/dashboard_preview.gif)


## Observações

- Todos os dados utilizados são fictícios.
- O notebook na raiz do projeto (`notebook_analysis_no_sql`) pode ser executado sem conexão com SQL Server, usando o CSV em `/docs/exports/orders_data.csv`.
- O fluxo completo de análise envolve SQL, Python e Power BI.



