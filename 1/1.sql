use [AdventureWorksLT]

select productID,Name,ListPrice,StandardCost
from [SalesLT].[Product];

select productID,Name,ListPrice,ListPrice-StandardCost as margin
from [SalesLT].[Product];

select productID,Name,ListPrice,ListPrice-StandardCost  margin
from [SalesLT].[Product];

select productID,Name,color, size
from [SalesLT].[Product];

--Anything + null is a null
select productID,Name,color, size,color+size 
from [SalesLT].[Product];

--different data types will not get added. only same and compatible DT will
select productID,Name,color, size,ListPrice+size 
from [SalesLT].[Product];

SELECT * FROM SALESLT.PRODUCT
