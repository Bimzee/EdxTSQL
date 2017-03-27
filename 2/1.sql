USE [ADVENTUREWORKSLT]

SELECT  ISNULL(COLOR,'None' ) AS COLOR FROM SALESLT.PRODUCT

SELECT DISTINCT ISNULL(COLOR,'None' ) AS COLOR FROM SALESLT.PRODUCT

SELECT DISTINCT ISNULL(COLOR,'None' ) AS COLOR FROM SALESLT.PRODUCT ORDER BY COLOR

SELECT TOP 20 PRODUCTID,NAME,LISTPRICE FROM SALESLT.PRODUCT ORDER BY LISTPRICE DESC

--SELECT DATA IN PAGING FORMAT USING OFFSET ROWS FETCH
SELECT PRODUCTID,NAME,LISTPRICE FROM SALESLT.PRODUCT ORDER BY LISTPRICE DESC OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY
SELECT PRODUCTID,NAME,LISTPRICE FROM SALESLT.PRODUCT ORDER BY LISTPRICE DESC OFFSET 10 ROWS FETCH NEXT 10 ROWS ONLY
SELECT PRODUCTID,NAME,LISTPRICE FROM SALESLT.PRODUCT ORDER BY LISTPRICE DESC OFFSET 20 ROWS FETCH NEXT 15 ROWS ONLY