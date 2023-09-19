--1
CREATE DATABASE AZbank
GO
USE AZbank;
GO
--2
CREATE TABLE Customer(
	CustomerId int PRIMARY KEY NOT NULL,
	Name nvaRchar(50) NULL,
	City nvarchar(50) NULL,
	Country nvarchar(50) NULL,
	Phone nvaRchar(15) NULL,
	Email nvarchar(50) NULL,
	)
	GO
	CREATE TABLE CustomerAccount(
	AccountNumber char(9) PRIMARY KEY NOT NULL,
	CustomerId int NOT NULL,
	FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
	Balance money NOT NULL,
	MinAccount money NULL,
	)
	GO
	CREATE TABLE CustomerTransaction(
	TransactionId int PRIMARY KEY NOT NULL,
	AccountNumber char(9) NULL,
	FOREIGN KEY (AccountNumber) REFERENCES CustomerAccount(AccountNumber),
	TransactionDate smalldatetime NULL,
	Amount money NULL,
	DepositorWithdraw bit NULL,
	)
	GO
	--3
	INSERT INTO Customer VALUES (27,'Minh','Hanoi','Vietnam',098764534,'asd@gmail.com');
	INSERT INTO Customer VALUES (35,'Khai','HCM','Vietnam',024424534,'dad@gmail.com');
	INSERT INTO Customer VALUES (29,'Long','ThanhHoa','Vietnam',0987343534,'zxc@gmail.com');
	GO

	INSERT INTO CustomerAccount  VALUES (10,27,1113.34,3345);
	INSERT INTO CustomerAccount  VALUES (112,35,145.45,554);
	INSERT INTO CustomerAccount  VALUES (102,29,13.543,2342);
	GO
	INSERT INTO CustomerTransaction VALUES(3,10,'2022-12-2',1100,1);
	INSERT INTO CustomerTransaction VALUES(65,112,'2024-12-2',12200,1);
	INSERT INTO CustomerTransaction VALUES(43,102,'2023-6-2',1000,1);
	GO
	--4
	SELECT*FROM Customer 
	WHERE City='Hanoi';	
	GO
	--5
	SELECT Customer.Name,Customer.Phone,Customer.Email,CustomerAccount.AccountNumber,CustomerAccount.Balance
	FROM Customer
	LEFT JOIN CustomerAccount ON Customer.CustomerId= CustomerAccount.CustomerId
	GO
	--6
	ALTER TABLE CustomerTransaction
	ADD CONSTRAINT CHECK_Amount CHECK (Amount > 0 AND Amount <= 1000000);
	GO
	--7
	CREATE VIEW vCustomerTransactions AS
	SELECT V.Name,X.AccountNumber,X.TransactionDate,X.Amount,X.DepositorWithdraw
	FROM Customer V
	INNER JOIN CustomerAccount Z ON V.CustomerId=Z.CustomerId
	INNER JOIN CustomerTransaction X ON Z.AccountNumber=X.AccountNumber;
	GO
	SELECT*FROM vCustomerTransactions;