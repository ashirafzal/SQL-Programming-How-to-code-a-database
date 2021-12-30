
/*********************************************************************************/
/****************************** Mutual Screw Database ****************************/

/************************ Start of Mututal Screw Database ************************/

-- Checking For Database IF NOT EXIST create the database MutualScrew
IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'MutualScrew')
	BEGIN
		-- Creating new Database MutualScrew
		CREATE DATABASE MutualScrew;
	END
GO
	-- Use MutualScrew Database
	USE MutualScrew;
GO

/*** Creating category table and inserting records  ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='category' and xtype='U')
	BEGIN
		-- Now Creating Tables
		CREATE TABLE category(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			category_name VARCHAR(255) NOT NULL
		);

		-- Inserting Records into it
		INSERT INTO category(category_name) VALUES ('Bolts');
		INSERT INTO category(category_name) VALUES ('Nuts');
		INSERT INTO category(category_name) VALUES ('Joints');
		INSERT INTO category(category_name) VALUES ('Water taps');
		INSERT INTO category(category_name) VALUES ('Showers');
		INSERT INTO category(category_name) VALUES ('Screws');
		INSERT INTO category(category_name) VALUES ('Pipes');
		INSERT INTO category(category_name) VALUES ('Water tapes');
		INSERT INTO category(category_name) VALUES ('tapes');
	END
ELSE
	BEGIN
		
		-- Drop Table payment becuase of foreign key reference before dropping category
		DROP TABLE payment;
		-- Drop Table customer becuase of foreign key reference before dropping category
		DROP TABLE customer;
		-- Drop Table order_details becuase of foreign key reference before dropping category
		DROP TABLE order_details;
		-- Drop Table orders becuase of foreign key reference before dropping category
		DROP TABLE orders;
		-- Drop Table product_details becuase of foreign key reference before dropping category
		DROP TABLE product_details;
		-- Dropping table Product becuase of foreign key reference before dropping category
		DROP TABLE product;
		-- Dropping table Vendor becuase of foreign key reference before dropping category
		DROP TABLE vendor;
		-- Dropping table Stock becuase of foreign key reference before dropping category
		DROP TABLE stock;
		-- Drop Table Category
		DROP TABLE category;

		-- Now Creating Tables
		CREATE TABLE category(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			category_name VARCHAR(255) NOT NULL
		);

		-- Inserting Records into it
		INSERT INTO category(category_name) VALUES ('Bolts');
		INSERT INTO category(category_name) VALUES ('Nuts');
		INSERT INTO category(category_name) VALUES ('Joints');
		INSERT INTO category(category_name) VALUES ('Water taps');
		INSERT INTO category(category_name) VALUES ('Showers');
		INSERT INTO category(category_name) VALUES ('Screws');
		INSERT INTO category(category_name) VALUES ('Pipes');
		INSERT INTO category(category_name) VALUES ('Water tapes');
		INSERT INTO category(category_name) VALUES ('tapes');
	END
GO

/*** Creating stock table and inserting records  ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='stock' and xtype='U')
	BEGIN
		-- Now Creating Stock Table
		CREATE TABLE stock(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			stock_name VARCHAR(255) NOT NULL
		);

		-- Inserting Records into Stock
		INSERT INTO stock(stock_name) VALUES ('Stock Bolts');
		INSERT INTO stock(stock_name) VALUES ('Stock Nuts');
		INSERT INTO stock(stock_name) VALUES ('Stock Joints');
		INSERT INTO stock(stock_name) VALUES ('Stock Water taps');
		INSERT INTO stock(stock_name) VALUES ('Stock Showers');
		INSERT INTO stock(stock_name) VALUES ('Stock Screws');
		INSERT INTO stock(stock_name) VALUES ('Stock Pipes');
		INSERT INTO stock(stock_name) VALUES ('Stock Water tapes');
		INSERT INTO stock(stock_name) VALUES ('Stock tapes');
	END
ELSE
	BEGIN
		-- Drop Table Category
		DROP TABLE stock;

		-- Now Creating Stock Table
		CREATE TABLE stock(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			stock_name VARCHAR(255) NOT NULL
		);

		-- Inserting Records into stock
		INSERT INTO stock(stock_name) VALUES ('Stock Bolts');
		INSERT INTO stock(stock_name) VALUES ('Stock Nuts');
		INSERT INTO stock(stock_name) VALUES ('Stock Joints');
		INSERT INTO stock(stock_name) VALUES ('Stock Water taps');
		INSERT INTO stock(stock_name) VALUES ('Stock Showers');
		INSERT INTO stock(stock_name) VALUES ('Stock Screws');
		INSERT INTO stock(stock_name) VALUES ('Stock Pipes');
		INSERT INTO stock(stock_name) VALUES ('Stock Water tapes');
		INSERT INTO stock(stock_name) VALUES ('Stock tapes');
	END
GO

/*** Creating vendor table and inserting records  ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='vendor' and xtype='U')
	BEGIN
		-- Now Creating Vendor Table
		CREATE TABLE vendor(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			vendor_name VARCHAR(255) NOT NULL
		);

		-- Inserting Records into vendor
		INSERT INTO vendor(vendor_name) VALUES ('M Richard');
		INSERT INTO vendor(vendor_name) VALUES ('John Bolton');
		INSERT INTO vendor(vendor_name) VALUES ('John Perkin');
		INSERT INTO vendor(vendor_name) VALUES ('Borris Hammmer');
		INSERT INTO vendor(vendor_name) VALUES ('Josh Buttler');
		INSERT INTO vendor(vendor_name) VALUES ('Micheal Hussey');
		INSERT INTO vendor(vendor_name) VALUES ('David Jacob');
		INSERT INTO vendor(vendor_name) VALUES ('Brendom Mucullum');
		INSERT INTO vendor(vendor_name) VALUES ('Micheal Starc');
		INSERT INTO vendor(vendor_name) VALUES ('Babar Azam');
		INSERT INTO vendor(vendor_name) VALUES ('Roger Federer');
	END
ELSE
	BEGIN
		-- Drop Table Category
		DROP TABLE vendor;

		-- Now Creating Vendor Table
		CREATE TABLE vendor(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			vendor_name VARCHAR(255) NOT NULL
		);

		-- Inserting Records into vendor
		INSERT INTO vendor(vendor_name) VALUES ('M Richard');
		INSERT INTO vendor(vendor_name) VALUES ('John Bolton');
		INSERT INTO vendor(vendor_name) VALUES ('John Perkin');
		INSERT INTO vendor(vendor_name) VALUES ('Borris Hammmer');
		INSERT INTO vendor(vendor_name) VALUES ('Josh Buttler');
		INSERT INTO vendor(vendor_name) VALUES ('Micheal Hussey');
		INSERT INTO vendor(vendor_name) VALUES ('David Jacob');
		INSERT INTO vendor(vendor_name) VALUES ('Brendom Mucullum');
		INSERT INTO vendor(vendor_name) VALUES ('Micheal Starc');
		INSERT INTO vendor(vendor_name) VALUES ('Babar Azam');
		INSERT INTO vendor(vendor_name) VALUES ('Roger Federer');
	END
GO


/*** Creating product table and inserting records  ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='product' and xtype='U')
	BEGIN
		-- Now Creating Product Table
		CREATE TABLE product(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			product_name VARCHAR(255) NOT NULL,
			product_price FLOAT NOT NULL UNIQUE,
			category_id int FOREIGN KEY REFERENCES category(id) NOT NULL,
			vendor_id int FOREIGN KEY REFERENCES vendor(id) NOT NULL,
			stock_id int FOREIGN KEY REFERENCES stock(id) NOT NULL,
		);

		-- Inserting records into products table
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 cm bolt',5.0,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 cm bolt',5.5,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('3 cm bolt',6.0,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('4 cm bolt',6.5,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('5 cm bolt',7.0,1,2,1);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 guage 3cm nut',40.0,2,3,2);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 guage 4cm nut',60.0,2,3,2);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 guage 5cm nut',80.0,2,3,2);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 guage 6cm nut',100.0,2,3,2);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('6 cm bolt',7.5,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('7 cm bolt',8.0,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('8 cm bolt',8.5,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('9 cm bolt',9.0,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('10 cm bolt',9.5,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('11 cm bolt',10.0,1,2,1);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 guage 3cm nut',20.0,2,3,2);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 guage 4cm nut',30.0,2,3,2);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 guage 5cm nut',34.0,2,3,3);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 guage 6cm nut',50.0,2,3,2);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 inch bolt',160.0,1,1,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 inch bolt',200.0,1,1,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('4 inch bolt',220.0,1,1,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('6 inch bolt',250.0,1,1,1);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('single joint',1000.0,3,4,3);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('duoble joint',1500.0,3,4,3);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('multi joint',2000.0,3,4,3);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('8 inch bolt',290.0,1,1,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('12 inch bolt',320.0,1,1,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('16 inch bolt',350.0,1,1,1);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('simple Water taps',3500.0,4,8,4);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('modern Water taps',5500.0,4,8,4);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('single handle Water taps',3000.0,4,8,4);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('double Water taps',2500.0,4,8,4);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('tank Water taps',2550.0,4,8,4);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Simple Shower',6000.0,5,5,5);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Modern Shower',10000.0,5,5,5);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Small Shower',5400,5,5,5);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Big Shower',9000.0,5,5,5);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Minus Screw',11.0,6,6,6);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Plus Screw',19.5,6,6,6);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('small pipe',222.0,7,7,7);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('sewerage pipe',2100.0,7,7,7);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('water pipe',355.0,7,7,7);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('wall pipe',470.0,7,7,7);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('wall water tap',120.0,8,8,8);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('tank water tap',150.0,8,8,8);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('small water tape',35.0,9,9,9);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('medium water tape',75.0,9,9,9);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('bigwater tape',125.0,9,9,9);

	END
ELSE
	BEGIN
		-- Drop Table Product
		DROP TABLE product;

		-- Now Creating Product Table
		CREATE TABLE product(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			product_name VARCHAR(255) NOT NULL,
			product_price FLOAT NOT NULL UNIQUE,
			category_id int FOREIGN KEY REFERENCES category(id) NOT NULL,
			vendor_id int FOREIGN KEY REFERENCES vendor(id) NOT NULL,
			stock_id int FOREIGN KEY REFERENCES stock(id) NOT NULL,
		);

		-- Inserting records into products table
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 cm bolt',5.0,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 cm bolt',5.5,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('3 cm bolt',6.0,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('4 cm bolt',6.5,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('5 cm bolt',7.0,1,2,1);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 guage 3cm nut',40.0,2,3,2);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 guage 4cm nut',60.0,2,3,2);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 guage 5cm nut',80.0,2,3,2);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 guage 6cm nut',100.0,2,3,2);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('6 cm bolt',7.5,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('7 cm bolt',8.0,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('8 cm bolt',8.5,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('9 cm bolt',9.0,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('10 cm bolt',9.5,1,2,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('11 cm bolt',10.0,1,2,1);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 guage 3cm nut',20.0,2,3,2);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 guage 4cm nut',30.0,2,3,2);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 guage 5cm nut',34.0,2,3,3);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 guage 6cm nut',50.0,2,3,2);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('1 inch bolt',160.0,1,1,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('2 inch bolt',200.0,1,1,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('4 inch bolt',220.0,1,1,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('6 inch bolt',250.0,1,1,1);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('single joint',1000.0,3,4,3);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('duoble joint',1500.0,3,4,3);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('multi joint',2000.0,3,4,3);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('8 inch bolt',290.0,1,1,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('12 inch bolt',320.0,1,1,1);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('16 inch bolt',350.0,1,1,1);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('simple Water taps',3500.0,4,8,4);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('modern Water taps',5500.0,4,8,4);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('single handle Water taps',3000.0,4,8,4);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('double Water taps',2500.0,4,8,4);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('tank Water taps',2550.0,4,8,4);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Simple Shower',6000.0,5,5,5);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Modern Shower',10000.0,5,5,5);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Small Shower',5400,5,5,5);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Big Shower',9000.0,5,5,5);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Minus Screw',11.0,6,6,6);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('Plus Screw',19.5,6,6,6);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('small pipe',222.0,7,7,7);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('sewerage pipe',2100.0,7,7,7);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('water pipe',355.0,7,7,7);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('wall pipe',470.0,7,7,7);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('wall water tap',120.0,8,8,8);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('tank water tap',150.0,8,8,8);

		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('small water tape',35.0,9,9,9);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('medium water tape',75.0,9,9,9);
		INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) VALUES ('bigwater tape',125.0,9,9,9);

	END
GO


/*** Creating product_details table and inserting records  ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='product_details' and xtype='U')
	BEGIN
		-- Now Creating product_details Table
		CREATE TABLE product_details(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			product_detail VARCHAR(255) NOT NULL,
			product_company_name VARCHAR(255) NOT NULL,
			product_id int FOREIGN KEY REFERENCES product(id) NOT NULL,
		);

		-- Inserting values into the product_details table
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',1);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',2);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',3);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',4);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',5);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',6);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',7);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',8);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',9);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',10);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',11);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',12);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',13);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',14);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',15);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',16);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',17);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',18);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',19);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',20);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',21);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',22);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',23);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality joint','Falcon joint',24);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality joint','Falcon joint',25);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality joint','Falcon joint',26);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',27);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',28);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',29);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Water tap with best control','Ficox',30);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Water tap with best control','Ficox',31);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Water tap with best control','Ficox',32);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Water tap with best control','Ficox',33);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Water tap with best control','Ficox',34);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Full flow shower with best design','Pangas',35);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Full flow shower with best design','Pangas',36);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Full flow shower with best design','Pangas',37);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Full flow shower with best design','Pangas',38);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good Quality screws','Cyclone engineering',39);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good Quality screws','Cyclone engineering',40);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy built pipe','SVL engineering',41);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy built pipe','SVL engineering',42);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy built pipe','SVL engineering',43);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy biult pipe','SVL engineering',44);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('water tap with deisgn and best qualtiy','SVL engineering',45);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('water tap with deisgn and best qualtiy','SVL engineering',46);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy water tape','SVL engineering',47);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy water tape','SVL engineering',48);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy water tape','SVL engineering',49);

	END
ELSE
	BEGIN
		-- Drop Table product_details
		DROP TABLE product_details;

		-- Now Creating product_details Table
		CREATE TABLE product_details(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			product_detail VARCHAR(255) NOT NULL,
			product_company_name VARCHAR(255) NOT NULL,
			product_id int FOREIGN KEY REFERENCES product(id) NOT NULL,
		);

		-- Inserting values into the product_details table
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',1);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',2);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',3);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',4);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',5);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',6);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',7);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',8);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',9);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',10);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',11);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',12);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',13);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',14);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',15);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',16);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',17);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',18);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Tough hard super quality guage','SVL engineering',19);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',20);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',21);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',22);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',23);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality joint','Falcon joint',24);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality joint','Falcon joint',25);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality joint','Falcon joint',26);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',27);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',28);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good quality bolt with sharp edges','MJ Bolts',29);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Water tap with best control','Ficox',30);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Water tap with best control','Ficox',31);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Water tap with best control','Ficox',32);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Water tap with best control','Ficox',33);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Water tap with best control','Ficox',34);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Full flow shower with best design','Pangas',35);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Full flow shower with best design','Pangas',36);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Full flow shower with best design','Pangas',37);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Full flow shower with best design','Pangas',38);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good Quality screws','Cyclone engineering',39);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Good Quality screws','Cyclone engineering',40);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy built pipe','SVL engineering',41);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy built pipe','SVL engineering',42);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy built pipe','SVL engineering',43);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy biult pipe','SVL engineering',44);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('water tap with deisgn and best qualtiy','SVL engineering',45);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('water tap with deisgn and best qualtiy','SVL engineering',46);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy water tape','SVL engineering',47);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy water tape','SVL engineering',48);
		INSERT INTO product_details(product_detail,product_company_name,product_id) VALUES ('Best qualtiy water tape','SVL engineering',49);

	END
GO


/*** Creating orders table and inserting records  ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='orders' and xtype='U')
	BEGIN
		-- Now Creating orders Table
		CREATE TABLE orders(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			product_id INT FOREIGN KEY REFERENCES product(id) NOT NULL,
			price FLOAT FOREIGN KEY REFERENCES product(product_price) NOT NULL,
			product_count INT NOT NULL,
		);

		INSERT INTO orders(product_id,price,product_count) VALUES (1,5.0,8);
		INSERT INTO orders(product_id,price,product_count) VALUES (10,7.5,4);
		INSERT INTO orders(product_id,price,product_count) VALUES (6,40.0,22);
		INSERT INTO orders(product_id,price,product_count) VALUES (14,9.5,5);
		INSERT INTO orders(product_id,price,product_count) VALUES (20,160.0,9);
		INSERT INTO orders(product_id,price,product_count) VALUES (30,3500.0,11);
		INSERT INTO orders(product_id,price,product_count) VALUES (45,120.0,17);

	END
ELSE
	BEGIN
		-- Drop Table orders
		DROP TABLE orders;

		-- Now Creating orders Table
		CREATE TABLE orders(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			product_id INT FOREIGN KEY REFERENCES product(id) NOT NULL,
			price FLOAT FOREIGN KEY REFERENCES product(product_price) NOT NULL,
			product_count INT NOT NULL,
		);

		INSERT INTO orders(product_id,price,product_count) VALUES (1,5.0,8);
		INSERT INTO orders(product_id,price,product_count) VALUES (10,7.5,4);
		INSERT INTO orders(product_id,price,product_count) VALUES (6,40.0,22);
		INSERT INTO orders(product_id,price,product_count) VALUES (14,9.5,5);
		INSERT INTO orders(product_id,price,product_count) VALUES (20,160.0,9);
		INSERT INTO orders(product_id,price,product_count) VALUES (30,3500.0,11);
		INSERT INTO orders(product_id,price,product_count) VALUES (45,120.0,17);

	END
GO


/*** Creating order_details table and inserting records  ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='order_details' and xtype='U')
	BEGIN
		-- Now Creating order_details Table
		CREATE TABLE order_details(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			order_id INT FOREIGN KEY REFERENCES orders(id) NOT NULL,
			order_type VARCHAR(255) NOT NULL
		);

		INSERT INTO order_details(order_id,order_type) VALUES (1,'Online');
		INSERT INTO order_details(order_id,order_type) VALUES (3,'Onsite');
		INSERT INTO order_details(order_id,order_type) VALUES (5,'Online');
		INSERT INTO order_details(order_id,order_type) VALUES (2,'Onsite');
		INSERT INTO order_details(order_id,order_type) VALUES (4,'Online');

	END
ELSE
	BEGIN
		-- Drop Table order_details
		DROP TABLE order_details;

		-- Now Creating order_details Table
		CREATE TABLE order_details(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			order_id INT FOREIGN KEY REFERENCES orders(id) NOT NULL,
			order_type VARCHAR(255) NOT NULL
		);

		INSERT INTO order_details(order_id,order_type) VALUES (1,'Online');
		INSERT INTO order_details(order_id,order_type) VALUES (3,'Onsite');
		INSERT INTO order_details(order_id,order_type) VALUES (5,'Online');
		INSERT INTO order_details(order_id,order_type) VALUES (2,'Onsite');
		INSERT INTO order_details(order_id,order_type) VALUES (4,'Online');

	END
GO


/*** Creating customer table and inserting records  ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='customer' and xtype='U')
	BEGIN
		-- Now Creating customer Table
		CREATE TABLE customer(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			customer_name VARCHAR(255) NOT NULL,
			order_id INT FOREIGN KEY REFERENCES orders(id) NOT NULL
		);

		INSERT INTO customer(customer_name,order_id) VALUES ('Robert Dennis',1);
		INSERT INTO customer(customer_name,order_id) VALUES ('Opene Hammer',2);
		INSERT INTO customer(customer_name,order_id) VALUES ('Robin Faulkener',3);
		INSERT INTO customer(customer_name,order_id) VALUES ('Josh Savour',4);
		INSERT INTO customer(customer_name,order_id) VALUES ('Hanzimmer',5);
		INSERT INTO customer(customer_name,order_id) VALUES ('Joe Biden',6);
		INSERT INTO customer(customer_name,order_id) VALUES ('Trude trump',7);

	END
ELSE
	BEGIN
		-- Drop Table customer
		DROP TABLE customer;

		-- Now Creating customer Table
		CREATE TABLE customer(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			customer_name VARCHAR(255) NOT NULL,
			order_id INT FOREIGN KEY REFERENCES orders(id) NOT NULL
		);

		INSERT INTO customer(customer_name,order_id) VALUES ('Robert Dennis',1);
		INSERT INTO customer(customer_name,order_id) VALUES ('Opene Hammer',2);
		INSERT INTO customer(customer_name,order_id) VALUES ('Robin Faulkener',3);
		INSERT INTO customer(customer_name,order_id) VALUES ('Josh Savour',4);
		INSERT INTO customer(customer_name,order_id) VALUES ('Hanzimmer',5);
		INSERT INTO customer(customer_name,order_id) VALUES ('Joe Biden',6);
		INSERT INTO customer(customer_name,order_id) VALUES ('Trude trump',7);

	END
GO

/*** Creating payment table and inserting records  ***/
IF NOT EXISTS (SELECT * FROM sysobjects WHERE name='payment' and xtype='U')
	BEGIN
		-- Now Creating payment Table
		CREATE TABLE payment(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			order_id INT FOREIGN KEY REFERENCES orders(id) NOT NULL,
			payment_type VARCHAR(255) NOT NULL
		);

		INSERT INTO payment(order_id,payment_type) VALUES (1,'Online');
		INSERT INTO payment(order_id,payment_type) VALUES (2,'Cash');
		INSERT INTO payment(order_id,payment_type) VALUES (3,'Online');
		INSERT INTO payment(order_id,payment_type) VALUES (4,'Cash');
		INSERT INTO payment(order_id,payment_type) VALUES (5,'Online');
		INSERT INTO payment(order_id,payment_type) VALUES (6,'Cash');
		INSERT INTO payment(order_id,payment_type) VALUES (7,'Online');

	END
