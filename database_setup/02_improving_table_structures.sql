-- Normalização e Melhoria da Estrutura de Tabelas

-- Tabela Clientes coluna address
-- Caso 1: Quando o número vem DEPOIS do nome da rua
UPDATE northwind.clientes
SET address = REGEXP_REPLACE(address, '^(.+)\s+(\d+)$', '\1, \2')
WHERE address ~ '^[^0-9]+ [0-9]+$';

-- Caso 2: Quando o número vem ANTES do nome 
UPDATE northwind.clientes 
SET address = REGEXP_REPLACE(address, '^(\d+)\s+(.+)$', '\2, \1')
WHERE address ~ '^[0-9]+ .+$';

-- Caso 3: Endereços com vírgula mas formato inconsistente 
UPDATE northwind.clientes 
SET address = REGEXP_REPLACE(address, '^(\d+),\s*(.+)$', '\2, \1')
WHERE address ~ '^\d+,\s*.+$';

-- Remover pontos extras e padronizar
UPDATE northwind.clientes  
SET address = INITCAP(LOWER(address));

-- Tabela Clientes coluna phone
-- Remover tudo que não é número, mantendo apenas dígitos
UPDATE northwind.clientes
SET phone = REGEXP_REPLACE(phone, '[^0-9]', '', 'g');

-- Aplicar formato: (XXX) XXX-XXXX para números com 10 dígitos
UPDATE northwind.clientes
SET phone = '(' || SUBSTRING(phone FROM 1 FOR 3) || ') ' || 
                   SUBSTRING(phone FROM 4 FOR 3) || '-' || 
                   SUBSTRING(phone FROM 7 FOR 4)
WHERE LENGTH(phone) = 10;

-- Aplicar formato: (XX) XXXX-XXXX para números com 9 dígitos
UPDATE northwind.clientes
SET phone = '(' || SUBSTRING(phone FROM 1 FOR 2) || ') ' || 
                   SUBSTRING(phone FROM 3 FOR 4) || '-' || 
                   SUBSTRING(phone FROM 7 FOR 4)
WHERE LENGTH(phone) = 9;

-- Formato internacional para números com mais dígitos
UPDATE northwind.clientes 
SET phone = '+' || SUBSTRING(phone FROM 1 FOR 2) || ' ' || 
                   SUBSTRING(phone FROM 3 FOR 3) || ' ' || 
                   SUBSTRING(phone FROM 6 FOR 3) || ' ' || 
                   SUBSTRING(phone FROM 9 FOR 4)
WHERE LENGTH(phone) > 10;

-- Remover caracteres inválidos dos telefones

UPDATE northwind.clientes 
SET phone = REGEXP_REPLACE(phone, '[^\d\(\)\-\s]+', '', 'g')
WHERE phone IS NOT NULL;

-- Tabela Clientes coluna fax
-- Remover tudo que não é número, mantendo apenas dígitos
UPDATE northwind.clientes
SET fax = REGEXP_REPLACE(fax, '[^0-9]', '', 'g')
WHERE fax IS NOT NULL;

-- Aplicar formato: (XXX) XXX-XXXX para números com 10 dígitos
UPDATE northwind.clientes
SET fax = '(' || SUBSTRING(fax FROM 1 FOR 3) || ') ' || 
                  SUBSTRING(fax FROM 4 FOR 3) || '-' || 
                  SUBSTRING(fax FROM 7 FOR 4)
WHERE LENGTH(fax) = 10;

-- Aplicar formato: (XX) XXXX-XXXX para números com 9 dígitos
UPDATE northwind.clientes
SET fax = '(' || SUBSTRING(fax FROM 1 FOR 2) || ') ' || 
                  SUBSTRING(fax FROM 3 FOR 4) || '-' || 
                  SUBSTRING(fax FROM 7 FOR 4)
WHERE LENGTH(fax) = 9;

-- Formato internacional para números com mais dígitos
UPDATE northwind.clientes 
SET fax = SUBSTRING(fax FROM 1 FOR 2) || ' ' || 
                  SUBSTRING(fax FROM 3 FOR 3) || ' ' || 
                  SUBSTRING(fax FROM 6 FOR 3) || ' ' || 
                  SUBSTRING(fax FROM 9 FOR 4)
WHERE LENGTH(fax) > 10;

-- Remover caracteres inválidos dos fax (sem o +)
UPDATE northwind.clientes 
SET fax = REGEXP_REPLACE(fax, '[^\d\(\)\-\s]+', '', 'g')
WHERE fax IS NOT NULL;

