# 📊 Projeto – Relatório de Desempenho de Vendas (SQL)

Este projeto simula um **sistema de relatórios de vendas** usando apenas **SQL**.  
O objetivo é mostrar domínio de:

- Modelagem simples de banco de dados relacional  
- Criação de tabelas com chaves primárias e estrangeiras  
- Consultas com **JOIN**, **GROUP BY**, **HAVING** e **ORDER BY**  
- Cálculo de **KPIs de vendas** direto no banco

---

## 🎯 Objetivo

Construir, do zero, um mini banco de dados de vendas e responder perguntas de negócio como:

- Quanto cada **região** fatura?  
- Qual **vendedor** vende mais?  
- Quais são os **produtos** que mais geram receita?  
- Como filtrar regiões que faturam acima de um certo valor?

Tudo isso apenas com **SQL puro**.

---

## 🛠️ Tecnologias utilizadas

- **MySQL Community Server**
- **MySQL Workbench**

---

## 🗄️ Modelagem do Banco de Dados

O banco se chama **`relatorio_vendas`** e possui 3 tabelas:

### `clientes`
- `id_cliente` (PK, INT)  
- `nome_cliente` (VARCHAR)  
- `cidade` (VARCHAR)  
- `estado` (CHAR(2))  
- `regiao` (VARCHAR) – Norte, Nordeste, Sudeste, Sul, Centro-Oeste

### `produtos`
- `id_produto` (PK, INT)  
- `nome_produto` (VARCHAR)  
- `categoria` (VARCHAR)  
- `preco_unitario` (DECIMAL)

### `vendas`
- `id_venda` (PK, INT)  
- `id_cliente` (FK → clientes.id_cliente)  
- `id_produto` (FK → produtos.id_produto)  
- `data_venda` (DATE)  
- `quantidade` (INT)  
- `vendedor` (VARCHAR)  
- `canal` (VARCHAR) – Online, Loja Física, Representante etc.  
- `desconto_pct` (DECIMAL) – percentual de desconto aplicado

A métrica de valor da venda é:

```sql
valor_venda = quantidade * preco_unitario * (1 - desconto_pct / 100),

▶️ Como rodar o projeto

Importar o script SQL

No MySQL Workbench:

Abra uma conexão (Local instance MySQL).

Vá em File > Open SQL Script… e selecione o arquivo relatorio_vendas.sql.

Clique no botão de raio (Execute) para rodar todo o script.

Conferir os dados

USE relatorio_vendas;

SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM vendas;


Se as tabelas retornarem linhas, o banco está pronto.



