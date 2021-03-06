
--BASIC INNER JOIN
SELECT SALESLT.PRODUCT.NAME AS PRODNAME,SALESLT.PRODUCTCATEGORY.NAME AS CG
FROM SALESLT.PRODUCT
INNER JOIN SALESLT.PRODUCTCATEGORY
ON SALESLT.PRODUCT.ProductCategoryID=SALESLT.PRODUCTCATEGORY.ProductCategoryID


--OUTER JOIN
--GET ALL CUSTOMERS WITH SALES ORDERS FOR THOSE WHO HAVE BOUGHT ANYTHING
SELECT c.FIRSTNAME,C.LASTNAME,oh.SALESORDERNUMBER
FROM SALESLT.CUSTOMER AS c
LEFT OUTER JOIN  SALESLT.SALESORDERHEADER oh
ON c.CUSTOMERID=oh.CUSTOMERID
ORDER BY c.CUSTOMERID

--GET ALL CUSTOMERS WHO HAVENT BOUGHT ANYTHING
SELECT c.FIRSTNAME,C.LASTNAME,oh.SALESORDERNUMBER
FROM SALESLT.CUSTOMER AS c
LEFT OUTER JOIN  SALESLT.SALESORDERHEADER oh
ON c.CUSTOMERID=oh.CUSTOMERID
WHERE oh.SALESORDERNUMBER IS  NULL
ORDER BY c.CUSTOMERID

--MORE THAN 2 TABLES IN OUTER JOIN
SELECT P.NAME AS PRODUCT_NAME, OH.SALESORDERNUMBER
FROM SALESLT.PRODUCT AS P
LEFT JOIN SALESLT.SALESORDERDETAIL AS OD
ON P.PRODUCTID=OD.PRODUCTID
LEFT JOIN SALESLT.SALESORDERHEADER AS OH
ON OD.SALESORDERID=OH.SALESORDERID
ORDER BY P.PRODUCTID

--CROSS JOIN
SELECT P.NAME,C.FIRSTNAME,C.LASTNAME,C.PHONE
FROM SALESLT.PRODUCT AS P
CROSS JOIN SALESLT.CUSTOMER C
ORDER BY C.LASTNAME

--SELT JOIN
--COMPARE 1(EACH) ROW WITH ALL OTHER ROWS IN THE SAME TABLE
CREATE TABLE SALESLT.EMPLOYEE
(EmployeeId INT PRIMARY KEY IDENTITY,
EmployeeName nvarchar(256),
ManagerID int)

INSERT INTO SALESLT.EMPLOYEE(EmployeeName,ManagerId)
SELECT DISTINCT SalesPerson, NULLIF(CAST(RIGHT(SalesPerson,1) AS INT),0)
FROM SALESLT.CUSTOMER;
GO
UPDATE SALESLT.EMPLOYEE
SET MANAGERID=(SELECT MIN(EMPLOYEEID) FROM SALESLT.EMPLOYEE WHERE MANAGERID IS NULL)
WHERE MANAGERID IS NULL
AND EMPLOYEEID > (SELECT MIN(EMPLOYEEID) FROM SALESLT.EMPLOYEE WHERE MANAGERID IS NULL)
GO

SELECT * FROM SALESLT.EMPLOYEE

	--ACTUAL SELF JOIN
SELECT E.EMPLOYEENAME, M.EMPLOYEENAME AS MANAGERNAME
FROM SALESLT.EMPLOYEE AS E
LEFT JOIN SALESLT.EMPLOYEE AS M
ON E.MANAGERID=M.EMPLOYEEID
ORDER BY E.MANAGERID
