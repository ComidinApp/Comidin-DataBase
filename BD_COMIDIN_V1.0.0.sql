USE [master]
GO
/****** Object:  Database [Comidin_DB]    Script Date: 20/06/2024 21:35:32 ******/
CREATE DATABASE [Comidin_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Comidin_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS2024\MSSQL\DATA\Comidin_DB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Comidin_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS2024\MSSQL\DATA\Comidin_DB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Comidin_DB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Comidin_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Comidin_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Comidin_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Comidin_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Comidin_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Comidin_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Comidin_DB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Comidin_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Comidin_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Comidin_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Comidin_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Comidin_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Comidin_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Comidin_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Comidin_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Comidin_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Comidin_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Comidin_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Comidin_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Comidin_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Comidin_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Comidin_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Comidin_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Comidin_DB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Comidin_DB] SET  MULTI_USER 
GO
ALTER DATABASE [Comidin_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Comidin_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Comidin_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Comidin_DB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Comidin_DB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Comidin_DB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Comidin_DB] SET QUERY_STORE = ON
GO
ALTER DATABASE [Comidin_DB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Comidin_DB]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id_address] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[number] [int] NOT NULL,
	[postal_code] [nvarchar](50) NOT NULL,
	[home_type] [nvarchar](50) NOT NULL,
	[extra_info] [nvarchar](max) NOT NULL,
	[home_referal_name] [nvarchar](50) NULL,
	[create_on] [date] NOT NULL,
	[coordinates] [nvarchar](max) NOT NULL,
	[address_type] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address_for_user]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address_for_user](
	[id_address] [int] NOT NULL,
	[id_user] [int] NOT NULL,
	[is_active] [nvarchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_address] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commerce]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commerce](
	[id_commerce] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[suscription_type] [int] NOT NULL,
	[comerce_category] [int] NOT NULL,
	[is_active] [varchar](1) NOT NULL,
	[image_url] [nvarchar](max) NOT NULL,
	[created_on] [date] NOT NULL,
	[address] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_commerce] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee_for_commerce]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee_for_commerce](
	[id_employee] [int] IDENTITY(1,1) NOT NULL,
	[id_commerce] [int] NOT NULL,
	[role] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_employee] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[id_detail] [int] IDENTITY(1,1) NOT NULL,
	[id_order] [int] NOT NULL,
	[id_product] [int] NOT NULL,
	[quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id_order] [int] IDENTITY(1,1) NOT NULL,
	[create_on] [date] NOT NULL,
	[id_user] [int] NOT NULL,
	[commerce] [int] NOT NULL,
	[status] [nvarchar](2) NOT NULL,
	[delivery_type] [nvarchar](50) NOT NULL,
	[payment_type] [nvarchar](50) NOT NULL,
	[address] [int] NOT NULL,
	[role] [nvarchar](50) NOT NULL,
	[total_amount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[categoria] [nvarchar](250) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[stock] [int] NOT NULL,
	[is_active] [nvarchar](1) NOT NULL,
	[commerce_data] [nvarchar](50) NOT NULL,
	[image_url] [nvarchar](max) NOT NULL,
	[product_code] [nvarchar](100) NOT NULL,
	[create_on] [date] NOT NULL,
	[price] [int] NOT NULL,
	[discount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_for_commerce]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_for_commerce](
	[id_product] [int] IDENTITY(1,1) NOT NULL,
	[id_commerce] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suscription_Type]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suscription_Type](
	[id_suscription_type] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](250) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_suscription_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id_user] [int] IDENTITY(1,1) NOT NULL,
	[create_on] [date] NOT NULL,
	[phone_number] [int] NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[national_id] [nvarchar](50) NOT NULL,
	[is_active] [nvarchar](1) NOT NULL,
	[birthday] [date] NOT NULL,
	[image_url] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_user] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address_for_user]  WITH CHECK ADD  CONSTRAINT [FK_Address_Address] FOREIGN KEY([id_address])
