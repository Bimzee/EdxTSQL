--VIEWS

CREATE VIEW SALESLT.vCustomerAddress
AS
SELECT C.CUSTOMERID, FIRSTNAME,LASTNAME,ADDRESSLINE1,CITY,STATEPROVINCE
FROM
SALESLT.CUSTOMER C JOIN SALESLT.CUSTOMERADDRESS CA
ON C.CUSTOMERID=CA.CUSTOMERID
JOIN SALESLT.ADDRESS A
ON CA.ADDRESSID=A.ADDRESSID

SELECT * FROM SALESLT.VCUSTOMERADDRESS