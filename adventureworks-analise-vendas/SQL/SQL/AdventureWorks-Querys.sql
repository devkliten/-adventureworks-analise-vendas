-- Quantidade de vendas por ano e mes

SELECT month(OrderDate) AS meses,YEAR(OrderDate) AS ano, COUNT(SalesOrderID) AS Quantidade_vendida
FROM sales_salesorderheader
GROUP BY month(OrderDate), YEAR(OrderDate)
ORDER BY ano ASC, meses asc;

-- 10 produtos mais vendidos

SELECT production_product.Name, production_product.ProductID, SUM(sales_salesorderdetail.OrderQty) AS Quantidade_vendida
FROM production_product INNER JOIN sales_salesorderdetail 
ON production_product.ProductID = sales_salesorderdetail.ProductID
GROUP BY  production_product.Name, production_product.ProductID
Order BY Quantidade_vendida DESC;


-- Categorias mais vendidas 

SELECT production_productcategory.Name , SUM(sales_salesorderdetail.OrderQty) AS Quantidade 
FROM production_productsubcategory INNER JOIN production_product 
ON  production_productsubcategory.ProductSubcategoryID = production_product.ProductSubcategoryID
INNER JOIN sales_salesorderdetail 
ON production_product.ProductID = sales_salesorderdetail.ProductID
INNER JOIN production_productcategory 
ON production_productsubcategory.ProductCategoryID = production_productcategory.ProductCategoryID
GROUP BY production_productcategory.Name
ORDER BY Quantidade DESC;

-- Faturamento por ano
SELECT YEAR(sales_salesorderheader.OrderDate) Ano,
ROUND(SUM(sales_salesorderheader.TotalDue)) AS Faturamento_Anual
FROM sales_salesorderheader 
GROUP BY Ano ORDER BY ANO ASC;




