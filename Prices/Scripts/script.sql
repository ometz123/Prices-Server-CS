USE [master]
GO
/****** Object:  Database [bgroup4_prod]    Script Date: 23/07/2020 15:23:08 ******/
CREATE DATABASE [bgroup4_prod] ON  PRIMARY 
( NAME = N'bgroup4_prod', FILENAME = N'D:\Sql_Data\bgroup4_prod.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bgroup4_prod_log', FILENAME = N'D:\Sql_Data\bgroup4_prod_log.LDF' , SIZE = 9408KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bgroup4_prod] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bgroup4_prod].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bgroup4_prod] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bgroup4_prod] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bgroup4_prod] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bgroup4_prod] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bgroup4_prod] SET ARITHABORT OFF 
GO
ALTER DATABASE [bgroup4_prod] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bgroup4_prod] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bgroup4_prod] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bgroup4_prod] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bgroup4_prod] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bgroup4_prod] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bgroup4_prod] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bgroup4_prod] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bgroup4_prod] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bgroup4_prod] SET  ENABLE_BROKER 
GO
ALTER DATABASE [bgroup4_prod] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bgroup4_prod] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bgroup4_prod] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bgroup4_prod] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bgroup4_prod] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bgroup4_prod] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bgroup4_prod] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bgroup4_prod] SET RECOVERY FULL 
GO
ALTER DATABASE [bgroup4_prod] SET  MULTI_USER 
GO
ALTER DATABASE [bgroup4_prod] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bgroup4_prod] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'bgroup4_prod', N'ON'
GO
USE [bgroup4_prod]
GO
/****** Object:  User [bgroup4_DBuser]    Script Date: 23/07/2020 15:23:09 ******/
CREATE USER [bgroup4_DBuser] FOR LOGIN [bgroup4] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [bgroup4_DBuser]
GO
/****** Object:  Table [dbo].[categories_tbl]    Script Date: 23/07/2020 15:23:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories_tbl](
	[category_title] [char](50) NOT NULL,
	[category_id] [nvarchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[favorites_tbl]    Script Date: 23/07/2020 15:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[favorites_tbl](
	[user_id] [nvarchar](50) NOT NULL,
	[item_id] [nvarchar](32) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[items_tags_tbl]    Script Date: 23/07/2020 15:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items_tags_tbl](
	[item_id] [nvarchar](32) NULL,
	[tag_id] [nvarchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[items_tbl]    Script Date: 23/07/2020 15:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[items_tbl](
	[item_title] [nvarchar](50) NOT NULL,
	[price] [float] NOT NULL,
	[discount_dollar] [float] NULL,
	[discount_percent] [float] NULL,
	[user_id] [nvarchar](50) NOT NULL,
	[id_type] [char](10) NOT NULL,
	[item_image] [nvarchar](255) NULL,
	[item_description] [nvarchar](255) NULL,
	[item_id] [nvarchar](32) NULL,
	[receipt_id] [nvarchar](32) NULL,
	[category_id] [nvarchar](32) NULL,
	[sub_category_id] [nvarchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[receipts_tbl]    Script Date: 23/07/2020 15:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[receipts_tbl](
	[user_id] [varchar](50) NOT NULL,
	[date] [date] NOT NULL,
	[discount_dollar] [float] NULL,
	[discount_percent] [float] NULL,
	[to_show] [bit] NULL,
	[receipt_image] [nvarchar](255) NULL,
	[receipt_description] [nvarchar](255) NULL,
	[store_id] [nvarchar](32) NULL,
	[receipt_id] [nvarchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stores_tbl]    Script Date: 23/07/2020 15:23:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stores_tbl](
	[store_name] [nvarchar](50) NOT NULL,
	[lat] [float] NULL,
	[lon] [float] NULL,
	[store_id] [nvarchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sub_categories_tbl]    Script Date: 23/07/2020 15:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sub_categories_tbl](
	[sub_category_title] [char](50) NOT NULL,
	[sub_category_id] [nvarchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tags_tbl]    Script Date: 23/07/2020 15:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tags_tbl](
	[tag_title] [char](50) NOT NULL,
	[tag_id] [nvarchar](32) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users_tbl]    Script Date: 23/07/2020 15:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users_tbl](
	[user_id] [varchar](50) NOT NULL,
	[first_name] [nvarchar](50) NOT NULL,
	[last_name] [nvarchar](50) NOT NULL,
	[password] [nvarchar](16) NOT NULL,
	[birthdate] [date] NOT NULL,
	[gender] [bit] NULL,
	[state] [nchar](50) NULL,
	[city] [nchar](50) NULL,
	[user_rank] [int] NULL,
 CONSTRAINT [PK_users_tbl] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SPCategory]    Script Date: 23/07/2020 15:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPCategory]
	-- Add the parameters for the stored procedure here
	(
	@id	nvarchar(32)= null,
	@title char(50)= null,
	@StatementType NVARCHAR(20) = ''
	)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת תגיות
		BEGIN  
					INSERT INTO categories_tbl  
								( 
								category_id,
								category_title
								
								)  
					VALUES		(
								@id,
								@title
								)  
		END 
	
	ELSE IF @StatementType = 'Select'  --שליפת כל הקטגוריות 
		BEGIN  
					SELECT * FROM categories_tbl
		END 
 	--ELSE IF @StatementType = 'SelectByTagId'  --שליפת כל התגיות 
  --  BEGIN  
  --          (
		--	SELECT		  
		--				tags.tag_id,
		--				tags.tag_title
		--	FROM		tags_tbl tags
		--	WHERE tags.tag_id=@tag_id
		--	)
			 
  --  END 
	--אין עדכון ומחיקה של תגיות.

	--ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
 --       BEGIN  
	--		UPDATE [tbl]
	--		SET [command]
	--		WHERE [condition]; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM [tbl]
	--		WHERE  [condition]  
	--        END  

END

GO
/****** Object:  StoredProcedure [dbo].[SPItems]    Script Date: 23/07/2020 15:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPItems]
	-- Add the parameters for the stored procedure here
	(
	@item_id nvarchar(32) = null, 
	@receipt_id	nvarchar(32) = null,
	@item_title	nvarchar(50) = null,
	@price float = null,
	@discount_dollar float = null,
	@discount_percent float = null,
	@item_description nvarchar(255) = null,
	@user_id nvarchar(50) = null,
	@item_image nvarchar(255) = 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg',
	@id_type char(10) = null,
	@category_id nvarchar(32) = null,
	@sub_category_id nvarchar(32) = null,
	@StatementType NVARCHAR(20) = '',
	--מיקום
	@user_lat VARCHAR(10)= null,
	@user_lon VARCHAR(10)= null,
	@user_location GEOGRAPHY= null,
	@user_rank int=null,
	--@title_words
	@max_price FLOAT= null,
	@min_price FLOAT= null,
	--@store_location GEOGRAPHY= null,
	@max_distance tinyint= null--distnace in Km
	)

	/*
	item_id	char(30)
	receipt_id	char(30)
	item_title	nvarchar(50)
	price	float
	discount_dollar	float
	discount_percent	float
	description	nvarchar(255)
	user_id	nvarchar(50)
	image	nvarchar(255)
	id_type	char(10)
	
	
	*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת אייטמים
        BEGIN  
            INSERT INTO items_tbl  
						( item_id,
						  receipt_id,
						  item_title,
						  price,
						  discount_dollar,
						  discount_percent,
						  item_description,
						  user_id,
						  item_image,
						  id_type,
						  category_id,
						  sub_category_id
						)  
            VALUES     (  @item_id,
						  @receipt_id,
						  isnull(@item_title,'No_Name'),
						  @price,
						  isnull( @discount_dollar,0),
						  isnull(@discount_percent,0),
						  isnull(@item_description,null),
						  @user_id,
						  isnull(@item_image,null),
						  @id_type,
						  @category_id,
						  @sub_category_id
						  )  
        END  
	ELSE IF @StatementType = 'Select'  --שליפת כל האייטמים המותרים להצגה, כולל נתונים על חנות, והקבלה
    BEGIN  
			--SET @store_location = geography::Point(ISNULL(@store_lat,0), ISNULL(@store_lon,0), 4326)
			SET @user_location= geography::Point(ISNULL(@user_lat,0), ISNULL(@user_lon,0), 4326)
			
			--SET @store_location = geography::Point(ISNULL(@store_lat,0), ISNULL(@store_lon,0), 4326)
            (SELECT		 TOP (ISNULL (@user_rank,10))
						  items.item_id,
						  items.receipt_id,
						  items.item_title,
						  items.price,
						  items.discount_dollar,
						  items.discount_percent,
						  items.item_description,
						  items.user_id,
						  users.user_rank,
						  items.item_image,
						  items.id_type,
						  --,receipts.date,
						  receipts.receipt_image,
						  receipts.receipt_description,
						  receipts.discount_dollar receipts_discount_dollar,
						  receipts.discount_percent receipts_discount_percent,
						  --stores.store_id,
						  stores.store_name,
						  stores.lat,
						  stores.lon,
						  @user_location.STDistance(geography::Point(ISNULL(stores.lat,0),ISNULL(stores.lon,0), 4326))/1000 as distance
						 FROM		receipts_tbl receipts	
						 inner join items_tbl items  on items.receipt_id= receipts.receipt_id
						 inner join stores_tbl stores on receipts.store_id= stores.store_id
						 inner join users_tbl users on users.user_id=receipts.user_id
		WHERE receipts.to_show=1
		and 
		(@user_location.STDistance(geography::Point(ISNULL(stores.lat,0), ISNULL(stores.lon,0), 4326)))/1000<=ISNULL(@max_distance,100)
		and
		items.price>= ISNULL(@min_price,0) and items.price<= ISNULL(NULLIF(@max_price,-1),
		(select TOP(1) i.price from items_tbl i order by i.price desc)
		)
		) 
		order by receipts.date,users.user_rank
		    END 
		ELSE IF @StatementType = 'SelectByItemId' 
    BEGIN  
            (
			SELECT		  items.item_id,
						  items.receipt_id,
						  items.item_title,
						  items.price,
						  items.discount_dollar,
						  items.discount_percent,
						  items.item_description,
						  items.user_id,
						  items.item_image,
						  items.id_type,
						  --,item tags
						  --,receipts.date,
						  receipts.receipt_image,
						  receipts.receipt_description,
						  receipts.discount_dollar receipts_discount_dollar,
						  receipts.discount_percent receipts_discount_percent,
						  --stores.store_id,
						  stores.store_name
						  --stores.lat,
						  --stores.lon
						 FROM		receipts_tbl receipts	
						 inner join items_tbl items  on items.receipt_id= receipts.receipt_id
						 inner join stores_tbl stores on receipts.store_id= stores.store_id
		WHERE receipts.to_show=1 
		and items.item_id=@item_id
		) 
    END 
	--אין עדכון ומחיקה של פריט בודד. פקודות מחיקה אלה ועדכון יעברו אל סטור פרוסיג'ר של קבלה.

	--ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
 --       BEGIN  
	--		UPDATE receipts_tbl
	--		SET to_show = 0
	--		WHERE receipt_id= @receipt_id; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM items_tbl	 WHERE  items_tbl.receipt_id = @receipt_id  
 --           DELETE FROM receipts_tbl WHERE receipts_tbl.receipt_id = @receipt_id
	--        END  

END
/*
DELETE ALL

DELETE FROM categories_tbl;
DELETE FROM items_tags_tbl;
DELETE FROM items_tbl;
DELETE FROM receipts_tbl;
DELETE FROM stores_tbl;
DELETE FROM sub_categories_tbl;
DELETE FROM tags_tbl;
DELETE FROM users_tbl;

*/
GO
/****** Object:  StoredProcedure [dbo].[SPItemsTags]    Script Date: 23/07/2020 15:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPItemsTags]
	-- Add the parameters for the stored procedure here
	(
	@item_id nvarchar(32)= null,
	@tag_id	nvarchar(32)= null,
	@StatementType NVARCHAR(20) = ''
	)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת תגיות
        BEGIN  
            INSERT INTO items_tags_tbl  
						( item_id,
						  tag_id
						)  
            VALUES     (  @item_id,
						  @tag_id
						)  
        END  
	ELSE IF @StatementType = 'Select'  --שליפת כל התגיות 
    BEGIN  
            SELECT		
						items_tags.item_id,
						items_tags.tag_id
			FROM		
						items_tags_tbl items_tags
			 
    END 
		ELSE IF @StatementType = 'SelectByItemId'  --שליפת כל תגיות של מוצר 
    BEGIN  
            SELECT		items_tags.tag_id, tags.tag_title
			FROM		items_tags_tbl items_tags inner join tags_tbl tags on items_tags.tag_id= tags.tag_id
			WHERE		items_tags.item_id = @item_id
			 
    END 
 		ELSE IF @StatementType = 'SelectByTagId'  --שליפת כל תגיות של מוצר 
    BEGIN  
            SELECT		items_tags.item_id
			FROM		items_tags_tbl items_tags
			WHERE		items_tags.tag_id = @tag_id
			 
    END 
	--אין עדכון ומחיקה של תגיות.

	--ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
 --       BEGIN  
	--		UPDATE [tbl]
	--		SET [command]
	--		WHERE [condition]; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM [tbl]
	--		WHERE  [condition]  
	--        END  
END
GO
/****** Object:  StoredProcedure [dbo].[SPReceipts]    Script Date: 23/07/2020 15:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPReceipts]
	-- Add the parameters for the stored procedure here
	(
	@receipt_id				nvarchar(32) = null,
	@user_id				varchar(50) = null,
	@date					date = null,
	@discount_dollar		float = null,
	@discount_percent		float = null,
	@to_show				bit = null,
	@receipt_image			nvarchar(255) = null,
	@store_id				nvarchar(32) = null,
	@receipt_description	nvarchar(255) = null,
	@StatementType			NVARCHAR(20) = ''
	)

	/*
	@receipt_id	char(30) = null,
	@user_id	varchar(50) = null,
	@date	date = null,
	@discount_dollar	float = null,
	@discount_percent	float = null,
	@to_show	bit = null,
	@receipt_image	nvarchar(255) = null,
	@store_id	char(30) = null,
	@receipt_description	nvarchar(255) = null
	
	*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת אייטמים
        BEGIN  
            INSERT INTO receipts_tbl  
						( receipt_id,
						  user_id,
						  date,
						  discount_dollar,
						  discount_percent,
						  --to_show,
						  receipt_image,
						  store_id,
						  receipt_description
						  /*
						    receipt_id
							user_id
							date
							discount_dollar
							discount_percent
							--to_show
							receipt_image
							store_id
							receipt_description

						  */
						)  
            VALUES     (  @receipt_id,
						  @user_id,
						  @date,
						  isnull(@discount_dollar,null),
						  isnull(@discount_percent,null),
						  --@to_show,
						  @receipt_image,
						  @store_id,
						  isnull(@receipt_description,null)
						  )  
        END  
	ELSE IF @StatementType = 'Select'  --שליפת כל הקבלות המותרות להצגה, והקבלה
    BEGIN  
            (SELECT		  
						  receipts.receipt_id,
						  receipts.user_id,
						  receipts.date,
						  receipts.discount_dollar,
						  receipts.discount_percent,
						  --to_show,
						  receipts.receipt_image,
						  receipts.store_id,
						  receipts.receipt_description
			FROM		
						  receipts_tbl receipts	
		WHERE receipts.to_show=1) 
    END 
		ELSE IF @StatementType = 'SelectByReceiptId'  --שליפת כל הקבלות המותרות להצגה, והקבלה
    BEGIN  
            (
			SELECT		  
						receipts.receipt_id,
						receipts.user_id,
						receipts.date,
						receipts.discount_dollar,
						receipts.discount_percent,
						--to_show,
						receipts.receipt_image,
						receipts.store_id,
						receipts.receipt_description
			FROM		
						receipts_tbl receipts	
			WHERE		receipts.to_show=1 
						and
						receipts.receipt_id=@receipt_id
			) 
    END 
	--אין עדכון של קבלה, רק חיקוי מחיקה.

	ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
        BEGIN  
			UPDATE receipts_tbl
			SET to_show = 0
			WHERE receipt_id= @receipt_id; 
        END  
		ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
        BEGIN  
			DELETE FROM items_tbl	 WHERE  items_tbl.receipt_id = @receipt_id  
            DELETE FROM receipts_tbl WHERE receipts_tbl.receipt_id = @receipt_id
	        END  

