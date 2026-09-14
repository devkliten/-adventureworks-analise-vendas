
CREATE VIEW vw_fato_vendas AS
SELECT OrderDate, SalesOrderID, CustomerID,SalesPersonID,TotalDue,TerritoryID
FROM sales_salesorderheader;

CREATE VIEW vw_fato_itens_venda AS
SELECT SalesOrderID, SalesOrderDetailID, OrderQty,ProductID
FROM sales_salesorderdetail;


CREATE VIEW vw_dim_produtos AS
SELECT production_product.ProductID , production_product.Name AS NomeProduto, 
production_productcategory.ProductCategoryID,production_productcategory.Name AS NomeCategoria,
production_productsubcategory.ProductSubcategoryID,
production_productsubcategory.Name AS NomeSubcategoria
FROM production_product LEFT JOIN production_productsubcategory
ON production_product.ProductSubcategoryID  = production_productsubcategory.ProductSubcategoryID
LEFT JOIN production_productcategory 
ON production_productcategory.ProductCategoryID = production_productsubcategory.ProductCategoryID;

CREATE VIEW vw_dim_clientes AS
SELECT person_person.BusinessEntityID, person_person.FirstName,person_person.LastName,
sales_customer.CustomerID, sales_customer.PersonID, sales_customer.StoreID,sales_customer.TerritoryID
FROM sales_customer LEFT JOIN person_person
ON sales_customer.PersonID = person_person.BusinessEntityID;


CREATE VIEW vw_dim_vendedores AS
SELECT person_person.BusinessEntityID, person_person.FirstName, person_person.LastName,
sales_salesperson.TerritoryID
FROM sales_salesperson INNER JOIN person_person   
ON sales_salesperson.BusinessEntityID = person_person.BusinessEntityID;


SELECT person_person.FirstName,person_person.BusinessEntityID, SUM(sales_salesorderheader.TotalDue) AS Valor_vendido
FROM person_person INNER JOIN sales_salesorderheader
ON person_person.BusinessEntityID = sales_salesorderheader.SalesPersonID
GROUP BY person_person.FirstName,person_person.BusinessEntityID
ORDER BY Valor_vendido desc;