ELSE
	BEGIN
		-- Drop Table payment
		DROP TABLE payment;

		-- Now Creating payment Table
		CREATE TABLE payment(
			id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
			order_id INT FOREIGN KEY REFERENCES orders(id) NOT NULL,
			payment_type VARCHAR(255) NOT NULL
		);

		INSERT INTO payment(order_id,payment_type) VALUES (1,'Online');
		INSERT INTO payment(order_id,payment_type) VALUES (2,'Cash');
		INSERT INTO payment(order_id,payment_type) VALUES (3,'Online');
		INSERT INTO payment(order_id,payment_type) VALUES (4,'Cash');
		INSERT INTO payment(order_id,payment_type) VALUES (5,'Online');
		INSERT INTO payment(order_id,payment_type) VALUES (6,'Cash');
		INSERT INTO payment(order_id,payment_type) VALUES (7,'Online');

	END
GO


/******************************************* Procedures *******************************************************/

								-- Insert Procedure for Category

-- Droping Procedure InsertCategory if exists to prevent execution errors
IF OBJECT_ID('InsertCategory','P') IS NOT NULL
    DROP PROC InsertCategory

GO
-- Insert Procedure
CREATE PROCEDURE InsertCategory(
    @CategoryName varchar(20))
AS
-- Begining insertion
BEGIN
	-- Inserting Into the category Table
	INSERT INTO category(category_name) values (@CategoryName);
