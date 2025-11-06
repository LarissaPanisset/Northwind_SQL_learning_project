-- ÍNDICES 

-- Índices para tabela Clientes
CREATE INDEX idx_clientes_country ON northwind.clientes(country);
CREATE INDEX idx_clientes_city ON northwind.clientes(city);
CREATE INDEX idx_clientes_company_name ON northwind.clientes(company_name);

-- Índices para tabela Pedidos
CREATE INDEX idx_pedidos_customer_id ON northwind.pedidos(customer_id);
CREATE INDEX idx_pedidos_employee_id ON northwind.pedidos(employee_id);
CREATE INDEX idx_pedidos_order_date ON northwind.pedidos(order_date);
CREATE INDEX idx_pedidos_shipped_date ON northwind.pedidos(shipped_date);
CREATE INDEX idx_pedidos_ship_country ON northwind.pedidos(ship_country);

-- Índices para tabela Itens_Pedidos
CREATE INDEX idx_itens_pedidos_order_id ON northwind.itens_pedidos(order_id);
CREATE INDEX idx_itens_pedidos_product_id ON northwind.itens_pedidos(product_id);
CREATE INDEX idx_itens_pedidos_discount ON northwind.itens_pedidos(discount) WHERE discount > 0;

-- Índices para tabela Produtos
CREATE INDEX idx_produtos_category_id ON northwind.produtos(category_id);
CREATE INDEX idx_produtos_supplier_id ON northwind.produtos(supplier_id);
CREATE INDEX idx_produtos_unit_price ON northwind.produtos(unit_price);
CREATE INDEX idx_produtos_discontinued ON northwind.produtos(discontinued) WHERE discontinued = 1;

-- Índices para tabela Funcionarios
CREATE INDEX idx_funcionarios_last_name ON northwind.funcionarios(last_name);
CREATE INDEX idx_funcionarios_country ON northwind.funcionarios(country);
CREATE INDEX idx_funcionarios_reports_to ON northwind.funcionarios(reports_to);

-- Índices para tabela Fornecedores
CREATE INDEX idx_fornecedores_country ON northwind.fornecedores(country);
CREATE INDEX idx_fornecedores_city ON northwind.fornecedores(city);