REFERENCES [dbo].[Address] ([id_address])
GO
ALTER TABLE [dbo].[Address_for_user] CHECK CONSTRAINT [FK_Address_Address]
GO
ALTER TABLE [dbo].[Address_for_user]  WITH CHECK ADD  CONSTRAINT [FK_Address_User] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Address_for_user] CHECK CONSTRAINT [FK_Address_User]
GO
ALTER TABLE [dbo].[Commerce]  WITH CHECK ADD  CONSTRAINT [FK_Commerce_Address] FOREIGN KEY([address])
REFERENCES [dbo].[Address] ([id_address])
GO
ALTER TABLE [dbo].[Commerce] CHECK CONSTRAINT [FK_Commerce_Address]
GO
ALTER TABLE [dbo].[Commerce]  WITH CHECK ADD  CONSTRAINT [FK_Commerce_SuscriptionType] FOREIGN KEY([suscription_type])
REFERENCES [dbo].[Suscription_Type] ([id_suscription_type])
GO
ALTER TABLE [dbo].[Commerce] CHECK CONSTRAINT [FK_Commerce_SuscriptionType]
GO
ALTER TABLE [dbo].[employee_for_commerce]  WITH CHECK ADD  CONSTRAINT [FK_employee_for_commerce_Commerce] FOREIGN KEY([id_commerce])
REFERENCES [dbo].[Commerce] ([id_commerce])
GO
ALTER TABLE [dbo].[employee_for_commerce] CHECK CONSTRAINT [FK_employee_for_commerce_Commerce]
GO
ALTER TABLE [dbo].[employee_for_commerce]  WITH CHECK ADD  CONSTRAINT [FK_employee_for_commerce_Employee] FOREIGN KEY([id_employee])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[employee_for_commerce] CHECK CONSTRAINT [FK_employee_for_commerce_Employee]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_Order] FOREIGN KEY([id_order])
REFERENCES [dbo].[Orders] ([id_order])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_Order]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id_product])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_Product]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Address] FOREIGN KEY([address])
REFERENCES [dbo].[Address] ([id_address])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Address]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Commerce] FOREIGN KEY([commerce])
REFERENCES [dbo].[Commerce] ([id_commerce])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Commerce]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([id_user])
REFERENCES [dbo].[Users] ([id_user])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[product_for_commerce]  WITH CHECK ADD  CONSTRAINT [FK_product_for_commerce_Commerce] FOREIGN KEY([id_commerce])
REFERENCES [dbo].[Commerce] ([id_commerce])
GO
ALTER TABLE [dbo].[product_for_commerce] CHECK CONSTRAINT [FK_product_for_commerce_Commerce]
GO
ALTER TABLE [dbo].[product_for_commerce]  WITH CHECK ADD  CONSTRAINT [FK_product_for_commerce_Product] FOREIGN KEY([id_product])
REFERENCES [dbo].[Product] ([id_product])
GO
ALTER TABLE [dbo].[product_for_commerce] CHECK CONSTRAINT [FK_product_for_commerce_Product]
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAddress]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertAddress]
    @name NVARCHAR(100),
    @number INT,
    @postal_code NVARCHAR(50),
    @home_type NVARCHAR(50),
    @extra_info NVARCHAR(MAX),
    @home_referal_name NVARCHAR(50),
    @create_on DATE,
    @coordinates NVARCHAR(MAX),
    @address_type NVARCHAR(10)
AS
BEGIN
    INSERT INTO Address (name, number, postal_code, home_type, extra_info, home_referal_name, create_on, coordinates, address_type)
    VALUES (@name, @number, @postal_code, @home_type, @extra_info, @home_referal_name, @create_on, @coordinates, @address_type);

    PRINT 'Record in Address inserted successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertAddressForUser]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertAddressForUser]
    @id_address INT,
    @id_user INT,
    @is_active NVARCHAR(1)
