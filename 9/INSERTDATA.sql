--DATA INSERTION

CREATE TABLE SALESLT.CallLog
(
	CallId int IDENTITY PRIMARY KEY NOT NULL,
	CallTime datetime NOT NULL DEFAULT GETDATE(),
	SalesPerson nvarchar(256) NOT NULL,
	CustomerID INT NOT NULL REFERENCES SALESLT.Customer(CustomerID),
	PhoneNumber  nvarchar(25) NOT NULL,
	Notes nvarchar(MAX) NULL
);
GO	

INSERT INTO SALESLT.CallLog 
VALUES ('2015-01-01T12:30:00','adventure-works\pamela0',1,'132-465-7890','Returning call : Test Data');

select * from SALESLT.CallLog 

--Inserting default values
INSERT INTO SALESLT.CallLog 
VALUES (DEFAULT,'adventure-works\david80',2,'888-465-7890',NULL);

INSERT INTO SALESLT.CallLog (SalesPerson,CustomerID,PhoneNumber)
VALUES ('adventure-works\david80',2,'999-465-7890');

INSERT INTO SALESLT.CallLog 
VALUES 
	(DATEADD(mi,-2,GETDATE()),'adventure-works\david81',4,'999-465-7890',null),
	(DEFAULT,'adventure-works\david82',5,'999-465-7890',null)

INSERT INTO SALESLT.CallLog (SalesPerson,CustomerID,PhoneNumber,NOTES)
SELECT SALESPERSON,CUSTOMERID,PHONE,'SALES PROMOTON CALL'
FROM SALESLT.CUSTOMER
WHERE COMPANYNAME='BIG-TIME BIKE STORE'

--GET SCOPE IDENTITY
INSERT INTO SALESLT.CallLog (SalesPerson,CustomerID,PhoneNumber)
VALUES ('adventure-works\david85',3,'999-465-7890');

SELECT SCOPE_IDENTITY()

SET IDENTITY_INSERT SALESLT.CALLLOG ON;

INSERT INTO SALESLT.CallLog (CallId,SalesPerson,CustomerID,PhoneNumber)
VALUES (15,'adventure-works\david86',10,'999-465-7890');

SET IDENTITY_INSERT SALESLT.CALLLOG OFF;

