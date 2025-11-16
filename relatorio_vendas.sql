-- 📌 Cria o banco de dados apenas se ele ainda não existir
CREATE DATABASE IF NOT EXISTS relatorio_vendas;

-- 📌 Seleciona o banco para uso
USE relatorio_vendas;

-- 📌 Remove as tabelas caso já existam (para evitar erros ao recriar)
DROP TABLE IF EXISTS vendas;
DROP TABLE IF EXISTS produtos;
DROP TABLE IF EXISTS clientes;

-- 📌 Cria tabela de clientes
CREATE TABLE clientes (
    id_cliente      INT PRIMARY KEY,          -- Identificador único
    nome_cliente    VARCHAR(100) NOT NULL,    -- Nome do cliente
    cidade          VARCHAR(100),             -- Cidade do cliente
    estado          CHAR(2),                  -- Estado (UF)
    regiao          VARCHAR(20)               -- Região (Norte, Sul, etc.)
);

-- 📌 Cria tabela de produtos
CREATE TABLE produtos (
    id_produto      INT PRIMARY KEY,           -- Identificador único
    nome_produto    VARCHAR(100) NOT NULL,     -- Nome do produto
    categoria       VARCHAR(50),               -- Categoria (informática, etc.)
    preco_unitario  DECIMAL(10,2) NOT NULL     -- Preço por unidade
);

