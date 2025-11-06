-- Exercício 1

select
    last_name,
    first_name,
    address,
    city,
    region
from funcionarios;

-- Exercício 2

select
    last_name,
    first_name,
    address,
    city,
    region
from funcionarios
where country = 'USA';

-- Exercício 3

select
    last_name,
    first_name,
    address,
    city,
    region
from funcionarios
where birth_date <= CURRENT_DATE - interval '50 years';

-- Exercício 4

select
    f.last_name,
    f.first_name,
    f.address,
    f.city,
    f.region
from funcionarios as f
inner join pedidos as p on f.employee_id = p.employee_id
where p.ship_country = 'Belgium';

-- Exercício 5

select
    f.last_name,
    f.first_name,
    f.title
from funcionarios as f
inner join pedidos as pe on pe.employee_id = f.employee_id
inner join itens_pedidos as i on i.order_id = pe.order_id
inner join produtos as p on i.product_id = p.product_id
where p.product_name in ('Gravad Lax', 'Mishi Kobe Niku');

-- Exercíco 6

select
    c.contact_name,
    p.product_name,
    f.contact_name
from clientes as c
inner join pedidos as pe on pe.customer_id = c.customer_id
inner join itens_pedidos as i on i.order_id = pe.order_id
inner join produtos as p on p.product_id = i.product_id
inner join fornecedores as f on f.supplier_id = p.supplier_id
where c.city = 'London' 
    and f.company_name in ('Pavlova, Ltd.', 'Karkki Oy');

-- Exercício 7

select
    p.product_name
from produtos as p
inner join itens_pedidos as i on i.product_id = p.product_id
inner join pedidos as pe on pe.order_id = i.order_id
inner join clientes as c on c.customer_id = pe.customer_id
where c.city = 'London';

-- Exercício 8

-- A
select
    last_name,
    first_name
from funcionarios
where birth_date < any (
    select birth_date
    from funcionarios
    where city = 'London'
);

-- B
select
    last_name,
    first_name
from funcionarios
where birth_date < all (
    select birth_date
    from funcionarios
    where city = 'London'
);

-- Exercício 9

select
    last_name,
    first_name
from funcionarios
where hire_date > all(
    select hire_date
    from funcionarios
    where city = 'London'
);

-- Exercício 10

select distinct
    f.last_name,
    f.first_name,
    f.city
from funcionarios as f
inner join pedidos as p on p.employee_id = f.employee_id
inner join clientes as c on c.customer_id = p.customer_id
where f.city = c.city;

-- Exercício 11

select
    contact_name
from clientes as c
left join pedidos as p on c.customer_id = p.customer_id
where p.customer_id is null;

-- Exercício 12

select
    c.contact_name
from clientes as c
inner join pedidos as p on c.customer_id = p.customer_id
inner join itens_pedidos as i on i.order_id = p.order_id
inner join produtos as pr on pr.product_id = i.product_id
group by c.customer_id, c.contact_name
having max(pr.unit_price) < 50;

-- Exercício 13

select
    p.product_name
from produtos as p
inner join itens_pedidos as i on i.product_id = p.product_id
inner join pedidos as pe on pe.order_id = i.order_id
group by p.product_name
having count(distinct pe.employee_id) = (
    select count(*)
    from funcionarios
);

-- Exercício 14

select c.contact_name
from clientes as c
where not exists (
    select i.product_id
    from clientes as c1
    inner join pedidos as p1 on p1.customer_id = c1.customer_id
    inner join itens_pedidos as i1 on i1.order_id = p1.order_id
    where c1.contact_name = 'LAZYK'
        and i1.product_id not in (
            select i2.product_id
            from pedidos as p2
            inner join itens_pedidos as i2 on i2.order_id = p2.order_id
            where p2.customer_id = c1.customer_id
        )
)
and not exists (
    select i3.product_id
    from pedidos as p3
    inner join itens_pedidos as i3 on i3.order_id = p3.order_id
    where p3.customer_id = c3.customer_id
        and i3.product_id not in (
            select i4.product_id
            from clientes as c4
            inner join pedidos as p4 on p4.customer_id = c4.customer_id
            inner join itens_pedidos as i4 on i4.order_id = p4.order_id
            where c4.contact_name = 'LAZYK'
        )
)
and c.contact_name != 'LAZYK';

-- Exercício 15

select
    c.category_name,
    avg(p.unit_price) as average_price
from categorias as c
inner join produtos as p on p.category_id = c.category_id
group by c.category_id;

-- Exercício 16

select
    f.supplier_id,
    f.company_name,
    count(p.product_id) as quantities_of_products
from fornecedores as f
inner join produtos as p on p.supplier_id = f.supplier_id
group by f.supplier_id, f.company_name
having count(p.product_id) > 3;

-- Exercício 17

select
    f.employee_id,
    f.last_name,
    f.first_name,
    count(p.order_id) as quantities_of_order
from funcionarios as f
left join pedidos as p on p.employee_id = f.employee_id
group by f.employee_id, f.last_name, f.first_name
order by f.employee_id;

-- Exercício 18

select
    f.employee_id,
    f.last_name,
    f.first_name,
    count(distinct i.product_id) as unique_products_sold
from funcionarios as f
left join pedidos as p on p.employee_id = f.employee_id
left join itens_pedidos as i on i.order_id = p.order_id
group by f.employee_id, f.last_name, f.first_name
order by f.employee_id;

-- Exercício 19

select
    f.employee_id,
    f.last_name,
    f.first_name,
    count(p.order_id) as total_sales
from funcionarios as f
left join pedidos as p on p.employee_id = f.employee_id
left join itens_pedidos as i on i.order_id = p.order_id
group by f.employee_id, f.last_name, f.first_name
having count(distinct i.product_id) > 70
order by f.employee_id;

-- Exercício 20

select
    f.last_name,
    f.first_name
from funcionarios as f
left join pedidos as p on p.employee_id = f.employee_id
left join itens_pedidos as i on i.order_id = p.order_id
left join produtos as pr on pr.product_id = i.product_id
group by f.last_name, f.first_name
having count(distinct pr.supplier_id) > 7;

-- Exercício 21

create view Average_Quantity_Product as
select
    i.product_id,
    avg(i.quantity) as average_quantity
from itens_pedidos as i
inner join pedidos as p on i.order_id = p.order_id
inner join clientes as c on p.customer_id = c.customer_id
group by i.product_id;

select distinct
    c.contact_name,
    pr.product_name
from clientes as c
inner join pedidos as p on c.customer_id = p.customer_id
inner join itens_pedidos as i on p.order_id = i.order_id
inner join Average_Quantity_Product as av on i.product_id = av.product_id
inner join produtos as pr on i.product_id = pr.product_id
where i.quantity > 5 * av.average_quantity
group by c.contact_name, pr.product_name;





