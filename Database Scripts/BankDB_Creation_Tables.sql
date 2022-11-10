/*
Filename: BankDB_Creation_Tables.sql
Programmer: Stefan Reesberg
Description: This script will create a database and the necessary tables.
*/

Use master
GO

--Creation
CREATE DATABASE BillionBanks
ON Primary
	(NAME = 'BillionBanks',
	 FILENAME = 'C:\Users\stefa\OneDrive\Desktop\C Adv SQL version\Database Files\BillionBanks_data.mdf',
	 SIZE = 5MB,
	 FILEGROWTH = 10%)

LOG ON
	(NAME = 'BillionBanks_Log',
	 FILENAME = 'C:\Users\stefa\OneDrive\Desktop\C Adv SQL version\Database Files\BillionBanks_Log.ldf',
	 SIZE = 5MB,
	 FILEGROWTH = 10%)
GO

--Creation of tables
USE BillionBanks
GO

CREATE TABLE [User](
	userID VARCHAR(13) NOT NULL,
	userName VARCHAR(45) NOT NULL,
	userSurname VARCHAR(45) NOT NULL,
	userEmail VARCHAR(45) NOT NULL,
	userContactNumber VARCHAR(10) NOT NULL,
	userSecretQuestion VARCHAR(100) NOT NULL,
	userSecretAnswer VARCHAR(100) NOT NULL,
	userPhysicalAddress VARCHAR(45) NOT NULL,
	userPassword VARCHAR(45) NOT NULL,
	CONSTRAINT UserID_PK PRIMARY KEY(userID),
	CONSTRAINT UserID_UNIQUE UNIQUE(userID),
	CONSTRAINT UserEmail_UNIQUE UNIQUE(userEmail)

)
GO

PRINT 'User table created.'
GO

CREATE TABLE Account(
	accountNumber INT IDENTITY,
	creationDate DATETIME,
	currentBalance MONEY,
	accountType VARCHAR(15),
	userID VARCHAR(13),
	PRIMARY KEY(accountNumber),
	CONSTRAINT UserID_FK FOREIGN KEY (userID) REFERENCES [User](userID)

)
GO

PRINT 'Account table created.'
GO

CREATE TABLE Transactions(
	transactionID INT IDENTITY,
	sourceAccount VARCHAR(45),
	destinationAccount VARCHAR(45),
	transferAmount MONEY,
	accountNumber INT,
	PRIMARY KEY(transactionID),
	CONSTRAINT AccountNumber_FK FOREIGN KEY (accountNumber) REFERENCES Account(accountNumber)

)
GO

PRINT 'Transactions table created.'
GO

	

