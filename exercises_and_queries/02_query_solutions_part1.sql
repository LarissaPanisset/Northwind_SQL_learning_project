-- Exercício 1

select * 
from produtos;

-- Exercício 2

select product_name
from produtos
where unit_price >= 3.5;

-- Exercício 3

select
   contact_name as name,
   address as location
from clientes;

-- Exercício 4

select
   product_name,
   category_name
from categorias
inner join produtos
   on categorias.category_id = produtos.category_id;

-- Exercício 5

select
   last_name,
   first_name,
   shipped_date
from funcionarios as f
inner join pedidos as p
   on f.employee_id = p.employee_id;

-- Exercício 6

select
   last_name,
   first_name,
   order_id
from funcionarios as f
left join pedidos as p
   on f.employee_id = p.employee_id;

-- Exercício 7

select
   last_name,
   first_name,
   birth_date
from funcionarios
order by birth_date desc;

-- Exercício 8

select
    product_name,
    unit_price
from produtos
order by unit_price;

-- Exercício 9

select *
from pedidos
order by ship_city asc, shipped_date desc;

-- Exercício 10 

select
   COUNT (category_id) as number_of_categories
from categorias;

-- Exercício 11

select
   c.customer_id,
   c.contact_name,
   COUNT (p.order_id) as number_of_orders
from clientes as c
inner join pedidos as p
   on c.customer_id = p.customer_id
group by
   c.customer_id,
   c.contact_name;

-- Exercícios 12

select
   p.customer_id,
   p.employee_id,
   SUM(i.unit_price * i.quantity * (1- i.discount)) as total_purchases_price
from pedidos as p
inner join itens_pedidos as i
   on p.order_id = i.order_id
group by p.employee_id, p.customer_id;

-- Exercício 13

select
   last_name,
   first_name
from funcionarios
where hire_date is null;

-- Exercício 14

select
   category_name as name_category,
   AVG(unit_price) as average_price
from categorias as c
inner join produtos as p
   on c.category_id = p.category_id
group by category_name
having AVG(unit_price) > (
   select AVG(unit_price)
   from produtos
);

-- Exercício 15

select
   c.category_name as name_category,
   COUNT(p.product_id) as products_number
from produtos as p
inner join categorias as c
   on p.category_id = c.category_id
where c.category_name <> 'Other'
   and (p.discontinued = 0 or p.discontinued is null )
group by c.category_name
having COUNT(p.product_id) > 1;

-- Exercício 16

select
    COUNT(*) as category_id,
    SUM(units_in_stock) as units_number,
    ROUND(AVG(unit_price), 2) as average_price,
    ROUND(MAX(unit_price) / MIN(unit_price), 2) as max_to_min_ratio,
    ROUND(MAX(unit_price) - AVG(unit_price), 2) as max_to_average,
    ROUND(AVG(unit_price) - MIN(unit_price), 2) as average_to_min
from produtos
where category_id = 1;

