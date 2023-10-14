USE [ShoppingCart]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 14-Oct-23 3:11:43 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cart](
	[CustomerCode] [varchar](50) NOT NULL,
	[ProductID] [varchar](50) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Description] [varchar](200) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerCode] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 14-Oct-23 12:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderID] [varchar](50) NOT NULL,
	[ProductID] [varchar](50) NOT NULL,
	[ActivationCode] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC,
	[ActivationCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderHeader]    Script Date: 14-Oct-23 12:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeader](
	[OrderID] [varchar](50) NOT NULL,
	[CustomerCode] [varchar](50) NOT NULL,
	[PurchaseDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductList]    Script Date: 14-Oct-23 12:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductList](
	[ProductID] [varchar](50) NOT NULL,
	[ProductName] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 14-Oct-23 12:20:42 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](50) NOT NULL,
	[Passhash] [varchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2869', N'CS002', N'A')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2869', N'CS008', N'B')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2869', N'PY006', N'C')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2870', N'JV002', N'D')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2871', N'CS008', N'E')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2871', N'CS009', N'F')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2872', N'JV006', N'G')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2873', N'CS002', N'K')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2873', N'CS005', N'J')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2873', N'PY003', N'H')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2873', N'PY003', N'I')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2874', N'PY004', N'L')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2875', N'CS002', N'M')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2876', N'CS004', N'N')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2876', N'CS004', N'O')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2877', N'PY008', N'P')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2878', N'CS008', N'S')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2878', N'PY009', N'Q')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'O2878', N'PY009', N'R')
GO
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerCode], [PurchaseDate]) VALUES (N'O2869', N'John', CAST(N'2022-05-15' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerCode], [PurchaseDate]) VALUES (N'O2870', N'John', CAST(N'2023-05-12' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerCode], [PurchaseDate]) VALUES (N'O2871', N'John', CAST(N'2023-06-25' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerCode], [PurchaseDate]) VALUES (N'O2872', N'John', CAST(N'2023-07-02' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerCode], [PurchaseDate]) VALUES (N'O2873', N'John', CAST(N'2023-07-10' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerCode], [PurchaseDate]) VALUES (N'O2874', N'John', CAST(N'2023-07-21' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerCode], [PurchaseDate]) VALUES (N'O2875', N'John', CAST(N'2023-08-01' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerCode], [PurchaseDate]) VALUES (N'O2876', N'John', CAST(N'2023-08-18' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerCode], [PurchaseDate]) VALUES (N'O2877', N'John', CAST(N'2023-09-30' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerCode], [PurchaseDate]) VALUES (N'O2878', N'John', CAST(N'2023-10-15' AS Date))
GO
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'CS001', N'.NET Charts', N'Brings powerful charting capabilities to your .NET applications.', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'CS002', N'.NET Paypal', N'Integrate your .NET apps with PayPal the easy way!', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'CS003', N'.NET ML', N'Supercharged .NET machine learning libraries.', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'CS004', N'.NET Analytics', N'Performs data mining and analytics easily in .NET.', CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'CS005', N'.NET Logger', N'Logs and aggregates events easily in your .NET apps.', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'CS006', N'.NET Numerics', N'Powerful numerical methods for your .NET simulations.', CAST(35.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'CS007', N'.NET Identity', N'Contains the binaries of the Microsoft Authentication Library for .NET.', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'CS008', N'.NET Azure', N'Implementation the Azure Client Pipeline in your .NET applications.', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'CS009', N'.NET AWS', N'Integrate easily with the popular Amazon Web Services SDK for .NET.', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'CS010', N'.NET Diagnostics', N'Provides diagnostic tools for your .NET applications.', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'JV001', N'Java Charts', N'Brings powerful charting capabilities to your Java applications.', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'JV002', N'Java Paypal', N'Integrate your Java apps with PayPal the easy way!', CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'JV003', N'Java ML', N'Supercharged Java machine learning libraries.', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'JV004', N'Java Analytics', N'Performs data mining and analytics easily in Java.', CAST(35.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'JV005', N'Java Logger', N'Logs and aggregates events easily in your Java apps.', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'JV006', N'Java Numerics', N'Powerful numerical methods for your Java simulations.', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'JV007', N'Java Identity', N'Contains the binaries of the Microsoft Authentication Library for Java.', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'JV008', N'Java Azure', N'Implementation the Azure Client Pipeline in your Java applications.', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'JV009', N'Java AWS', N'Integrate easily with the popular Amazon Web Services SDK for Java.', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'JV010', N'Java Diagnostics', N'Provides diagnostic tools for your Java applications.', CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'PY001', N'Python Charts', N'Brings powerful charting capabilities to your Python applications.', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'PY002', N'Python Paypal', N'Integrate your Python apps with PayPal the easy way!', CAST(35.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'PY003', N'Python ML', N'Supercharged Python machine learning libraries.', CAST(50.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'PY004', N'Python Analytics', N'Performs data mining and analytics easily in Python.', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'PY005', N'Python Logger', N'Logs and aggregates events easily in your Python apps.', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'PY006', N'Python Numerics', N'Powerful numerical methods for your Python simulations.', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'PY007', N'Python Identity', N'Contains the binaries of the Microsoft Authentication Library for Python.', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'PY008', N'Python Azure', N'Implementation the Azure Client Pipeline in your Python applications.', CAST(40.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'PY009', N'Python AWS', N'Integrate easily with the popular Amazon Web Services SDK for Python.', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[ProductList] ([ProductID], [ProductName], [Description], [Price]) VALUES (N'PY010', N'Python Diagnostics', N'Provides diagnostic tools for your Python applications.', CAST(35.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[User] ([Username], [Passhash]) VALUES (N'Admin', N'b2e98ad6f6eb8508dd6a14cfa704bad7f05f6fb1')
INSERT [dbo].[User] ([Username], [Passhash]) VALUES (N'John', N'e38ad214943daad1d64c102faec29de4afe9da3d')
GO
ALTER TABLE [dbo].[OrderHeader]  WITH CHECK ADD FOREIGN KEY([CustomerCode])
REFERENCES [dbo].[User] ([Username])
GO