AS
BEGIN
    INSERT INTO Address_for_user (id_address, id_user, is_active)
    VALUES (@id_address, @id_user, @is_active);

    PRINT 'Record in Address_for_user inserted successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertCommerce]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertCommerce]
    @name NVARCHAR(250),
    @suscription_type INT,
    @commerce_category INT,
    @is_active VARCHAR(1),
    @image_url NVARCHAR(MAX),
    @created_on DATE,
    @address INT
AS
BEGIN
    INSERT INTO Commerce (name, suscription_type, comerce_category, is_active, image_url, created_on, address)
    VALUES (@name, @suscription_type, @commerce_category, @is_active, @image_url, @created_on, @address);

    PRINT 'Record in Commerce inserted successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertEmployeeForCommerce]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertEmployeeForCommerce]
    @id_commerce INT,
    @role NVARCHAR(50)
AS
BEGIN
    INSERT INTO Employee_for_commerce (id_commerce, role)
    VALUES (@id_commerce, @role);

    PRINT 'Record in Employee_for_commerce inserted successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertOrder]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertOrder]
    @create_on DATE,
    @id_user INT,
    @commerce INT,
    @status NVARCHAR(2),
    @delivery_type NVARCHAR(50),
    @payment_type NVARCHAR(50),
    @address INT,
    @role NVARCHAR(50),
    @total_amount INT
AS
BEGIN
    INSERT INTO Orders (create_on, id_user, commerce, status, delivery_type, payment_type, address, role, total_amount)
    VALUES (@create_on, @id_user, @commerce, @status, @delivery_type, @payment_type, @address, @role, @total_amount);

    PRINT 'Record in Orders inserted successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertOrderDetail]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertOrderDetail]
    @id_order INT,
    @id_product INT,
    @quantity INT
AS
BEGIN
    INSERT INTO Order_detail (id_order, id_product, quantity)
    VALUES (@id_order, @id_product, @quantity);

    PRINT 'Record in Order_detail inserted successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertProduct]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertProduct]
    @categoria NVARCHAR(250),
    @name NVARCHAR(50),
    @description NVARCHAR(MAX),
    @stock INT,
    @is_active NVARCHAR(1),
    @commerce_data NVARCHAR(50),
    @image_url NVARCHAR(MAX),
    @product_code NVARCHAR(100),
    @create_on DATE,
    @price INT,
    @discount INT
AS
BEGIN
    INSERT INTO Product (categoria, name, description, stock, is_active, commerce_data, image_url, product_code, create_on, price, discount)
    VALUES (@categoria, @name, @description, @stock, @is_active, @commerce_data, @image_url, @product_code, @create_on, @price, @discount);

    PRINT 'Record in Product inserted successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertProductForCommerce]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertProductForCommerce]
    @id_commerce INT
AS
BEGIN
    INSERT INTO Product_for_commerce (id_commerce)
    VALUES (@id_commerce);

    PRINT 'Record in Product_for_commerce inserted successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertSuscriptionType]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertSuscriptionType]
    @name NVARCHAR(250),
    @description NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Suscription_Type (name, description)
    VALUES (@name, @description);

    PRINT 'Record in Suscription_Type inserted successfully.';
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUser]    Script Date: 20/06/2024 21:35:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_InsertUser]
    @create_on DATE,
    @phone_number INT,
    @email NVARCHAR(100),
    @password NVARCHAR(MAX),
    @name NVARCHAR(50),
    @last_name NVARCHAR(50),
    @national_id NVARCHAR(50),
    @is_active NVARCHAR(1),
    @birthday DATE,
    @image_url NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO Users (create_on, phone_number, email, password, name, last_name, national_id, is_active, birthday, image_url)
    VALUES (@create_on, @phone_number, @email, @password, @name, @last_name, @national_id, @is_active, @birthday, @image_url);

    PRINT 'Record in Users inserted successfully.';
END
GO
USE [master]
GO
ALTER DATABASE [Comidin_DB] SET  READ_WRITE 
GO
