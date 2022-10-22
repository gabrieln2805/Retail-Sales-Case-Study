1# Find the maximum quantity sold in a transaction
select max (quantity) quantity, count (*) count
from [dbo].[TR_OrderDetails$];

2# Unique number of products

SELECT DISTINCT ProductID, Quantity
FROM [dbo].[TR_OrderDetails$]
where Quantity = 3
ORDER BY ProductID asc, Quantity desc;

3# Find unique properties
select distinct PropertyId from [dbo].[TR_OrderDetails$];

4# Product category that has maximum products

select ProductCategory, count (*)
from [dbo].[TR_Products$]
group by ProductCategory
order by 2 desc;


#5 Find the state where most stores are present

select * from [dbo].[TR_PropertyInfo$];

select PropertyState, count (*)
from [dbo].[TR_PropertyInfo$]
group by PropertyState
order by 2 desc;

#6 Find the top 5 product ids that did maximum sales in terms of qnty

select * from [dbo].[TR_OrderDetails$];

select ProductID, SUM(Quantity) TotalQuantity
from [dbo].[TR_OrderDetails$]
group by ProductID
order by 2 DESC;

#7 Find the top 5 product names that did maximum sales in terms of quantity, then find the top 5 products that did maximum sales.

SELECT p.ProductName, SUM(o.Quantity) TotalQuantity
FROM [dbo].[TR_OrderDetails$] as o
left join [dbo].[TR_Products$] p on o.ProductID=p.ProductID
group by p.ProductName
order by 2 DESC;

#7.1 then find the top 5 products that did maximum sales.

select p.ProductName, SUM(o.Quantity * p.Price) as Sales
FROM [dbo].[TR_OrderDetails$] as o
left join [dbo].[TR_Products$] p on o.ProductID=p.ProductID
group by p.ProductName
order by Sales desc;

#8 
select * from [dbo].[TR_PropertyInfo$];

select pi.PropertyCity, SUM(o.Quantity * p.Price) as Sales
FROM [dbo].[TR_OrderDetails$] as o
left join [dbo].[TR_PropertyInfo$] as pi on o.PropertyID=pi.[Prop ID]
left join [dbo].[TR_Products$] p on o.ProductID=p.ProductID
group by pi.PropertyCity
order by Sales desc;

7# Find the top 5 products in each of the cities

select pi.PropertyCity, 
p.ProductName,
SUM(o.Quantity * p.Price) as Sales
FROM [dbo].[TR_OrderDetails$] as o
left join [dbo].[TR_PropertyInfo$] as pi on o.PropertyID=pi.[Prop ID]
left join [dbo].[TR_Products$] p on o.ProductID=p.ProductID
where pi.PropertyCity = 'Arlington'
group by pi.PropertyCity, p.ProductName
order by Sales desc;

