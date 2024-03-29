USE [ShoppingCart]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 16/10/2023 2:40:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[CustomerID] [varchar](50) NOT NULL,
	[ProductID] [varchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[Date] [date] NOT NULL,
 CONSTRAINT [PK__Cart__CD27494E4FDD6425] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 16/10/2023 2:40:58 pm ******/
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
/****** Object:  Table [dbo].[OrderHeader]    Script Date: 16/10/2023 2:40:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderHeader](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [varchar](50) NOT NULL,
	[PurchaseDate] [date] NOT NULL,
 CONSTRAINT [PK__OrderHea__C3905BAF04597D28] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductList]    Script Date: 16/10/2023 2:40:58 pm ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 16/10/2023 2:40:58 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](50) NOT NULL,
	[Passhash] [varchar](300) NOT NULL,
	[Displayname] [varchar](50) NOT NULL,
 CONSTRAINT [PK__User__536C85E54921E7D4] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [Date]) VALUES (N'04dadca6-eff1-d2af-bce6-2b523a09ab85', N'CS002', 1, CAST(N'2023-10-16' AS Date))
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [Date]) VALUES (N'04dadca6-eff1-d2af-bce6-2b523a09ab85', N'CS003', 1, CAST(N'2023-10-16' AS Date))
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [Date]) VALUES (N'admin', N'CS002', 1, CAST(N'2023-10-16' AS Date))
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [Date]) VALUES (N'admin', N'CS003', 1, CAST(N'2023-10-16' AS Date))
INSERT [dbo].[Cart] ([CustomerID], [ProductID], [Quantity], [Date]) VALUES (N'b699ed18-d9f3-4886-b06d-9a0f7999e02d', N'CS003', 1, CAST(N'2023-10-16' AS Date))
GO
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'1', N'CS002', N'5a7a616f-852d-48ff-b6e5-a67769c2d8cb')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'1', N'CS002', N'f8acea8b-a371-43cf-988f-6169e3c1f8b2')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'1', N'CS008', N'4f7fdc0f-9137-4f2f-a555-2796d637a702')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'2', N'JV006', N'4d292311-dae1-4ca2-97b0-e39280e26c9a')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'2', N'JV006', N'8a785f0b-c720-4c6f-bec4-6b03bea7eae8')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'2', N'JV006', N'dd502739-2523-4b3e-a250-222101472008')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'3', N'PY004', N'32787f75-ce7b-4cb8-81f5-fa9484ea2805')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'4', N'CS008', N'4b7d7e3b-4eaa-42de-b6bf-e7a5dd9fcd96')
INSERT [dbo].[OrderDetails] ([OrderID], [ProductID], [ActivationCode]) VALUES (N'4', N'PY005', N'81bbce30-8ef6-4e26-bbd1-a3ba371144ff')
GO
SET IDENTITY_INSERT [dbo].[OrderHeader] ON 

INSERT [dbo].[OrderHeader] ([OrderID], [CustomerID], [PurchaseDate]) VALUES (1, N'john', CAST(N'2022-05-12' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerID], [PurchaseDate]) VALUES (2, N'john', CAST(N'2023-06-25' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerID], [PurchaseDate]) VALUES (3, N'john', CAST(N'2023-06-25' AS Date))
INSERT [dbo].[OrderHeader] ([OrderID], [CustomerID], [PurchaseDate]) VALUES (4, N'john', CAST(N'2023-07-02' AS Date))
SET IDENTITY_INSERT [dbo].[OrderHeader] OFF
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
INSERT [dbo].[User] ([Username], [Passhash], [Displayname]) VALUES (N'admin', N'b2e98ad6f6eb8508dd6a14cfa704bad7f05f6fb1', N'Administrator')
INSERT [dbo].[User] ([Username], [Passhash], [Displayname]) VALUES (N'john', N'e38ad214943daad1d64c102faec29de4afe9da3d', N'John Tan')
GO
ALTER TABLE [dbo].[OrderHeader]  WITH CHECK ADD  CONSTRAINT [FK__OrderHead__Custo__3F466844] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[OrderHeader] CHECK CONSTRAINT [FK__OrderHead__Custo__3F466844]
GO