-- Definir como NULL onde o fax estiver vazio após a limpeza
UPDATE northwind.clientes 
SET fax = NULL 
WHERE fax = '' OR TRIM(fax) = '';

-- Tabela Fornecedores coluna address
-- Caso 1: Quando o número vem DEPOIS do nome da rua
UPDATE northwind.fornecedores
SET address = REGEXP_REPLACE(address, '^(.+)\s+(\d+)$', '\1, \2')
WHERE address ~ '^[^0-9]+ [0-9]+$';

-- Caso 2: Quando o número vem ANTES do nome 
UPDATE northwind.fornecedores 
SET address = REGEXP_REPLACE(address, '^(\d+)\s+(.+)$', '\2, \1')
WHERE address ~ '^[0-9]+ .+$';

-- Caso 3: Endereços com vírgula mas formato inconsistente 
UPDATE northwind.fornecedores
SET address = REGEXP_REPLACE(address, '^(\d+),\s*(.+)$', '\2, \1')
WHERE address ~ '^\d+,\s*.+$';

-- Remover pontos extras e padronizar
UPDATE northwind.fornecedores  
SET address = INITCAP(LOWER(address));

-- Tabela fornecedores coluna phone
-- Remover tudo que não é número, mantendo apenas dígitos
UPDATE northwind.fornecedores
SET phone = REGEXP_REPLACE(phone, '[^0-9]', '', 'g');

-- Aplicar formato: (XXX) XXX-XXXX para números com 10 dígitos
UPDATE northwind.fornecedores
SET phone = '(' || SUBSTRING(phone FROM 1 FOR 3) || ') ' || 
                   SUBSTRING(phone FROM 4 FOR 3) || '-' || 
                   SUBSTRING(phone FROM 7 FOR 4)
WHERE LENGTH(phone) = 10;

-- Aplicar formato: (XX) XXXX-XXXX para números com 9 dígitos
UPDATE northwind.fornecedores
SET phone = '(' || SUBSTRING(phone FROM 1 FOR 2) || ') ' || 
                   SUBSTRING(phone FROM 3 FOR 4) || '-' || 
                   SUBSTRING(phone FROM 7 FOR 4)
WHERE LENGTH(phone) = 9;

-- Formato internacional para números com mais dígitos
UPDATE northwind.fornecedores 
SET phone = '+' || SUBSTRING(phone FROM 1 FOR 2) || ' ' || 
                   SUBSTRING(phone FROM 3 FOR 3) || ' ' || 
                   SUBSTRING(phone FROM 6 FOR 3) || ' ' || 
                   SUBSTRING(phone FROM 9 FOR 4)
WHERE LENGTH(phone) > 10;

-- Remover caracteres inválidos dos telefones
UPDATE northwind.fornecedores 
SET phone = REGEXP_REPLACE(phone, '[^\d\(\)\-\s]+', '', 'g')
WHERE phone IS NOT NULL;

-- Tabela Fornecedores coluna fax
-- Remover tudo que não é número, mantendo apenas dígitos
UPDATE northwind.fornecedores
SET fax = REGEXP_REPLACE(fax, '[^0-9]', '', 'g')
WHERE fax IS NOT NULL;

-- Aplicar formato: (XXX) XXX-XXXX para números com 10 dígitos
UPDATE northwind.fornecedores
SET fax = '(' || SUBSTRING(fax FROM 1 FOR 3) || ') ' || 
                  SUBSTRING(fax FROM 4 FOR 3) || '-' || 
                  SUBSTRING(fax FROM 7 FOR 4)
WHERE LENGTH(fax) = 10;

-- Aplicar formato: (XX) XXXX-XXXX para números com 9 dígitos
UPDATE northwind.fornecedores
SET fax = '(' || SUBSTRING(fax FROM 1 FOR 2) || ') ' || 
                  SUBSTRING(fax FROM 3 FOR 4) || '-' || 
                  SUBSTRING(fax FROM 7 FOR 4)
WHERE LENGTH(fax) = 9;

-- Formato internacional para números com mais dígitos
UPDATE northwind.fornecedores 
SET fax = SUBSTRING(fax FROM 1 FOR 2) || ' ' || 
                  SUBSTRING(fax FROM 3 FOR 3) || ' ' || 
                  SUBSTRING(fax FROM 6 FOR 3) || ' ' || 
                  SUBSTRING(fax FROM 9 FOR 4)
