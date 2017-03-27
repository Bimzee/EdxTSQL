--HAVING

/*
Key Points

    You can use GROUP BY with aggregate functions to return aggregations grouped by one or more columns or expressions.
    All columns in the SELECT clause that are not aggregate function expressions must be included in a GROUP BY clause.
    The order in which columns or expressions are listed in the GROUP BY clause determines the grouping hierarchy.
    You can filter the groups that are included in the query results by specifying a HAVING clause.

*/

SELECT PRODUCTID,SUM(SOD.ORDERQTY) AS QUANTITY
FROM SALESLT.SALESORDERDETAIL AS SOD
JOIN SALESLT.SALESORDERHEADER AS SOH
ON SOD.SALESORDERID=SOH.SALESORDERID
WHERE YEAR(SOH.ORDERDATE)=2008  --AGGREGATE FUNCTIONS CANNOT BE USED WITH WHERE CLAUSE
GROUP BY PRODUCTID
HAVING SUM(SOD.ORDERQTY)>50