-- Ending insertion
END
-- Using Go statement
GO

-- Procedure Execution
EXEC InsertCategory @CategoryName = 'Pipe Joints';

-- Using Go statement
GO

							-- Update Procedure for Category

-- Droping Procedure UpdateCategory if exists to prevent execution errors
IF OBJECT_ID('UpdateCategory','P') IS NOT NULL
    DROP PROC UpdateCategory

GO
-- Insert Procedure
CREATE PROCEDURE UpdateCategory(
	@CategoryID INT,
    @CategoryName varchar(20))
AS
-- Begining Updating
BEGIN
	-- Updating Instructors Table
    UPDATE category SET category_name = @CategoryName WHERE id = @CategoryID
END
-- Using Go statement
GO

-- Procedure Execution
-- testing should succeed
EXEC UpdateCategory @CategoryName = 'Pipe Joints updated' , @CategoryID = 10;

-- Using Go statement
GO


								-- Insert Procedure for Stock

-- Droping Procedure InsertStock if exists to prevent execution errors
IF OBJECT_ID('InsertStock','P') IS NOT NULL
    DROP PROC InsertStock

GO
-- Insert Procedure
CREATE PROCEDURE InsertStock(
    @StockName varchar(20))
AS
-- Begining insertion
BEGIN
	-- Inserting Into the stock Table
	INSERT INTO stock(stock_name) values (@StockName);