WHERE LENGTH(fax) > 10;

-- Remover caracteres inválidos dos fax (sem o +)
UPDATE northwind.fornecedores 
SET fax = REGEXP_REPLACE(fax, '[^\d\(\)\-\s]+', '', 'g')
WHERE fax IS NOT NULL;

-- Definir como NULL onde o fax estiver vazio após a limpeza
UPDATE northwind.fornecedores
SET fax = NULL 
WHERE fax = '' OR TRIM(fax) = '';

-- Tabela Funcinarios coluna address
-- Caso 1: Quando o número vem DEPOIS do nome da rua
UPDATE northwind.funcionarios
SET address = REGEXP_REPLACE(address, '^(.+)\s+(\d+)$', '\1, \2')
WHERE address ~ '^[^0-9]+ [0-9]+$';

-- Caso 2: Quando o número vem ANTES do nome 
UPDATE northwind.funcionarios 
SET address = REGEXP_REPLACE(address, '^(\d+)\s+(.+)$', '\2, \1')
WHERE address ~ '^[0-9]+ .+$';

-- Caso 3: Endereços com vírgula mas formato inconsistente 
UPDATE northwind.funcionarios
SET address = REGEXP_REPLACE(address, '^(\d+),\s*(.+)$', '\2, \1')
WHERE address ~ '^\d+,\s*.+$';

-- Remover pontos extras e padronizar
UPDATE northwind.funcionarios  
SET address = INITCAP(LOWER(address));

-- Tabela funcionarios coluna home_phone
-- Remover tudo que não é número, mantendo apenas dígitos
UPDATE northwind.funcionarios
SET home_phone = REGEXP_REPLACE(home_phone, '[^0-9]', '', 'g');

-- Aplicar formato: (XXX) XXX-XXXX para números com 10 dígitos
UPDATE northwind.funcionarios
SET home_phone = '(' || SUBSTRING(home_phone FROM 1 FOR 3) || ') ' || 
                        SUBSTRING(home_phone FROM 4 FOR 3) || '-' || 
                        SUBSTRING(home_phone FROM 7 FOR 4)
WHERE LENGTH(home_phone) = 10;

-- Aplicar formato: (XX) XXXX-XXXX para números com 9 dígitos
UPDATE northwind.funcionarios
SET home_phone = '(' || SUBSTRING(home_phone FROM 1 FOR 2) || ') ' || 
                        SUBSTRING(home_phone FROM 3 FOR 4) || '-' || 
                        SUBSTRING(home_phone FROM 7 FOR 4)
WHERE LENGTH(home_phone) = 9;

-- Formato internacional para números com mais dígitos
UPDATE northwind.funcionarios 
SET home_phone = '+' || SUBSTRING(home_phone FROM 1 FOR 2) || ' ' || 
                        SUBSTRING(home_phone FROM 3 FOR 3) || ' ' || 
                        SUBSTRING(home_phone FROM 6 FOR 3) || ' ' || 
                        SUBSTRING(home_phone FROM 9 FOR 4)
WHERE LENGTH(home_phone) > 10;

-- Remover caracteres inválidos dos telefones
UPDATE northwind.funcionarios 
SET home_phone = REGEXP_REPLACE(home_phone, '[^\d\(\)\-\s]+', '', 'g')
WHERE home_phone IS NOT NULL;

-- Tabela Pedidos coluna address
-- Caso 1: Quando o número vem DEPOIS do nome da rua
UPDATE northwind.pedidos
SET ship_address = REGEXP_REPLACE(ship_address, '^(.+)\s+(\d+)$', '\1, \2')
WHERE ship_address ~ '^[^0-9]+ [0-9]+$';

-- Caso 2: Quando o número vem ANTES do nome 
UPDATE northwind.pedidos 
SET ship_address = REGEXP_REPLACE(ship_address, '^(\d+)\s+(.+)$', '\2, \1')
WHERE ship_address ~ '^[0-9]+ .+$';

-- Caso 3: Endereços com vírgula mas formato inconsistente 
UPDATE northwind.pedidos
SET ship_address = REGEXP_REPLACE(ship_address, '^(\d+),\s*(.+)$', '\2, \1')
WHERE ship_address ~ '^\d+,\s*.+$';

-- Remover pontos extras e padronizar
UPDATE northwind.pedidos  
SET ship_address = INITCAP(LOWER(ship_address));

