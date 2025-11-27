# 🛒 Relatório de Vendas — SQL Analytics

Análise completa de vendas usando **MySQL**, integrando **clientes**, **produtos** e **transações** reais.

## 🚀 Visão Geral do Projeto
Este projeto constrói um banco de dados chamado **relatorio_vendas**, contendo tabelas de clientes, produtos e vendas, incluindo relacionamentos, chaves estrangeiras e consultas analíticas com KPIs essenciais.

## 🧱 Modelagem do Banco de Dados
### Estrutura das Tabelas
- **clientes** — dados de localização e perfil
- **produtos** — categoria, nome e preço
- **vendas** — dados da transação, vendedor, canal e descontos

### Relacionamentos
- vendas.id_cliente → clientes.id_cliente
- vendas.id_produto → produtos.id_produto

## 📈 KPIs Implementados
### 1️⃣ Faturamento por Região
Analisa o faturamento total por região.

### 2️⃣ Ranking de Vendedores
Mostra quem mais gerou receita.

### 3️⃣ Desempenho dos Produtos
Top produtos por faturamento e quantidade vendida.

### 4️⃣ Regiões com Faturamento Acima de 20k
Filtro estratégico para tomada de decisão.

## 🧪 Como Rodar o Projeto
1. Abra o MySQL Workbench.
2. Importe o arquivo `relatorio_vendas.sql`.
3. Execute o script completo.
4. O banco estará pronto para análises.

## 🏁 Conclusão
Projeto perfeito para portfólio de Analista de Dados, demonstrando domínio em SQL, modelagem e criação de KPIs.

## 🤝 Contribuições

Sugestões e melhorias são sempre bem-vindas!

## 🧑‍💻 Autor

**Whallyson Gabriel Garcia da Silva**  
Analista de Dados • Brasil  
GitHub: https://github.com/WhallysonGGDS