-- Ending insertion
END
-- Using Go statement
GO

-- Procedure Execution
EXEC InsertStock @StockName = 'Stock Insert';

-- Using Go statement
GO

							-- Update Procedure for Stock

-- Droping Procedure UpdateStock if exists to prevent execution errors
IF OBJECT_ID('UpdateStock','P') IS NOT NULL
    DROP PROC UpdateStock

GO
-- Insert Procedure
CREATE PROCEDURE UpdateStock(
	@StockID INT,
    @StockName varchar(20))
AS
-- Begining Updating
BEGIN
	-- Updating Stock Table
    UPDATE stock SET stock_name = @StockName WHERE id = @StockID
END
-- Using Go statement
GO

-- Procedure Execution
EXEC UpdateStock @StockName = 'Stock Insert Updated' , @StockID = 10;

-- Using Go statement
GO

								-- Insert Procedure for Product

-- Droping Procedure InsertProduct if exists to prevent execution errors
IF OBJECT_ID('InsertProduct','P') IS NOT NULL
    DROP PROC InsertProduct

GO
-- Insert Procedure
CREATE PROCEDURE InsertProduct(
    @ProductName varchar(255),
	@ProductPrice FLOAT,
	@CategoryID INT,
	@VendorID INT,
	@StockID INT
	)
