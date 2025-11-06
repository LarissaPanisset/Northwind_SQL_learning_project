-- Exercício 1

select
   category_name,
   description
from categorias;

-- Exercício 2

select
   contact_name,
   customer_id,
   company_name
from clientes
where city = 'London';

-- Exercício 3

select *
from fornecedores
where fax is not null;

-- Exercício 4

select
   order_id
from pedidos
where shipped_date BETWEEN '1997-01-01' and '1998-01-01' and freight < 100;

-- Exercíco 5

select
   company_name,
   contact_name
from clientes
where country in ('México D.F.', 'Sweden', 'Germany') and contact_title = 'Owner';

-- Exercício 6

select
   COUNT(*)
from produtos
where discontinued = 1;

-- Exercício 7

select
   category_name,
   description
from categorias
where category_name like 'Co%';

-- Exercício 8

select
   company_name,
   city,
   country,
   postal_code
from fornecedores
where address like '%Rue%'
order by company_name;

-- Exercício 9

select
   product_id,
   SUM(quantity) as total_quantity
from itens_pedidos
group by product_id;

-- Exercício 10

select
   contact_name,
   contact_name,
   contact_title,
   region
from fornecedores
where region is not null;

-- Exercício 11

select
   p.product_name
from produtos as p
inner join categorias as c
   on p.category_id = c.category_id
where c.category_name = 'Condiments';

-- Exercício 12

select
   c.contact_name
from clientes as c
left join pedidos as p
   on c.customer_id = p.customer_id
where p.customer_id is null;

-- Exercício 13

insert into clientes(
       customer_id, company_name, contact_name, contact_title,
       address, city, region, postal_code, country, phone, fax
)
values (
       'MAMAI', 'Mamai y Papa', 'Larissa Panisset', 'Owner',
       'Rua Pastel de Frango, 45', 'Rio de Janeiro', 'RJ', '1280',
       'Brazil', '(00) 00000-0000', '(00) 00000-0000'
);

-- Exercício 14

update clientes
set contact_name = 'Panisset'
where customer_id = 'MAMAI';

-- Exercício 15

delete from clientes
where customer_id = 'MAMAI';

-- Exercício 16

select
   CONCAT(last_name, ', ', first_name) as Display_Name
from funcionarios;

-- Exercício 17

select
   product_name,
   units_in_stock as total_units
from produtos
where units_in_stock > 100;




   
   
   

