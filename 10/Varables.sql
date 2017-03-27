--variabe

DECLARE @CITY NVARCHAR(20)='TORONTO'

--Go defines the scope of variables
/*
	A batch defines a group of Transact-SQL command submitted by a client application for execution.
	Some commands can only be executed at the start of a new batch, and variable values cannot span batches.
*/
--GO

SELECT FIRSTNAME,ADDRESSLINE1 AS ADDRESS,CITY
FROM SALESLT.CUSTOMER AS C
JOIN SALESLT.CUSTOMERADDRESS CA
ON C.CUSTOMERID=CA.CUSTOMERID
JOIN SALESLT.ADDRESS A
ON CA.ADDRESSID=A.ADDRESSID
WHERE CITY=@CITY

declare @result money
select @result=max(totaldue)
from saleslt.salesorderheader

print @result