AS
-- Begining insertion
BEGIN
	-- Inserting Into the product Table
	INSERT INTO product(product_name,product_price,category_id,vendor_id,stock_id) 
				VALUES (@ProductName,@ProductPrice,@CategoryID,@VendorID,@StockID);
-- Ending insertion
END
-- Using Go statement
GO

-- Procedure Execution
EXEC InsertProduct @ProductName = 'Insert Product Procedure', @ProductPrice = 1130.0, @CategoryID = 9, @VendorID = 1, @StockID = 5;

-- Using Go statement
GO


								-- Update Procedure for Product

-- Droping Procedure UpdateProduct if exists to prevent execution errors
IF OBJECT_ID('UpdateProduct','P') IS NOT NULL
    DROP PROC UpdateProduct

GO
-- Update Procedure
CREATE PROCEDURE UpdateProduct(
	@ProductID INT,
    @ProductName varchar(255),
	@ProductPrice FLOAT,
	@CategoryID INT,
	@VendorID INT,
	@StockID INT
	)
AS
-- Begining update
BEGIN
	
	-- Updating Into the product Table
	UPDATE product SET product_name = @ProductName, product_price = @ProductPrice, category_id = @CategoryID,
	vendor_id = @VendorID, stock_id = @StockID WHERE id = @ProductID;

