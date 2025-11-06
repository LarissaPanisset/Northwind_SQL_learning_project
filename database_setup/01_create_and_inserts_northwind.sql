---Criar esquema

create schema northwind;

---Criação da tabela clientes

CREATE TABLE northwind.clientes (
    customer_id VARCHAR(10) PRIMARY KEY,
    company_name VARCHAR(100),
    contact_name VARCHAR(100),
    contact_title VARCHAR(50),
    address VARCHAR(200),
    city VARCHAR(50),
    region VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    phone VARCHAR(20),
    fax VARCHAR(20)
);

---Criação da tabela produtos

CREATE TABLE northwind.produtos(
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    supplier_id INT,
    category_id INT,
    quantity_per_unit VARCHAR(50),
    unit_price NUMERIC(10,2),
    units_in_stock INT,
    units_on_order INT,
    reorder_level INT,
    discontinued INT
);

---Criação da tabela pedidos

CREATE TABLE northwind.pedidos(
    order_id SERIAL PRIMARY KEY,
    customer_id VARCHAR(10),
    employee_id INT,
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    ship_via INT,
    freight NUMERIC(10,2),
    ship_name VARCHAR(100),
    ship_address VARCHAR(200),
    ship_city VARCHAR(50),
    ship_region VARCHAR(50),
    ship_postal_code VARCHAR(20),
    ship_country VARCHAR(50)
);

---Criação da tabela itens_pedidos

CREATE TABLE northwind.itens_pedidos (
    order_id INT,
    product_id INT,
    unit_price NUMERIC(10,2),
    quantity INT,
    discount NUMERIC(10,2),
    PRIMARY KEY (order_id, product_id) 
);

---Criação da tabela fornecedores

CREATE TABLE northwind.fornecedores (
    supplier_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100),
    contact_name VARCHAR(100),
    contact_title VARCHAR(50),
    address VARCHAR(200),
    city VARCHAR(50),
    region VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    phone VARCHAR(20),
    fax VARCHAR(20),
    homepage TEXT
);

---Criação da tabela funcionários

CREATE TABLE northwind.funcionarios (
    employee_id SERIAL PRIMARY KEY,
    last_name VARCHAR(100),
    first_name VARCHAR(100),
    title VARCHAR(100),
    title_of_courtesy VARCHAR(100),
    birth_date DATE,
    hire_date DATE,
    address VARCHAR(200),
    city VARCHAR(100),
    region VARCHAR(100),
    postal_code VARCHAR(20),
    country VARCHAR(100),
    home_phone VARCHAR(20),
    extension VARCHAR(10),
    photo BYTEA,
    notes TEXT,
    reports_to INT,
    photo_path VARCHAR(500)
);

---Criação da tabela categorias

CREATE TABLE northwind.categorias (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100),
    description TEXT,
    picture BYTEA
);

---Criação da tabela regiões

CREATE TABLE northwind.regioes (
    region_id SERIAL PRIMARY KEY,
    region_description VARCHAR(100)
);

---Criação da tabela territórios

CREATE TABLE northwind.territorios (
    territory_id VARCHAR(20) PRIMARY KEY,
    territory_description VARCHAR(100),
    region_id INT
);

---Criação da tabela territórios dos funcionários

CREATE TABLE northwind.territorios_funcionarios (
    employee_id INT,
    territory_id VARCHAR(50),
    PRIMARY KEY (employee_id, territory_id)
);

---Criação da tabela demografia dos clientes

CREATE TABLE northwind.demografia_clientes (
    customerType_id VARCHAR(10) PRIMARY KEY,
    customer_desc TEXT
);

---Criação da tabela tipos de clientes

CREATE TABLE northwind.tipos_clientes (
    customer_id VARCHAR(10),
    customer_type_id VARCHAR(10),
    PRIMARY KEY (customer_id, customer_type_id)
);

-- Migrar dados das tabelas principais

INSERT INTO northwind.clientes 
SELECT * FROM stg.customers;

INSERT INTO northwind.produtos 
SELECT * FROM stg.products;

INSERT INTO northwind.pedidos 
SELECT * FROM stg.orders;

INSERT INTO northwind.itens_pedidos 
SELECT * FROM stg.order_details;

-- Migrar as tabelas de suporte

INSERT INTO northwind.fornecedores 
SELECT * FROM stg.suppliers;

INSERT INTO northwind.funcionarios 
SELECT * FROM stg.employees;

INSERT INTO northwind.categorias 
SELECT * FROM stg.categories;

INSERT INTO northwind.regioes 
SELECT * FROM stg.region;

INSERT INTO northwind.territorios 
SELECT * FROM stg.territories;

INSERT INTO northwind.territorios_funcionarios 
SELECT * FROM stg.employee_territories;

INSERT INTO northwind.demografia_clientes 
SELECT * FROM stg.customer_demographics;

INSERT INTO northwind.tipos_clientes 
SELECT * FROM stg.customer_customer_demo;


-- Relacionamentos para a tabela pedidos

ALTER TABLE northwind.pedidos
ADD CONSTRAINT fk_pedidos_clientes
FOREIGN KEY (customer_id) REFERENCES northwind.clientes(customer_id);

ALTER TABLE northwind.pedidos
ADD CONSTRAINT fk_pedidos_funcionarios
FOREIGN KEY (employee_id) REFERENCES northwind.funcionarios(employee_id);

-- Relacionamentos para a tabela itens_pedidos

ALTER TABLE northwind.itens_pedidos
ADD CONSTRAINT fk_itens_pedidos_pedidos
FOREIGN KEY (order_id) REFERENCES northwind.pedidos(order_id);

ALTER TABLE northwind.itens_pedidos
ADD CONSTRAINT fk_itens_pedidos_produtos
FOREIGN KEY (product_id) REFERENCES northwind.produtos(product_id);

-- Relacionamentos para a tabela produtos

ALTER TABLE northwind.produtos
ADD CONSTRAINT fk_produtos_fornecedores
FOREIGN KEY (supplier_id) REFERENCES northwind.fornecedores(supplier_id);

ALTER TABLE northwind.produtos
ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (category_id) REFERENCES northwind.categorias(category_id);

-- Relacionamentos para a tabela territorios

ALTER TABLE northwind.territorios
ADD CONSTRAINT fk_territorios_regioes
FOREIGN KEY (region_id) REFERENCES northwind.regioes(region_id);

-- Relacionamentos para a tabela territorios_funcionarios

ALTER TABLE northwind.territorios_funcionarios
ADD CONSTRAINT fk_territorios_funcionarios_funcionarios
FOREIGN KEY (employee_id) REFERENCES northwind.funcionarios(employee_id);

ALTER TABLE northwind.territorios_funcionarios
ADD CONSTRAINT fk_territorios_funcionarios_territorios
FOREIGN KEY (territory_id) REFERENCES northwind.territorios(territory_id);

-- Relacionamentos para a tabela tipos_clientes

ALTER TABLE northwind.tipos_clientes
ADD CONSTRAINT fk_tipos_clientes_clientes
FOREIGN KEY (customer_id) REFERENCES northwind.clientes(customer_id);

ALTER TABLE northwind.tipos_clientes
ADD CONSTRAINT fk_tipos_clientes_demografia
FOREIGN KEY (customer_type_id) REFERENCES northwind.demografia_clientes(customerType_id);

-- Relacionamento autorreferencial em funcionarios (reports_to)

ALTER TABLE northwind.funcionarios
ADD CONSTRAINT fk_funcionarios_supervisor
FOREIGN KEY (reports_to) REFERENCES northwind.funcionarios(employee_id);



select *
from northwind.categorias c ;


