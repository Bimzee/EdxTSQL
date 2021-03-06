--GROUPING SET

/*
    Use GROUPING SETS to define custom groupings.
    Use ROLLUP to include subtotals and a grand total for hierarchical groupings.
    Use CUBE to include all possible groupings.
*/


SELECT CAT.PARENTPRODUCTCATEGORYNAME, CAT.PRODUCTCATEGORYNAME,COUNT(PRD.PRODUCTID) AS PRODUCT
FROM [SalesLT].[vGetAllCategories] AS CAT
LEFT JOIN SALESLT.PRODUCT AS PRD
ON PRD.PRODUCTCATEGORYID=CAT.PRODUCTCATEGORYID
--GROUP BY CAT.PARENTPRODUCTCATEGORYNAME,CAT.PRODUCTCATEGORYNAME

--GROUP BY GROUPING SETS( CAT.PARENTPRODUCTCATEGORYNAME,CAT.PRODUCTCATEGORYNAME,())
--GROUP BY ROLLUP( CAT.PARENTPRODUCTCATEGORYNAME,CAT.PRODUCTCATEGORYNAME)
GROUP BY CUBE( CAT.PARENTPRODUCTCATEGORYNAME,CAT.PRODUCTCATEGORYNAME)

ORDER BY CAT.PARENTPRODUCTCATEGORYNAME,CAT.PRODUCTCATEGORYNAME