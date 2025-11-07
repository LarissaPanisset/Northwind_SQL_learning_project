## **Exercícios de SQL para o banco de dados Northwind**

### **1. Consultas de tabela única**

Para começar, o básico: filtrar e recuperar dados de uma única tabela. Nesses exercícios, usaremos as cláusulas  **`SELECT`** e **`WHERE`** para extrair informações específicas de tabelas individuais. O domínio desses comandos SQL essenciais estabelecerá uma base sólida para a criação de consultas mais complexas posteriormente.

**Exercício 1: Todos os produtos**: Exiba todos os dados presentes na tabela **`produtos`**.

**Exercício 2: Produtos mais caros do que 3,5**: Exiba os nomes dos produtos com um preço unitário maior ou igual a 3,5.

**Exercício 3: Nomes e e-mails de clientes**: Exiba os nomes e os e-mails dos clientes. Você encontrará o nome na coluna **`contact_name`** e o e-mail na coluna **`address`** da tabela **`clientes`** tabela. Renomeie as colunas para **`name`** e **`location`**, respectivamente.

### **2. Consultas de várias tabelas**

Esta seção se concentra na combinação de dados de diferentes tabelas usando **`JOINs`**; isso nos permite criar consultas mais complexas.

**Exercício 4: Produto e categorias**: Selecione os nomes dos produtos junto com suas categorias. Renomeias: **`product_name`** e **`category_name`**.

**Exercício 5: Funcionários e compras, parte 1**: Mostre o sobrenome e o nome dos funcionários que estão lidando com as compras, juntamente com o endereço **`shipped_date`** da compra.

**Exercício 6: Funcionários e compras, parte 2**: Para cada funcionário, exiba os endereços, **`last_name`**, **`first_name`** e o ID da(s) compra(s) com a(s) qual(is) ele lidou (se houver). Certifique-se de exibir os dados de todos os funcionários, mesmo que eles não tenham se envolvido com nenhuma compra.

### **3. ORDER BY: Classificando seus resultados**

A cláusula **`ORDER BY`** no SQL é particularmente útil para organizar os resultados de forma mais legível e significativa. Se você quiser classificar os dados numericamente, alfabeticamente ou por data, isso é muito útil em relatórios e análises.

**Exercício 7: Funcionários por data de nascimento**: Mostre os sobrenomes, os nomes e as datas de nascimento dos funcionários. Classifique os funcionários por data de nascimento em ordem decrescente (ou seja, as datas mais recentes vêm primeiro).

**Exercício 8: Nomes e preços dos produtos**: Exiba os nomes e os preços unitários de todos os produtos. Mostre os produtos mais baratos primeiro.

**Exercício 9: Dados de compra**: Mostre todos os dados de todos os pedidos. Classifique as linhas pela cidade de envio em ordem crescente e pela data de envio em ordem decrescente.

### **4. Funções GROUP BY e Aggregate**

A próxima seção ajuda a desenvolver a habilidade de resumir dados por meio de agrupamento e agregação. Usando funções de agregação, podemos obter insights combinando linhas e realizando cálculos dentro de cada grupo.

**Exercício 10: Número de categorias**: Conte o número de categorias presentes na tabela **`categorias`** tabela. Nomeie a coluna **`number_of_categories`**.

**Exercício 11: Compras de clientes**: Conte o número de compras feitas por cada cliente. Exiba as colunas **`customer_id`** **`contact_name`** e  **`number_of_orders`**. Ignore os clientes que não estiverem presentes na tabela **`pedidos`** .

**Exercício 12: Receita para pares de clientes e funcionários**: Para cada cliente e funcionário, encontre o preço total de todas as compras que eles fizeram às quais um determinado funcionário está atribuído. Exiba três colunas: **`customer_id`**, **`employee_id`**, e o preço total das compras. Renomeie a terceira coluna para **`total_purchases_price`**.

### **5. Outros recursos SQL**

**Exercício 13: Data de contratação desconhecida**: Exibir o sobrenome e o nome dos funcionários com data de contratação desconhecida.

**Exercício 14: Preço médio por categoria**: Para cada categoria, conte o preço médio de seus produtos. Exiba somente as categorias para as quais o preço unitário médio é maior que o preço unitário médio geral. Nomeie as colunas  **`name_category`** e  **`average_price`**.

### **6. SQL Avançado Recursos**

Por fim, algumas consultas SQL mais avançadas. Ao fazermos isso, faremos referência às funções que vimos anteriormente.

**Exercício 15: Categorias com produtos ativos**: Para cada categoria, exiba o número de seus produtos que não foram descontinuados (eles continuam ou há um **`NULL`** na coluna **`discontinued`** ). Mostre as colunas denominadas **`name_category`**   e **`products_number`**. Mostre somente as linhas para as quais o número de tais produtos é maior que 1. Além disso, não mostre a linha para a categoria Other.

**Exercício 16: Estatísticas da categoria Grãos e Cereais**: A categoria grãos e cereais na tabela de produtos têm category_id igual a 1. Encontre o:

- Número de produtos desse tipo na tabela (**`products_number`**).
- Número total de unidades em estoque (**`units_number`**).
- Preço médio do produto (**`average_price`**).
- Razão entre o preço máximo e o preço mínimo (**`max_to_min_ratio`**).
- Diferença entre o preço máximo e o preço médio ( **`max_to_average`**).
- Diferença entre o preço médio e o preço mínimo (**`average_to_min`**).

Arredonde as quatro últimas colunas para duas casas decimais.
