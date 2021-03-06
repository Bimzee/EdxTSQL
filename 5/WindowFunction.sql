--WINDOW FUNCTIONS

SELECT TOP(100) PRODUCTID, NAME, LISTPRICE,
	RANK()OVER(ORDER BY LISTPRICE DESC) AS RANKBYPRICE
FROM SALESLT.PRODUCT 
ORDER BY RANKBYPRICE

SELECT C.NAME AS CATEGORY, P.NAME AS PRODUCT, LISTPRICE,
	RANK() OVER(PARTITION BY C.NAME ORDER BY LISTPRICE DESC) AS RANKBYPRICE
FROM SALESLT.PRODUCT AS P
JOIN SALESLT.PRODUCTCATEGORY AS C
ON P.PRODUCTCATEGORYID=C.PRODUCTCATEGORYID
ORDER BY CATEGORY,RANKBYPRICE