-- Ending Update
END
-- Using Go statement
GO

-- Procedure Execution
EXEC UpdateProduct @ProductID = 50, @ProductName = 'Update Product Procedure', @ProductPrice = 1130.0, @CategoryID = 9, @VendorID = 1, @StockID = 5;

-- Using Go statement
GO

/************************************************* Functions ***********************************************************/

-- Function on order table with conversions

SELECT id, product_id, 
CONVERT(DECIMAL(10,2),price) AS Unit_Price, 
CONVERT(DECIMAL(10,2),product_count) AS Unit_Quantity,
CONVERT(DECIMAL(10,2),price * product_count) AS Order_Total 
FROM orders
ORDER BY id DESC

-- Function on order table with condition

SELECT id, product_id, 
CONVERT(DECIMAL(10,2),price) AS Unit_Price, 
CONVERT(DECIMAL(10,2),product_count) AS Unit_Quantity,
CONVERT(DECIMAL(10,2),price * product_count) AS Order_Total 
FROM orders
WHERE price * product_count <= 500
ORDER BY id DESC

/************************************************* Joins And Function ***********************************************************/

-- Join between product and product_dteils table with functions

SELECT p.product_name AS Product_Name,
CONVERT(DECIMAL(10,2),p.product_price) AS Product_Price,
pd.product_detail AS Product_Detail,
pd.product_company_name AS Product_Company,
p.category_id AS CategoryID,
p.vendor_id AS VendorID,
p.stock_id AS StockID
FROM product p JOIN product_details pd 
ON p.id = pd.product_id 
ORDER BY p.product_name ASC