-- 📌 Cria tabela de vendas com chaves estrangeiras
CREATE TABLE vendas (
    id_venda        INT PRIMARY KEY,           -- ID da venda
    id_cliente      INT NOT NULL,              -- FK para clientes
    id_produto      INT NOT NULL,              -- FK para produtos
    data_venda      DATE NOT NULL,             -- Data da venda
    quantidade      INT NOT NULL,              -- Quantidade vendida
    vendedor        VARCHAR(100) NOT NULL,     -- Nome do vendedor
    canal           VARCHAR(50),               -- Canal (online, física…)
    desconto_pct    DECIMAL(5,2) DEFAULT 0,    -- Desconto aplicado (%)
    
    -- 🔗 Relacionamentos
    CONSTRAINT fk_vendas_cliente
        FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_vendas_produto
        FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- 📌 Inserção dos clientes
INSERT INTO clientes (id_cliente, nome_cliente, cidade, estado, regiao) VALUES
(1, 'Supermercado Goiás',        'Goiânia',      'GO', 'Centro-Oeste'),
(2, 'Loja Paulista',             'São Paulo',    'SP', 'Sudeste'),
(3, 'Mercado Carioca',           'Rio de Janeiro','RJ','Sudeste'),
(4, 'Comercial Nordeste',        'Recife',       'PE', 'Nordeste'),
(5, 'Distribuidora Sul Brasil',  'Porto Alegre', 'RS', 'Sul'),
(6, 'Atacadão Norte',            'Manaus',       'AM', 'Norte'),
(7, 'Empório Mineiro',           'Belo Horizonte','MG','Sudeste'),
(8, 'Loja Centro-Oeste',         'Cuiabá',       'MT', 'Centro-Oeste'),
(9, 'Mercadinho do Povo',        'Salvador',     'BA', 'Nordeste'),
(10,'Hiper Rio Preto',           'São José do Rio Preto','SP','Sudeste');

-- 📌 Inserção dos produtos
INSERT INTO produtos (id_produto, nome_produto, categoria, preco_unitario) VALUES
(1, 'Notebook Básico',        'Informática', 2500.00),
(2, 'Notebook Gamer',         'Informática', 6500.00),
(3, 'Mouse Sem Fio',          'Periféricos',  80.00),
(4, 'Teclado Mecânico',       'Periféricos', 350.00),
(5, 'Monitor 24"',            'Periféricos', 900.00),
(6, 'Cadeira Ergonômica',     'Escritório',  1200.00),
(7, 'Headset USB',            'Periféricos', 200.00),
(8, 'Dock Station',           'Informática', 450.00);

-- 📌 Inserção das vendas
INSERT INTO vendas (id_venda, id_cliente, id_produto, data_venda, quantidade, vendedor, canal, desconto_pct) VALUES
(1,  1, 1, '2025-01-10',  3, 'Ana',   'Loja Física',      5.0),
(2,  2, 2, '2025-01-12',  1, 'Bruno', 'Online',           0.0),
(3,  3, 3, '2025-01-15', 10, 'Carla', 'Online',           10.0),
(4,  4, 5, '2025-01-18',  4, 'Ana',   'Representante',    7.0),
(5,  5, 6, '2025-01-20',  2, 'Diego', 'Loja Física',      0.0),
(6,  6, 4, '2025-01-22',  5, 'Carla', 'Online',           5.0),
(7,  7, 1, '2025-01-25',  1, 'Ana',   'Online',           3.0),
(8,  8, 7, '2025-01-26',  6, 'Bruno', 'Representante',    0.0),
(9,  9, 3, '2025-01-27', 15, 'Carla', 'Loja Física',      12.0),
(10,10, 2, '2025-01-28',  2, 'Diego', 'Online',           5.0),
(11,2,  5, '2025-02-01',  3, 'Ana',   'Loja Física',      0.0),
(12,3,  6, '2025-02-02',  1, 'Bruno', 'Online',           0.0),
(13,4,  8, '2025-02-05',  4, 'Carla', 'Representante',    8.0),
(14,5,  1, '2025-02-07',  2, 'Ana',   'Online',           5.0),
(15,6,  7, '2025-02-09',  3, 'Bruno', 'Loja Física',      0.0),
(16,7,  4, '2025-02-10',  2, 'Carla', 'Online',           0.0),
(17,8,  3, '2025-02-11',  8, 'Diego', 'Representante',    10.0),
(18,9,  2, '2025-02-12',  1, 'Ana',   'Online',           0.0),
(19,1,  5, '2025-02-13',  2, 'Bruno', 'Loja Física',      5.0),
(20,10, 6,'2025-02-14',  1, 'Carla', 'Online',           0.0);

-- 📌 Visualizar tabelas
SELECT * FROM clientes;
SELECT * FROM produtos;
SELECT * FROM vendas;

-- 📊 Faturamento por região
SELECT 
    c.regiao,
    ROUND(SUM(v.quantidade * p.preco_unitario * (1 - v.desconto_pct/100)), 2) AS faturamento_total
FROM vendas v
JOIN clientes c   ON v.id_cliente = c.id_cliente
JOIN produtos p   ON v.id_produto = p.id_produto
GROUP BY c.regiao
ORDER BY faturamento_total DESC;

-- 📊 Ranking de vendedores por faturamento
SELECT
    v.vendedor,
    ROUND(SUM(v.quantidade * p.preco_unitario * (1 - v.desconto_pct/100)), 2) AS faturamento_total,
    COUNT(*) AS numero_vendas
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY v.vendedor
ORDER BY faturamento_total DESC;

-- 📊 Desempenho por produto
SELECT
    p.nome_produto,
    p.categoria,
    ROUND(SUM(v.quantidade * p.preco_unitario * (1 - v.desconto_pct/100)), 2) AS faturamento_total,
    SUM(v.quantidade) AS quantidade_total
FROM vendas v
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY p.id_produto, p.nome_produto, p.categoria
ORDER BY faturamento_total DESC;

-- 📊 Regiões com faturamento acima de 20k
SELECT 
    c.regiao,
    ROUND(SUM(v.quantidade * p.preco_unitario * (1 - v.desconto_pct/100)), 2) AS faturamento_total
FROM vendas v
JOIN clientes c ON v.id_cliente = c.id_cliente
JOIN produtos p ON v.id_produto = p.id_produto
GROUP BY c.regiao
HAVING faturamento_total > 20000
ORDER BY faturamento_total DESC;


