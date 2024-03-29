USE [master]
GO
/****** Object:  Database [test]    Script Date: 3/16/2024 2:15:52 AM ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\test.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [test] SET QUERY_STORE = ON
GO
ALTER DATABASE [test] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [test]
GO
/****** Object:  Table [dbo].[ApartmentInfo]    Script Date: 3/16/2024 2:15:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApartmentInfo](
	[ApartmentID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [text] NULL,
	[Location] [varchar](255) NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Area] [float] NULL,
	[Bedrooms] [int] NULL,
	[Bathrooms] [int] NULL,
	[LandlordID] [int] NULL,
	[ListingID] [int] NULL,
	[imgsrc] [text] NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ApartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 3/16/2024 2:15:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[ListingID] [int] NULL,
	[TenantID] [int] NULL,
	[AppointmentDate] [datetime] NULL,
	[Status] [varchar](20) NOT NULL,
	[ContactPhone] [nchar](10) NULL,
	[RoomSelected] [nvarchar](20) NULL,
	[LandlordID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChatMessages]    Script Date: 3/16/2024 2:15:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatMessages](
	[MessageID] [int] IDENTITY(1,1) NOT NULL,
	[SenderID] [int] NULL,
	[ReceiverID] [int] NULL,
	[MessageText] [text] NULL,
	[SentAt] [datetime] NULL,
	[IsRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MessageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 3/16/2024 2:15:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ListingID] [int] NULL,
	[Comment] [text] NULL,
	[CommentedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contracts]    Script Date: 3/16/2024 2:15:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contracts](
	[ContractID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NULL,
	[TenantID] [int] NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [varchar](10) NOT NULL,
	[LandlordID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Listings]    Script Date: 3/16/2024 2:15:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Listings](
	[ListingID] [int] IDENTITY(1,1) NOT NULL,
	[LandlordID] [int] NULL,
	[ContactEmail] [varchar](100) NOT NULL,
	[ContactPhone] [varchar](20) NULL,
	[CreatedAt] [datetime] NULL,
	[Title] [text] NULL,
	[imgsrc] [text] NULL,
	[Location] [text] NULL,
	[Descriptions] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 3/16/2024 2:15:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ListingID] [int] NULL,
	[Rating] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Report]    Script Date: 3/16/2024 2:15:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Report](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ListingID] [int] NULL,
	[CreateAt] [date] NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 3/16/2024 2:15:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ContractID] [int] NULL,
	[TransactionDate] [datetime] NULL,
	[ApartmentID] [int] NULL,
	[Status] [nchar](10) NULL,
	[Ammount] [decimal](18, 0) NULL,
	[Description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3/16/2024 2:15:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[UserType] [varchar](10) NOT NULL,
	[Balance] [float] NULL,
	[ContactPhone] [nchar](10) NULL,
	[imgsrc] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ApartmentInfo] ON 

INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (27, N'Phong tro van minh', N'P103', N'85 Nguyen Huu Cau', CAST(2800000.00 AS Decimal(10, 2)), 35, 1, 1, 30, 32, N'.\uploads\image.webp', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (28, N'Phong tro van minh', N'P301', N'85 Nguyen Huu Cau', CAST(2800000.00 AS Decimal(10, 2)), 35, 1, 1, 30, 32, N'.\uploads\image.webp', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (29, N'Phong tro van minh', N'P202', N'85 Nguyen Huu Cau', CAST(2350000.00 AS Decimal(10, 2)), 15, 1, 1, 30, 32, N'.\uploads\image (1).webp', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (30, N'Phong tro van minh', N'P401', N'85 Nguyen Huu Cau', CAST(2800000.00 AS Decimal(10, 2)), 35, 1, 1, 30, 32, N'.\uploads\image (2).webp', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (31, N'Phong tro 28 pham van ngon', N'P101', N'28 Pham Van Ngon', CAST(1800000.00 AS Decimal(10, 2)), 32, 1, 1, 8, 33, N'.\uploads\f1d6ff4f-59e6-4860-986a-bb715d5cbd01_1707731490.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (32, N'Phan Van Dinh', N'P103', N'Bau Mac 19', CAST(1500000.00 AS Decimal(10, 2)), 22, 1, 1, 29, 34, N'.\uploads\881a59ad-f6c9-40df-9045-5892e17b8f63_1599188307.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (33, N'HP House', N'P103', N'Kiet 53 Duong 2/9', CAST(1800000.00 AS Decimal(10, 2)), 32, 1, 1, 29, 35, N'.\uploads\z5235676856980-ce667346d751865202c3fe6a83e1b1d0_1710231940.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (34, N'HP House', N'P102', N'Kiet 53 Duong 2/9', CAST(1800000.00 AS Decimal(10, 2)), 30, 1, 1, 29, 35, N'.\uploads\431656849-414384824333456-8834023616841242527-n_1710231935.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (35, N'Phong tro thanh khe', N'P101', N' 196/50 A Tran Cao Van', CAST(2000000.00 AS Decimal(10, 2)), 28, 1, 1, 32, 36, N'.\uploads\58ee4535-f836-4d66-b4f5-1852d4774348_1593397551.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (36, N'Phong tro Cam Le', N'P101', N'248/6 Cach mang thang 8', CAST(1800000.00 AS Decimal(10, 2)), 28, 1, 1, 28, 37, N'.\uploads\20160625104031-6986_1591524177.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (37, N'Phong tro Dai hoc bach khoa', N'P202', N'373/1/2A Ly Thuong Kiet', CAST(3900000.00 AS Decimal(10, 2)), 29, 1, 1, 30, 38, N'.\uploads\z2372635821190-967d30125f3fa89ebd719f3e093c973f_1615391057.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (38, N'Phong tro Hoa Xuan', N'P103', N'Thanh Luong 27', CAST(1800000.00 AS Decimal(10, 2)), 30, 1, 1, 30, 39, N'.\uploads\642a8004-caa9-4470-93b9-506a6025cc22_1587560000.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (39, N'Can Ho Lien Chieu', N'P401', N'5 Ngo Thuy Nham', CAST(3900000.00 AS Decimal(10, 2)), 46, 2, 1, 11, 40, N'.\uploads\a901909462d7bc89e5c6_1709977318 (1).jpg', N'Deposited')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (40, N'Can Ho Lien Chieu', N'P402', N'5 Ngo Thuy Nham', CAST(4000000.00 AS Decimal(10, 2)), 40, 2, 1, 11, 40, N'.\uploads\1_1709977325.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (41, N'Phong tro Son Tra', N'P103', N'237 Ngo Quyen', CAST(2350000.00 AS Decimal(10, 2)), 35, 1, 1, 30, 41, N'.\uploads\431313867-916521259884410-6352771416343204444-n_1709525450.jpg', N'Rentable')
SET IDENTITY_INSERT [dbo].[ApartmentInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentID], [ListingID], [TenantID], [AppointmentDate], [Status], [ContactPhone], [RoomSelected], [LandlordID]) VALUES (16, 41, 7, CAST(N'2024-03-17T11:11:00.000' AS DateTime), N'Cancelled', N'0947199561', N'P103', 30)
INSERT [dbo].[Appointments] ([AppointmentID], [ListingID], [TenantID], [AppointmentDate], [Status], [ContactPhone], [RoomSelected], [LandlordID]) VALUES (17, 41, 7, CAST(N'2024-03-17T15:00:00.000' AS DateTime), N'Pending', N'0947199561', N'P103', 30)
INSERT [dbo].[Appointments] ([AppointmentID], [ListingID], [TenantID], [AppointmentDate], [Status], [ContactPhone], [RoomSelected], [LandlordID]) VALUES (18, 41, 7, CAST(N'2024-03-18T14:22:00.000' AS DateTime), N'Approved', N'0947199561', N'P103', 30)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (46, 7, 41, N'phong dep', CAST(N'2024-03-16T01:47:36.990' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (47, 7, 39, N'aaaaa', CAST(N'2024-03-16T01:47:58.587' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (48, 7, 41, N'phong thoang', CAST(N'2024-03-16T01:48:09.927' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (49, 30, 41, N'cam on nhe ', CAST(N'2024-03-16T01:49:20.677' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (50, 30, 41, N'...', CAST(N'2024-03-16T01:49:27.197' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (51, 11, 41, N'wow', CAST(N'2024-03-16T01:51:17.127' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Contracts] ON 

INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (1, 12, 28, CAST(N'2024-02-28' AS Date), CAST(N'2024-08-28' AS Date), N'Active', 28)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (2, 16, 7, CAST(N'2024-02-28' AS Date), CAST(N'2024-08-28' AS Date), N'Active', 28)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (3, 20, 31, CAST(N'2024-02-28' AS Date), CAST(N'2024-08-28' AS Date), N'Active', 32)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (4, 15, 7, CAST(N'2024-02-29' AS Date), CAST(N'2024-08-29' AS Date), N'Active', 30)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (5, 14, 7, CAST(N'0008-07-16' AS Date), CAST(N'0015-07-17' AS Date), N'Active', 30)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (6, 14, 27, CAST(N'2024-06-26' AS Date), CAST(N'2024-10-10' AS Date), N'Aproved', 30)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (7, 20, 7, CAST(N'2024-03-04' AS Date), CAST(N'2024-12-04' AS Date), N'ByCash', 32)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (8, 14, 7, CAST(N'2024-03-05' AS Date), CAST(N'2024-12-05' AS Date), N'Active', 30)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (9, 14, 7, CAST(N'2024-03-05' AS Date), CAST(N'2024-12-05' AS Date), N'Active', 30)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (10, 19, 7, CAST(N'2024-03-08' AS Date), CAST(N'2024-12-08' AS Date), N'Active', 30)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (11, 19, 7, CAST(N'2024-03-08' AS Date), CAST(N'2024-12-08' AS Date), N'Active', 30)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (12, 23, 7, CAST(N'2024-03-13' AS Date), CAST(N'2024-12-13' AS Date), N'Aproved', 30)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (13, 26, 7, CAST(N'2024-03-13' AS Date), CAST(N'2024-12-30' AS Date), N'Active', 30)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (19, 39, 7, CAST(N'2024-03-16' AS Date), CAST(N'2024-12-16' AS Date), N'Active', 11)
INSERT [dbo].[Contracts] ([ContractID], [PropertyID], [TenantID], [StartDate], [EndDate], [Status], [LandlordID]) VALUES (20, 41, 7, CAST(N'2024-03-16' AS Date), CAST(N'2024-12-16' AS Date), N'Active', 30)
SET IDENTITY_INSERT [dbo].[Contracts] OFF
GO
SET IDENTITY_INSERT [dbo].[Listings] ON 

INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions], [Status]) VALUES (32, 30, N'tuan123@gmail.com', N'    0868289502', CAST(N'2024-03-16T01:19:47.537' AS DateTime), N'Phong tro van minh', N'.\uploads\image_2024-03-16_011911486.png', N'   85 Nguyen Huu Cau', N'he thong nha tro day du tien nghi, sach se, mang khong gian, loi song van minh tich cuc den voi toan bo cu dan', N'Approved')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions], [Status]) VALUES (33, 8, N'dinhbang@gmail.com', N'0947199561', CAST(N'2024-03-16T01:29:02.523' AS DateTime), N'Phong tro 28 pham van ngon', N'.\uploads\38adbf5f-cd18-4adf-a4de-14e9236c1631_1707731486.jpg', N'28 Pham Van Ngon', N'Nháº­n cá»c phÃ²ng tá»« hÃ´m nay

Khai trÆ°Æ¡ng m6 táº¿t! sá» lÆ°á»£ng giá»i háº¡n, nhanh tay ÄÄng kÃ½!!!

KHÃNG NGáº¬P - KHU AN NINH - Äáº¦Y Äá»¦ TIá»N NGHI

Thang MÃ¡y hiá»n Äáº¡i 

MÃ¡y láº¡nh má»i tinh, mÃ¡y nÆ°á»ng nÃ³ng, giÆ°á»ng tá»§, báº¿p riÃªng biá»t 

 

Wifi cá»±c máº¡nh, chá» Äá» xe an ninh, PCCC Äáº¡t chuáº©n 

SÃ¢n phÆ¡i thoÃ¡ng, nhiá»u giÃ³ vÃ  náº¯ng 

Vá» TrÃ­ TT phÆ°á»ng HÃ²a KhÃ¡nh, LiÃªn Chiá»u. Gáº§n TrÆ°á»ng Äáº¡i há»c BÃ¡ch Khoa, Cao Äáº³ng Kinh Táº¿ Káº¿ Hoáº¡ch, ÄH SÆ° Pháº¡m, Chá»£ HÃ²a KhÃ¡nh, Khu CÃ´ng Nghiá»p HK, Biá»n Nguyá»n Táº¥t ThÃ nh....

KhÃ´ng giá»i háº¡n giá» giáº¥c 

GiÃ¡ thuÃª tá»« 1.8tr-3tr (2-4 ngÆ°á»i á»)

Cá»c : 1 thÃ¡ng

Äiá»n: 3,8k/sá», NÆ°á»c: 50k/ngÆ°á»i

Khuyáº¿n mÃ£i cho HÄ tráº£ trÆ°á»c tá»« 3T trá» lÃªn....

Vá» trÃ­ sá» 28-30 Pháº¡m VÄn NgÃ´n, phÆ°á»ng HÃ²a KhÃ¡nh Báº¯c, quáº­n LiÃªn Chiá»u, TP ÄN', N'Approved')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions], [Status]) VALUES (34, 29, N'doanquan123@gmail.com', N' 0947199561', CAST(N'2024-03-16T01:31:10.743' AS DateTime), N'Phan Van Dinh', N'.\uploads\ac84f152-1f30-465b-a4e1-8f16d4215c13_1599188322.jpg', N'Bau Mac 19', N'', N'Approved')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions], [Status]) VALUES (35, 29, N'doanquan123@gmail.com', N'0947199561', CAST(N'2024-03-16T01:33:18.717' AS DateTime), N'HP House', N'.\uploads\z5188188571445-ec60a6495d11dd4e4eafffbc0b919b69_1709129055.jpg', N'Kiet 53 Duong 2/9', N'aaaaaa', N'Approved')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions], [Status]) VALUES (36, 32, N'nguoichothue1@gmail.com', N'0947199561', CAST(N'2024-03-16T01:36:03.770' AS DateTime), N'Phong tro thanh khe', N'.\uploads\466048f8-32a4-4dae-aa55-ddb8568abf1a_1593397573.jpg', N' 196/50 A Tran Cao Van', N'qweqweqwe', N'Approved')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions], [Status]) VALUES (37, 28, N'nhat123@gmail.com', N'09914777', CAST(N'2024-03-16T01:37:59.937' AS DateTime), N'Phong tro Cam Le', N'.\uploads\20160625104031-6986_1591524177.jpg', N'248/6 Cach mang thang 8', N'aadwadawd', N'Approved')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions], [Status]) VALUES (38, 30, N'tuan123@gmail.com', N'0868289502', CAST(N'2024-03-16T01:39:37.210' AS DateTime), N'Phong tro Dai hoc bach khoa', N'.\uploads\z2372635816674-545794dbbc111cba4b6b0b4ed0d7d184_1615391076.jpg', N'373/1/2A Ly Thuong Kiet', N'azxczxczxc', N'Approved')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions], [Status]) VALUES (39, 30, N'tuan123@gmail.com', N'0868289502', CAST(N'2024-03-16T01:41:07.087' AS DateTime), N'Phong tro Hoa Xuan', N'.\uploads\53c44878-7723-4eb9-abee-170c39851296_1587560002.jpg', N'Thanh Luong 27', N'awdawawd', N'Approved')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions], [Status]) VALUES (40, 11, N'bang@gmail.com', N'0947199561', CAST(N'2024-03-16T01:43:02.077' AS DateTime), N'Can Ho Lien Chieu', N'.\uploads\3_1709977325.jpg', N'5 Ngo Thuy Nham', N'11111', N'Approved')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions], [Status]) VALUES (41, 30, N'tuan123@gmail.com', N'0868289502', CAST(N'2024-03-16T01:45:44.193' AS DateTime), N'Phong tro Son Tra', N'.\uploads\431297863-916521293217740-1740029444257801096-n_1709525450.jpg', N'237 Ngo Quyen', N'12312312', N'Approved')
SET IDENTITY_INSERT [dbo].[Listings] OFF
GO
SET IDENTITY_INSERT [dbo].[Ratings] ON 

INSERT [dbo].[Ratings] ([RatingID], [UserID], [ListingID], [Rating]) VALUES (15, 7, 29, 4)
INSERT [dbo].[Ratings] ([RatingID], [UserID], [ListingID], [Rating]) VALUES (19, 7, 41, 5)
SET IDENTITY_INSERT [dbo].[Ratings] OFF
GO
SET IDENTITY_INSERT [dbo].[Report] ON 

INSERT [dbo].[Report] ([ReportID], [UserID], [ListingID], [CreateAt], [Description], [Status]) VALUES (1, 7, 2, CAST(N'2024-03-05' AS Date), N'lua dao', N'Approved')
INSERT [dbo].[Report] ([ReportID], [UserID], [ListingID], [CreateAt], [Description], [Status]) VALUES (2, 7, 30, CAST(N'2024-03-13' AS Date), N'lua dao', N'Approved')
INSERT [dbo].[Report] ([ReportID], [UserID], [ListingID], [CreateAt], [Description], [Status]) VALUES (3, 7, 31, CAST(N'2024-03-16' AS Date), N'lÃ¡o', N'Approved')
INSERT [dbo].[Report] ([ReportID], [UserID], [ListingID], [CreateAt], [Description], [Status]) VALUES (4, 7, 40, CAST(N'2024-03-16' AS Date), N'lua dao', N'Pending')
SET IDENTITY_INSERT [dbo].[Report] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([TransactionID], [UserID], [ContractID], [TransactionDate], [ApartmentID], [Status], [Ammount], [Description]) VALUES (1, 7, 11, CAST(N'2024-02-08T00:00:00.000' AS DateTime), 19, N'success   ', NULL, N'VnpayAdmin')
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [ContractID], [TransactionDate], [ApartmentID], [Status], [Ammount], [Description]) VALUES (3, 7, NULL, CAST(N'2024-03-13T20:38:33.410' AS DateTime), NULL, N'success   ', CAST(1000 AS Decimal(18, 0)), N'withdraw_0947199561')
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [ContractID], [TransactionDate], [ApartmentID], [Status], [Ammount], [Description]) VALUES (4, 7, NULL, CAST(N'2024-03-15T20:13:08.800' AS DateTime), NULL, N'cancel    ', CAST(1000 AS Decimal(18, 0)), N'withdraw_01231231  ')
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [ContractID], [TransactionDate], [ApartmentID], [Status], [Ammount], [Description]) VALUES (5, 7, NULL, CAST(N'2024-03-15T20:38:10.293' AS DateTime), NULL, N'cancel    ', CAST(3000000 AS Decimal(18, 0)), N'withdraw_0947199561')
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [ContractID], [TransactionDate], [ApartmentID], [Status], [Ammount], [Description]) VALUES (6, 7, NULL, CAST(N'2024-03-15T21:56:19.923' AS DateTime), NULL, N'cancel    ', CAST(123 AS Decimal(18, 0)), N'withdraw_01231231  ')
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [ContractID], [TransactionDate], [ApartmentID], [Status], [Ammount], [Description]) VALUES (7, 7, NULL, CAST(N'2024-03-16T01:03:43.453' AS DateTime), NULL, N'cancel    ', CAST(30000 AS Decimal(18, 0)), N'withdraw_0947199561')
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [ContractID], [TransactionDate], [ApartmentID], [Status], [Ammount], [Description]) VALUES (10, 7, 19, CAST(N'2024-03-16T02:11:43.180' AS DateTime), 39, N'success   ', CAST(3900000 AS Decimal(18, 0)), N'VnPayAdmin')
INSERT [dbo].[Transactions] ([TransactionID], [UserID], [ContractID], [TransactionDate], [ApartmentID], [Status], [Ammount], [Description]) VALUES (11, 7, NULL, CAST(N'2024-03-16T02:13:20.780' AS DateTime), NULL, N'success   ', CAST(3900000 AS Decimal(18, 0)), N'withdraw_0947199561')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (5, N'admin', N'123', N'admin@example.com', N'Admin', N'User', N'Admin', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (7, N'Bang', N'nhanoccho', N'dinhbang121@gmail.com', N'Nguyen', N'Bang', N'Tenant', 0, N'0947199561', N'.\uploads\274593792_1010330776246648_8986846460666161700_n.jpg')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (8, N'bangdinh', N'123', N'dinhbang@gmail.com', N'Nguyen', N'Bang', N'Landlord', 0, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (11, N'bang123', N'123', N'bang@gmail.com', N'bang', N'dinh', N'Landlord', 3900000, N'0947199561', N'.\uploads\292494315_1768717610140584_740681695491319873_n.jpg')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (27, N'nhan123', N'123', N'nhan@gmail.com', N'Nhan', N'Tran', N'Tenant', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (28, N'nhat123', N'123', N'nhat123@gmail.com', N'Nhat', N'Mai', N'Landlord', 999999, N'09914777  ', N'.\uploads\guts-a-berserk-character-analysis.jpg')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (29, N'doanquan', N'123', N'doanquan123@gmail.com', N'Quan', N'Doan', N'Landlord', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (30, N'user299.', N'123', N'tuan123@gmail.com', N'Wild.', N'Tuna', N'Landlord', NULL, N'0868289502', N'.\uploads\110468 - Copy.png')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (31, N'nguoithue1', N'123', N'nguoithue1@gmail.com', N'Nguoi', N'Thue', N'Tenant', NULL, N'0947199561', N'.\uploads\110468 - Copy.png')
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (32, N'nguoichothue1', N'123', N'nguoichothue1@gmail.com', N'Nguoi cho', N'Thue', N'Landlord', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (33, N'test', N'123', N'test@gmail.com', N'test', N'test', N'Tenant', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (34, N'bang123', N'123456', N'bang121@gmail.com', N'Bang', N'Nguyen', N'Tenant', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[ChatMessages] ADD  DEFAULT (getdate()) FOR [SentAt]
GO
ALTER TABLE [dbo].[ChatMessages] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[ApartmentInfo]  WITH CHECK ADD FOREIGN KEY([LandlordID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ApartmentInfo]  WITH CHECK ADD FOREIGN KEY([ListingID])
REFERENCES [dbo].[Listings] ([ListingID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([ListingID])
REFERENCES [dbo].[Listings] ([ListingID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD FOREIGN KEY([TenantID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ChatMessages]  WITH CHECK ADD FOREIGN KEY([ReceiverID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[ChatMessages]  WITH CHECK ADD FOREIGN KEY([SenderID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([ListingID])
REFERENCES [dbo].[Listings] ([ListingID])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([TenantID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Listings]  WITH CHECK ADD FOREIGN KEY([LandlordID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Report]  WITH CHECK ADD  CONSTRAINT [FK_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Report] CHECK CONSTRAINT [FK_UserID]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD CHECK  (([Status]='Cancelled' OR [Status]='Approved' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD  CONSTRAINT [CK__Contracts__Statu__59FA5E80] CHECK  (([Status]='Cancelled' OR [Status]='Expired' OR [Status]='Active' OR [Status]='Pendding' OR [Status]='Aproved' OR [Status]='ByCash' OR [Status]='VnPay'))
GO
ALTER TABLE [dbo].[Contracts] CHECK CONSTRAINT [CK__Contracts__Statu__59FA5E80]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK__Users__UserType__4CA06362] CHECK  (([UserType]='Tenant' OR [UserType]='Landlord' OR [UserType]='admin'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK__Users__UserType__4CA06362]
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