-- Join between product and order table with functions

SELECT  product.product_name AS Product_Name,
CONVERT(DECIMAL(10,2),product.product_price) AS Product_Price,
CONVERT(DECIMAL(10,2),orders.product_id) AS Product_ID, 
CONVERT(DECIMAL(10,2),price) AS Order_Unit_Price, 
CONVERT(DECIMAL(10,2),product_count) AS Order_Unit_Quantity,
CONVERT(DECIMAL(10,2),price * product_count) AS Order_Total 
FROM orders JOIN product
ON orders.product_id = product.id
ORDER BY product_id DESC


/************************************************* Test Cases ***********************************************************/

-- Test Case For Payment
SELECT order_id,payment_type,
(CASE payment_type
	WHEN 'Online' THEN 'Paid via payment methods'
	WHEN 'Cash' THEN 'Paid through cash onsite '
END) AS Payment_Status
FROM payment;

-- Test Case For Order Details
SELECT order_id,order_type,
(CASE order_type
	WHEN 'Online' THEN 'Ordered via payment methods'
	WHEN 'Onsite' THEN 'Ordered through cash onsite '
END) AS Order_Status
FROM order_details;

/************************************************* Triggers ***********************************************************/

IF EXISTS (SELECT * FROM sysobjects WHERE name='product_trigger_example' and xtype='U')
BEGIN
	-- DROPPING TABLE product_trigger_example
	DROP TABLE product_trigger_example;
