--TEMP TABLES

CREATE TABLE #COLORS
(COLOR VARCHAR(15))

INSERT INTO #COLORS
SELECT DISTINCT COLOR FROM SALESLT.PRODUCT

SELECT * FROM #COLORS

--TABLE VARIABLES

DECLARE @Colors AS TABLE 
(COLOR VARCHAR(15))

INSERT INTO @Colors
SELECT DISTINCT COLOR FROM SALESLT.PRODUCT

SELECT * FROM #COLORS




