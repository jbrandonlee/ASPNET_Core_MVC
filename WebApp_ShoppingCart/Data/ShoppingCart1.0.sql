USE [ShoppingCart]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 10-Oct-23 2:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [varchar](50) NOT NULL,
	[ProductID] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ActivationCode] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC,
	[ActivationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHeader]    Script Date: 10-Oct-23 2:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeader](
	[OrderID] [varchar](50) NOT NULL,
	[CustomerCode] [varchar](50) NOT NULL,
	[PurchaseDate] [date] NOT NULL,
	[TotalPrice] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductList]    Script Date: 10-Oct-23 2:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductList](
	[ProductID] [varchar](50) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Description] [varchar](50) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[ImageURL] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10-Oct-23 2:27:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Address] [varchar](128) NULL,
	[Phone] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [ActivationCode]) VALUES (N'A1823', N'CA001', 1, N'O43G5UA7O2')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [ActivationCode]) VALUES (N'A1823', N'CA028', 1, N'A34H67FO2R')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [Quantity], [ActivationCode]) VALUES (N'A1823', N'CA028', 1, N'TI23S54OGS')
GO
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerCode], [PurchaseDate], [TotalPrice]) VALUES (N'A1823', N'DaddyLuke', CAST(N'2023-10-09' AS Date), CAST(100.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA001', N'Item 1', N'Item 1', CAST(20.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA002', N'Item 2', N'Item 2', CAST(30.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA003', N'Item 3', N'Item 3', CAST(25.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA004', N'Item 4', N'Item 4', CAST(40.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA005', N'Item 5', N'Item 5', CAST(25.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA006', N'Item 6', N'Item 6', CAST(35.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA007', N'Item 7', N'Item 7', CAST(50.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA008', N'Item 8', N'Item 8', CAST(15.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA009', N'Item 9', N'Item 9', CAST(20.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA010', N'Item 10', N'Item 10', CAST(30.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA011', N'Item 11', N'Item 11', CAST(25.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA012', N'Item 12', N'Item 12', CAST(40.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA013', N'Item 13', N'Item 13', CAST(25.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA014', N'Item 14', N'Item 14', CAST(35.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA015', N'Item 15', N'Item 15', CAST(50.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA016', N'Item 16', N'Item 16', CAST(15.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA017', N'Item 17', N'Item 17', CAST(20.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA018', N'Item 18', N'Item 18', CAST(30.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA019', N'Item 19', N'Item 19', CAST(25.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA020', N'Item 20', N'Item 20', CAST(40.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA021', N'Item 21', N'Item 21', CAST(25.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA022', N'Item 22', N'Item 22', CAST(35.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA023', N'Item 23', N'Item 23', CAST(50.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA024', N'Item 24', N'Item 24', CAST(15.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA025', N'Item 25', N'Item 25', CAST(20.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA026', N'Item 26', N'Item 26', CAST(30.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA027', N'Item 27', N'Item 27', CAST(25.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA028', N'Item 28', N'Item 28', CAST(40.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA029', N'Item 29', N'Item 29', CAST(25.00 AS Decimal(10, 2)), N'NULL')
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price], [ImageURL]) VALUES (N'CA030', N'Item 30', N'Item 30', CAST(35.00 AS Decimal(10, 2)), N'NULL')
GO
INSERT [dbo].[User] ([Username], [Password], [Name], [Address], [Phone], [Email]) VALUES (N'DaddyLuke', N'lululu', N'Luke', N'Buona Vista', N'11191919', N'luke@gmail.com')
INSERT [dbo].[User] ([Username], [Password], [Name], [Address], [Phone], [Email]) VALUES (N'GodBrandon', N'brabrabra', N'Brandon', N'Common Wealth', N'10087887', N'brandon@gmail.com')
GO
ALTER TABLE [dbo].[OrderHeader]  WITH CHECK ADD FOREIGN KEY([CustomerCode])
REFERENCES [dbo].[User] ([Username])
GO
