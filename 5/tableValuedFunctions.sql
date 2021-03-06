--TABLE VALUED FUNCTION 

CREATE FUNCTION SALESLT.udfCustomerByCity
(@City AS VARCHAR(20))
RETURNS TABLE
AS RETURN
(SELECT C.CUSTOMERID,FIRSTNAME,LASTNAME,ADDRESSLINE1,CITY,STATEPROVINCE
FROM SALESLT.CUSTOMER C JOIN SALESLT.CUSTOMERADDRESS CA
ON C.CUSTOMERID=CA.CUSTOMERID
JOIN SALESLT.ADDRESS A ON CA.ADDRESSID=A.ADDRESSID
WHERE CITY=@City);

SELECT * FROM  SALESLT.udfCustomerByCity('bellevue')

--DERRIVED QUERY
SELECT CATEGORY,COUNT(PRODUCTID) AS PRODUCTS
FROM
(
	SELECT P.PRODUCTID,P.NAME AS PRODUCT,C.NAME AS CATEGORY
	FROM SALESLT.PRODUCT AS P
	JOIN SALESLT.PRODUCTCATEGORY AS C
	ON P.PRODUCTCATEGORYID=C.PRODUCTCATEGORYID 
) AS PRODCATS
GROUP BY CATEGORY
ORDER BY CATEGORY

--Usinf CTE
WITH ProductByCategory (ProductID,ProductName,Category)
AS
(
	SELECT P.PRODUCTID,P.NAME AS PRODUCT,C.NAME AS CATEGORY
	FROM SALESLT.PRODUCT AS P
	JOIN SALESLT.PRODUCTCATEGORY AS C
	ON P.PRODUCTCATEGORYID=C.PRODUCTCATEGORYID 	
)

SELECT CATEGORY,COUNT(ProductID) AS Products
FROM ProductByCategory
GROUP BY CATEGORY
ORDER BY CATEGORY

--cte RECURSION

WITH ORGREPORT (MANAGERID,EMPLOYEEID,EMPLOYEENAME,LEVEL)
AS
(
	--Anchor Query
	SELECT E.MANAGERID,E.EMPLOYEEID,EMPLOYEENAME,0
	FROM SALESLT.EMPLOYEE AS E
	WHERE MANAGERID IS NULL

	UNION ALL

	--Recursive Query
	SELECT E.MANAGERID,E.EMPLOYEEID,E.EMPLOYEENAME,LEVEL+1
	FROM SALESLT.EMPLOYEE AS E
	INNER JOIN ORGREPORT AS O ON E.MANAGERID=O.EMPLOYEEID

)

SELECT * FROM ORGREPORT
OPTION (MAXRECURSION 3)