PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Product_dim" (
	"ProductID"	INT,
	"ProductName" NVARCHAR(200) NOT NULL,
	"Manufacturer" NVARCHAR(200) NOT NULL,
	"Category" NVARCHAR(200) NOT NULL,
	"PurchasePrice" MONEY NOT NULL,
	PRIMARY KEY("ProductID")
);
CREATE TABLE IF NOT EXISTS "Buyers_dim" (
    "BuyerID" INT,
    "FirstName" NVARCHAR(150) NOT NULL,
    "LastName" NVARCHAR(150) NOT NULL,
	"City" NVARCHAR(150) NOT NULL,
	"PhoneNumber" NVARCHAR(150) NOT NULL,
    "Email" NVARCHAR(50) UNIQUE NOT NULL,
	"Birthdate"  DATE NOT NULL,
	PRIMARY KEY("BuyerID")
);
CREATE TABLE IF NOT EXISTS "Employees_dim" (
    "EmployeeID" INT,
    "FirstName" NVARCHAR(150) NOT NULL,
    "LastName" NVARCHAR(150) NOT NULL,
	"PhoneNumber" NVARCHAR(150) NOT NULL,
    "PassportNumber" NVARCHAR(50) UNIQUE NOT NULL,
	"Birthdate"  DATE NOT NULL,
	PRIMARY KEY("EmployeeID")
);
CREATE TABLE IF NOT EXISTS "Delivery_dim" (
    "DeliveryID" INT,
    "DeliveryType" NVARCHAR(150) NOT NULL,
	PRIMARY KEY("DeliveryID")
);
CREATE TABLE IF NOT EXISTS "Payment_dim" (
    "PaymentID" INT,
    "PaymentType" NVARCHAR(150) NOT NULL,
	PRIMARY KEY("PaymentID")
);
CREATE TABLE IF NOT EXISTS "Shops_dim" (
    "ShopID" INT,
    "ShopName" NVARCHAR(200) NOT NULL,
	"City" NVARCHAR(150) NOT NULL,
	PRIMARY KEY("ShopID")
);
CREATE TABLE IF NOT EXISTS "Sale_fact" (
    "SaleID" INT,
    "ProductID" INT,
    "BuyerID" INT,
    "EmployeeID" INT,
	"DeliveryID" INT,
	"PaymentID" INT,
	"ShopID" INT,
    "Amount" INT,
    "Date" DATE NOT NULL,
	FOREIGN KEY("ProductID") REFERENCES "Product_dim"("ProductID"),
	FOREIGN KEY("BuyerID") REFERENCES "Buyers_dim"("BuyerID"),
	FOREIGN KEY("EmployeeID") REFERENCES "Employees_dim"("EmployeeID"),
	FOREIGN KEY("DeliveryID") REFERENCES "Delivery_dim"("DeliveryID"),
	FOREIGN KEY("PaymentID") REFERENCES "Payment_dim"("PaymentID"),
	FOREIGN KEY("ShopID") REFERENCES "Shops_dim"("ShopID"),
    PRIMARY KEY("SaleID")
);
COMMIT;

DROP TABLE IF EXISTS "Product_dim";
DROP TABLE IF EXISTS "Buyers_dim";
DROP TABLE IF EXISTS "Employees_dim";
DROP TABLE IF EXISTS "Delivery_dim";
DROP TABLE IF EXISTS "Payment_dim";
DROP TABLE IF EXISTS "Shops_dim";
DROP TABLE IF EXISTS "Sale_fact";