END

-- Creating table product_trigger_example
-- The trigger will act upon this table
CREATE TABLE product_trigger_example(
	change_id INT IDENTITY PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DEC(10,2) NOT NULL,
    updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation = 'INS' or operation='DEL')
);

GO

-- Creating trigger trigger_product_audit on product_trigger_example table
CREATE TRIGGER trigger_product_audit
ON product_trigger_example
-- Perfomring operations on insert and delete
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO product_trigger_example(
        product_id, 
        product_name,
        brand_id,
        category_id,
        model_year,
        list_price, 
        updated_at, 
        operation
    )
    SELECT
        i.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        i.list_price,
        GETDATE(),
        'INS'
    FROM
        inserted i
    UNION ALL
    SELECT
        d.product_id,
        product_name,
        brand_id,
        category_id,
        model_year,
        d.list_price,
        GETDATE(),
        'DEL'
    FROM
        deleted d;
END

-- Testing the Trigger Results
-- Inserting records for checking

INSERT INTO product_trigger_example(
	change_id,
	product_id,
	product_name,
	brand_id,
	category_id,
	model_year,
	list_price,
	updated_at,
	operation)

VALUES (
	 1,
	 1,
	 'Test product',
	 1,
	 1,
	 2018,
	 599,
	 CURRENT_TIMESTAMP,
	 'INS');

SELECT * FROM product_trigger_example;