END
GO
/****** Object:  StoredProcedure [dbo].[SPStores]    Script Date: 23/07/2020 15:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPStores]
	-- Add the parameters for the stored procedure here
	(
	@store_id nvarchar(32) = null,
	@store_name nvarchar(50) = null,
	@lat float = null,
	@lon float = null,
	@StatementType NVARCHAR(20) = ''

	)
	/*
	store_id	char(30)
	store_name	nvarchar(50)
	lat	float
	lon	float
	*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת אייטמים
        BEGIN  
            INSERT INTO stores_tbl  
						( 
						store_id,
						store_name,
						lat,
						lon
						)  
            VALUES		(  
						@store_id,
						@store_name,
						@lat,
						@lon
						)  
        END  
	ELSE IF @StatementType = 'Select'  --שליפת כל החנויות
    BEGIN  
            (
			SELECT		stores.store_id,
						stores.store_name,
						stores.lat,
						stores.lon
						  
			FROM		stores_tbl stores	
			) 
    END 
		ELSE IF @StatementType = 'SelectByStoreId'  --שליפת חנות לפי איידי
    BEGIN  
            (
			SELECT		stores.store_id,
						stores.store_name,
						stores.lat,
						stores.lon
						  
			FROM		stores_tbl stores
			WHERE stores.store_id=@store_id
			) 
    END 
	--אין עדכון ומחיקה של חנות.

	--ELSE IF @StatementType = 'Update'
 --       BEGIN  
	--		UPDATE stores_tbl
	--		SET to_show = 0
	--		WHERE receipt_id= @receipt_id; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'
 --       BEGIN  
	--		DELETE FROM stores_tbl	 WHERE  items_tbl.receipt_id = @receipt_id  
 --           DELETE FROM receipts_tbl WHERE receipts_tbl.receipt_id = @receipt_id
	--        END  
	END

GO
/****** Object:  StoredProcedure [dbo].[SPSubCategory]    Script Date: 23/07/2020 15:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPSubCategory]
	-- Add the parameters for the stored procedure here
	(
	@id	nvarchar(32)= null,
	@title char(50)= null,
	@StatementType NVARCHAR(20) = ''
	)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת תגיות
		BEGIN  
					INSERT INTO sub_categories_tbl  
								( 
								sub_category_id,
								sub_category_title
								)  
					VALUES		(
								@id,
								@title
								)  
		END 
	
	ELSE IF @StatementType = 'Select'  --שליפת כל הקטגוריות 
		BEGIN  
					SELECT * FROM sub_categories_tbl
		END 
 	--ELSE IF @StatementType = 'SelectByTagId'  --שליפת כל התגיות 
  --  BEGIN  
  --          (
		--	SELECT		  
		--				tags.tag_id,
		--				tags.tag_title
		--	FROM		tags_tbl tags
		--	WHERE tags.tag_id=@tag_id
		--	)
			 
  --  END 
	--אין עדכון ומחיקה של תגיות.

	--ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
 --       BEGIN  
	--		UPDATE [tbl]
	--		SET [command]
	--		WHERE [condition]; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM [tbl]
	--		WHERE  [condition]  
	--        END  

END

GO
/****** Object:  StoredProcedure [dbo].[SPTags]    Script Date: 23/07/2020 15:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPTags]
	-- Add the parameters for the stored procedure here
	(
	@tag_id	nvarchar(32)= null,
	@tag_title char(50)= null,
	@item_id nvarchar(32)= null,
	@StatementType NVARCHAR(20) = ''
	)
	/*
	@item_id char(30)
	@tag_id	int
	
	*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert'  --הכנסת נתונים לטבלת תגיות
        BEGIN  
            INSERT INTO tags_tbl  
						( tag_id,
						  tag_title
						)  
            VALUES     (  @tag_id,
						  @tag_title
						)  
        END  
	ELSE IF @StatementType = 'Select'  --שליפת כל התגיות 
    BEGIN  
            SELECT		  
						tags.tag_id,
						tags.tag_title
						 FROM		tags_tbl tags
			 
    END 
 	ELSE IF @StatementType = 'SelectByTagId'  --שליפת כל התגיות 
    BEGIN  
            (
			SELECT		  
						tags.tag_id,
						tags.tag_title
			FROM		tags_tbl tags
			WHERE tags.tag_id=@tag_id
			)
			 
    END 
	--אין עדכון ומחיקה של תגיות.

	--ELSE IF @StatementType = 'Update' --חיקוי מחיקה בלבד. הופך קבלה לבלתי ניתנת להצגה 
 --       BEGIN  
	--		UPDATE [tbl]
	--		SET [command]
	--		WHERE [condition]; 
 --       END  
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM [tbl]
	--		WHERE  [condition]  
	--        END  

END

GO
/****** Object:  StoredProcedure [dbo].[SPUsers]    Script Date: 23/07/2020 15:23:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
--SET ANSI_NULLS ON
--GO
--SET QUOTED_IDENTIFIER ON
--GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPUsers]
	-- Add the parameters for the stored procedure here
	(
	@user_id		varchar(50)	=null,
	@first_name		nvarchar(50)=null,	
	@last_name		nvarchar(50)=null,	
	@password		nvarchar(16)=null,	
	@birthdate		date=null,
	@gender			bit	=null,
	@state			nchar(50)	=null,
	@city			nchar(50)	=null,
	@user_rank		int	=null,
	@item_id		nvarchar(32) = null,
	@add_or_remove	bit=null,
	@field2Update	NVARCHAR(20) = '',
	@StatementType	NVARCHAR(20) = ''

	)

	/*
	@user_id	varchar(50)	=null,
	@first_name	nvarchar(50)=null,	
	@last_name	nvarchar(50)=null,	
	@password	nvarchar(16)=null,	
	@birthdate	date	=null,
	@gender	bit	=null,
	@state	nchar(50)	=null,
	@city	nchar(50)	=null,
	@user_rank	int	=null
		
	@user_id,
	@first_name,	
	@last_name,	
	@password,	
	@birthdate,
	@gender,
	@state,
	@city,
	@user_rank,

	
	*/
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

    -- Insert statements for procedure here
	IF @StatementType = 'Insert' 
		BEGIN  
			INSERT INTO users_tbl  
				( 
				user_id,
				first_name,	
				last_name,	
				password,	
				birthdate,
				gender,
				state,
				city,
				user_rank
				)  
			VALUES     
				(	
				@user_id,
				@first_name,	
				@last_name,	
				@password,	
				ISNULL(@birthdate,GETDATE()),
				@gender,
				@state,
				@city,
				@user_rank
				)  
		END  
	ELSE IF @StatementType = 'Select' 
		BEGIN  
			(
			SELECT 
				users.user_id,
				users.first_name,	
				users.last_name,	
				users.password,	
				users.birthdate,
				users.gender,
				users.state,
				users.city,
				users.user_rank
			FROM 
				users_tbl users
			) 
		
		END 
	ELSE IF @StatementType = 'SelectByUserId' 
		BEGIN  
			(
			SELECT 
				users.user_id,
				users.first_name,	
				users.last_name,	
				users.password,	
				users.birthdate,
				users.gender,
				users.state,
				users.city,
				users.user_rank
			FROM 
				users_tbl users
			WHERE
				users.user_id=@user_id
			) 
		END 

	ELSE IF @StatementType = 'Update'
        BEGIN  
			UPDATE users_tbl
			SET user_rank+=@user_rank
			WHERE user_id= @user_id; 
        END  
	ELSE IF @StatementType = 'UpdateProfile' 
        BEGIN  
				 IF(@field2Update='name')
			BEGIN 
				UPDATE users_tbl
				SET first_name=@first_name ,last_name=@last_name
				WHERE user_id= @user_id; 
			END
			ELSE IF(@field2Update='password')
			BEGIN 
				UPDATE users_tbl
				SET password=@password
				WHERE user_id= @user_id; 
			END
			ELSE IF(@field2Update='birthdate')
			BEGIN 
				UPDATE users_tbl
				SET birthdate=ISNULL(@birthdate,GETDATE())
				WHERE user_id= @user_id; 
			END
			ELSE IF(@field2Update='gender')
			BEGIN 
				UPDATE users_tbl
				SET gender=@gender
				WHERE user_id= @user_id; 
			END
			ELSE IF(@field2Update='state')
			BEGIN 
				UPDATE users_tbl
				SET state=@state
				WHERE user_id= @user_id; 
			END
			ELSE IF(@field2Update='city')
			BEGIN 
				UPDATE users_tbl
				SET city=@city
				WHERE user_id= @user_id; 
			END
			ELSE IF (@field2Update='favorites')
			BEGIN
			IF (@add_or_remove = 1)--add
				BEGIN
				INSERT INTO favorites_tbl VALUES(@user_id, @item_id)
				END
			ELSE IF (@add_or_remove = 0)--remove
				BEGIN
					DELETE FROM favorites_tbl
					WHERE user_id=@user_id and item_id=@item_id
				 END
			END
        END 
		ELSE IF @StatementType='selectUserFavorites'
		BEGIN
			SELECT * FROM favorites_tbl 
			WHERE user_id=@user_id
		END
	--	ELSE IF @StatementType = 'Delete'  -- מחיקה אמיתית של אייטמים והקבלה שלהם.
 --       BEGIN  
	--		DELETE FROM items_tbl	 WHERE  items_tbl.receipt_id = @receipt_id  
 --           DELETE FROM receipts_tbl WHERE receipts_tbl.receipt_id = @receipt_id
	--        END  

END
GO
USE [master]
GO
ALTER DATABASE [bgroup4_prod] SET  READ_WRITE 
GO
