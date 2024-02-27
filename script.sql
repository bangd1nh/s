USE [test]
GO
/****** Object:  Table [dbo].[ApartmentInfo]    Script Date: 2/26/2024 9:31:40 PM ******/
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
/****** Object:  Table [dbo].[Appointments]    Script Date: 2/26/2024 9:31:40 PM ******/
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
/****** Object:  Table [dbo].[ChatMessages]    Script Date: 2/26/2024 9:31:40 PM ******/
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
/****** Object:  Table [dbo].[Comments]    Script Date: 2/26/2024 9:31:40 PM ******/
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
/****** Object:  Table [dbo].[Contracts]    Script Date: 2/26/2024 9:31:40 PM ******/
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
/****** Object:  Table [dbo].[Listings]    Script Date: 2/26/2024 9:31:40 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ratings]    Script Date: 2/26/2024 9:31:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ratings](
	[RatingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[ListingID] [int] NULL,
	[Rating] [int] NOT NULL,
	[Comment] [text] NULL,
	[RatedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[RatingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 2/26/2024 9:31:40 PM ******/
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
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/26/2024 9:31:40 PM ******/
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

INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (1, N'NTapartment', N'Phong 201', N'67 nguyen tao', CAST(2000.00 AS Decimal(10, 2)), 30, 1, 1, 5, 1, N'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/414660000_908720240807647_8394767202203063084_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=c42490&_nc_ohc=V3lYfOnSjgIAX-gwHCi&_nc_ht=scontent.fdad1-4.fna&oh=00_AfA2TG3bShjfYljA1VU7JMMwKKsYaoECwovh_rar69nsmw&oe=65D7F327', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (3, N'bangdinhapp', N'nha tro bang dinh', N'18 tran thanh mai', CAST(2000.00 AS Decimal(10, 2)), 25, 1, 1, 8, 2, N'https://dummyimage.com/450x300/dee2e6/6c757d.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (6, N'NTapartment', N'Phong 202', N'67 Nguyen tao', CAST(1800.00 AS Decimal(10, 2)), 25, 1, 1, 5, 1, N'https://scontent.fdad1-2.fna.fbcdn.net/v/t39.30808-6/421889472_924589752554029_7743176788914196485_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=c42490&_nc_ohc=cLkxe_KxHA4AX8_ktCE&_nc_ht=scontent.fdad1-2.fna&oh=00_AfCYQmjqzii6s6rjoGJ6MCDnIUJjj9TL9NZJ8ga2QoyFYQ&oe=65D7FCD9', N'Rented')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (7, N'Nha tro van minh', N'Phong 301', N'85 Nguyen Huu Cau', CAST(2800.00 AS Decimal(10, 2)), 35, 1, 1, 8, 6, N'https://nhatrovanminh.com/_next/image?url=https%3A%2F%2Ffiles.smartos.space%2F1657600774096-r301-cs6.JPG&w=1920&q=75', N'Rented')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (8, N'Nha tro Son Ky Tan Phu', N'Phong 201', N'24 Son Ky tan Phu', CAST(2900.00 AS Decimal(10, 2)), 20, 1, 1, 8, 5, N'https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2021/10/27/6cf25f240ac441f88af2e4a3f3d0e8ed-2742471462353372835_1635303859.jpg', N'Rented')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (12, N'Happy Home', N'phong 101', N'73 Nguyen Tao', CAST(2000.00 AS Decimal(10, 2)), 25, 1, 1, 28, 19, N'.\uploads\171497070_4093854067301451_2449488300312496659_n.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (14, N'Euro Village', N'29', N'Euro Vilage Tran Hung Dao', CAST(20000.00 AS Decimal(10, 2)), 250, 3, 3, 30, 23, N'.\uploads\ban cong euro village.jpg', N'Rentable')
INSERT [dbo].[ApartmentInfo] ([ApartmentID], [Title], [Description], [Location], [Price], [Area], [Bedrooms], [Bathrooms], [LandlordID], [ListingID], [imgsrc], [Status]) VALUES (15, N'Euro Village', N'8', N'Euro Vilage Tran Hung Dao', CAST(20000.00 AS Decimal(10, 2)), 250, 3, 3, 30, 23, N'.\uploads\1574428599.jpg', N'Rentable')
SET IDENTITY_INSERT [dbo].[ApartmentInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentID], [ListingID], [TenantID], [AppointmentDate], [Status], [ContactPhone], [RoomSelected], [LandlordID]) VALUES (4, 1, 7, CAST(N'2024-02-29T08:30:00.000' AS DateTime), N'Pending', N'0947199561', N'Phong 201', 5)
INSERT [dbo].[Appointments] ([AppointmentID], [ListingID], [TenantID], [AppointmentDate], [Status], [ContactPhone], [RoomSelected], [LandlordID]) VALUES (6, 1, 28, CAST(N'2024-02-25T18:45:00.000' AS DateTime), N'Pending', N'0909914777', N'Phong 201', 5)
INSERT [dbo].[Appointments] ([AppointmentID], [ListingID], [TenantID], [AppointmentDate], [Status], [ContactPhone], [RoomSelected], [LandlordID]) VALUES (7, 23, 7, CAST(N'2024-02-24T07:08:00.000' AS DateTime), N'Approved', N'0947199561', N'29', 30)
INSERT [dbo].[Appointments] ([AppointmentID], [ListingID], [TenantID], [AppointmentDate], [Status], [ContactPhone], [RoomSelected], [LandlordID]) VALUES (8, 23, 28, CAST(N'2024-02-25T00:00:00.000' AS DateTime), N'Cancelled', N'0947191234', N'29', 30)
INSERT [dbo].[Appointments] ([AppointmentID], [ListingID], [TenantID], [AppointmentDate], [Status], [ContactPhone], [RoomSelected], [LandlordID]) VALUES (9, 23, 27, CAST(N'2024-02-28T00:12:00.000' AS DateTime), N'Approved', N'0901231234', N'8', 30)
INSERT [dbo].[Appointments] ([AppointmentID], [ListingID], [TenantID], [AppointmentDate], [Status], [ContactPhone], [RoomSelected], [LandlordID]) VALUES (10, 23, 7, CAST(N'2024-02-26T08:09:00.000' AS DateTime), N'Pending', N'0947199561', N'29', 30)
INSERT [dbo].[Appointments] ([AppointmentID], [ListingID], [TenantID], [AppointmentDate], [Status], [ContactPhone], [RoomSelected], [LandlordID]) VALUES (11, 23, 7, CAST(N'2024-02-26T08:09:00.000' AS DateTime), N'Pending', N'0947199561', N'29', 30)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (1, 7, 6, N'good!', CAST(N'2024-02-18T11:25:23.000' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (2, 8, 6, N'dich vu rat tot', CAST(N'2024-02-03T23:15:33.000' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (3, 8, 1, N'aa', CAST(N'2024-02-26T16:47:51.070' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (4, 7, 6, N'aa', CAST(N'2024-02-18T11:25:23.000' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (5, 8, 1, N'aa', CAST(N'2024-02-26T16:49:14.067' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (6, 8, 1, N'aa', CAST(N'2024-02-26T16:50:37.983' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (7, 8, 1, N'aa', CAST(N'2024-02-26T16:50:51.173' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (8, 8, 1, N'aa', CAST(N'2024-02-26T16:51:17.387' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (9, 30, 6, N'aaaa', CAST(N'2024-02-26T20:18:21.983' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (10, 30, 6, N'aaa', CAST(N'2024-02-26T20:19:59.107' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (11, 30, 6, N'aaa', CAST(N'2024-02-26T20:20:46.690' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (12, 30, 6, N'bbbb', CAST(N'2024-02-26T20:21:22.787' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (13, 30, 23, N'aaa', CAST(N'2024-02-26T20:21:54.507' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (14, 30, 23, N'bbb', CAST(N'2024-02-26T20:22:53.393' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (15, 30, 23, N'cccc', CAST(N'2024-02-26T20:23:18.473' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (16, 30, 23, N'dd', CAST(N'2024-02-26T20:24:38.883' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (17, 28, 23, N'awd', CAST(N'2024-02-26T20:26:06.013' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (18, 30, 23, N'awd', CAST(N'2024-02-26T20:26:52.517' AS DateTime))
INSERT [dbo].[Comments] ([CommentID], [UserID], [ListingID], [Comment], [CommentedAt]) VALUES (19, 28, 5, N'Ä?dawd', CAST(N'2024-02-26T20:28:53.423' AS DateTime))
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Listings] ON 

INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions]) VALUES (1, 5, N'admin@example.com', N'0947199561', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'NTapartment', N'https://scontent.fdad1-4.fna.fbcdn.net/v/t39.30808-6/350999040_946294959828291_6272886725615093697_n.jpg?stp=cp6_dst-jpg&_nc_cat=103&ccb=1-7&_nc_sid=c42490&_nc_ohc=Wr22nNJbxZQAX8lGP-q&_nc_ht=scontent.fdad1-4.fna&oh=00_AfBcXLsvzfx-zl5S7vdWQm1lX9Zn8fQlB0WO10MyYvOq5w&oe=65D6E117', N'67 Nguyen Tao', N'67 Nguyễn Tạo, gần đại học Việt Hàn, FPT, Y Dược, Phan Châu Trinh.
Xung quanh phòng trọ có nhiều tiện nghi có thể đi bộ vài bước chân như. (Công viên ,quán coffee, quán nhậu, tạp hoá, chợ, quán cơm, …)
Tiện nghi trọ bao gồm:
- Điều hoà mới
- Bình nóng lạnh mới
- Hệ thống đèn led tiết kiệm điện 
- Mỗi tầng được trang bị một máy giặt riêng
- Anh em xóm trọ cực vui, cùng nhiều hoạt động vui chơi thể thao.')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions]) VALUES (2, 8, N'bangdinh@gmail.com', N'0947199561', CAST(N'2023-01-01T00:00:00.000' AS DateTime), N'bangdinhapartment', N'https://www.techmadeplain.com/img/2014/300x200.png', N'18 Tran Thanh Mai', N'- PHÒNG TRỌ CAO CẤP TẠI KDC CITYLAND NGÃ 5 CHUỒNG CHÓ P7, GÒ VẤP.

- ĐẦY ĐỦ NỘI THẤT, MÁY LẠNH, TỦ LẠNH, TỦ BÊP, BÊP HỒNG NGOẠI, GIƯỜNG, NỆM....DECOR...

- WC SẠCH SẼ, RỘNG RÃI, RIÊNG BIỆT.

- PHÒNG NGẬP ÁNH SÁNG. 3 CỬA SỔ QUÁ BỰ view máy bay.

-Tiện ích xung quanh đầy đủ, công viên cây xanh, coffee accoustic, coop, Big C, gym, spa...

Hoa hồng cho người giới thiệu!')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions]) VALUES (5, 8, N'bangdinh@gmail.com', N'0947199561', CAST(N'2023-01-02T11:11:11.000' AS DateTime), N'Phong tro son ky tan phu', N'https://pt123.cdn.static123.com/images/thumbs/900x600/fit/2021/10/27/17f127e466893fd370b536e3d9cd0b15-2742471474502885792_1635303858.jpg', N'24 Son ky Tan Phu', N'PHÒNG TRỌ 24 SƠN KỲ TÂN PHÚ, GẦN ĐH CÔNG NGHỆ THỰC PHẨM

- Cách trường Đại Học Công nghệ Thực Phẩm 700m, cách AeOnMall Tân Phú 500m, Gần eTown, PanDoRa Trường Chinh,.... thuận tiện đi lại các quận.

- Phòng có CỬA SỔ, nhiều phòng có BAN CÔNG, đảm bảo ánh sáng ban ngày rất thoáng mát. (Xem hình thật)

- Toilet trong phòng đầy đủ các thiết bị vệ sinh, có kệ BẾP nấu ăn, có GÁC LỮNG các phòng được ốp gạch cao sạch sẽ.

- Trong nhà có Thang máy đi lại, Có Camera an ninh quan sát, có PCCC tự động

- Internet cáp quang mạnh, nhanh. Có cáp Tivi

- Bỏ xe dưới tầng trệt có bảo vệ trong coi. Khóa vân tay giờ giấc tự do.

- Bảo vệ trong coi 24/24 (không chung chủ) giúp Bạn có cảm giác an toàn, được bảo vệ.')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions]) VALUES (6, 8, N'bangdinh@gmail.com', N'0947199561', CAST(N'2023-01-02T11:11:11.000' AS DateTime), N'Nha tro van minh', N'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOEAAADhCAMAAAAJbSJIAAAAvVBMVEX55TUXFxcAABUAAAD/6zYAABb/7zf86Db/7Tb/8DcAABLy3zQNDhbi0TJMShyXjCYTFBfp2DOtoCnFty1LSBHWxTBJRBwkJRjNvi+RhyUtLApjXh+BeSP24zVzbCGGfiS2qCsdHRilmiielCe6rSh5ciJAPhvPwC/dzDFcVxRsZRcxLwtWURMyMRmMgiVUUB1qZCBCPxskJBghIAcXFwVyaxn/+DlBQA84NgwfIAhbVx4vLhkOEAQbGgY/PA6Q2KrzAAAJ0klEQVR4nO2bCXfaOhOGjSRbi+14AQIkbMFsbRogXWib9Pb//6xvJNtgQwhJPwgJZ55zT6+xbFmvNZoZSY5lIQiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCIAiCnAP81A04FpkwLqrstA05FnzCtDJR/0brZ9mLfEppz2UsppTWnFO35hgYabTq6n+pe+rWHAPWNtqqU/PvOZqp+ETT7tNK+2epsJYq/FE/9z6k7tmOwxYo0yp9+J84dWuOAQdldPCdUrBS/wyNFCSJgNLbCf02pPEZ5jRiCnbpgBetf2rV4jOM9/IH7UmQOPn8RfjRGQoEN3pFPzsWr85a7V57eG6jkLMabS3b4ECzkPjzzDwpt37RgbRkQGvyy9WSLW9r56WQu99oX488OaC12pVjOVfnpZBHkKKlipw+peenkEGYn+TRT1Tp73NTyCB/mbLCzwk/L4WiSWlUzF84xIlzUiiG9Lu7FfvOSKGM6VVnO7iDQnmC1hwBCIB/+RPZi/iiw+MZIHv0y9NTCF6jwRlIdH7oRPRpIE1tf3iJ7FkRWv4HnyKyNk2WjrNTBZjwG03z+eYh32zU1okXAXb48/b2Kth5M9uOIkfB9VdNiMw75f6ovArG42A7eMm9qrn/5efPGj154ONNle8CsZmt/QKvq6h8TYdsLW1Ke7BfohBie5rEGcsqY6ujo8KbhETpg1ir8bRCPo3/RaFmM3nhziQJ+i7cK6I4SOry+BpB4d3NEwp54f1CZ2w2ZGkPsnPcWg9lvtUrGwrZ9JuZ4c9EtoNxGx1dIlhpRB6MUy8oFG6cZDM60NdMgmpZo99U7aoxXT6MGK/65qzwB8GwnMKUFerNtTjq1D/Rz/BfvRMN3mDZFBS6U2VcyVphJ1GXd2phojXvk/FsdhMWXzav3nt3F5f6JqGaTaVSsQs1fiCkWuy0skJGqQu9zGWL0gQMlLOIfju2J9J9KPrG26wVzuYdR8aqqdvNgqlkTF4/FlvCl3YszQmhEpJ2sLjwfCmcRBXdUkkhH9JhOnrl719pLsDio2/QaIWWHCnoopVCcqEfL72ZaQ5LQ4iaFluy8jSC2B1zxPvKdLPskV0KYeytivKDDm0dObMxCi0x/soKfWjEiOtF2jjmCOHIUtcUFKpBepW4H6UHHVVYCy0r/Ey3sjiHtt9EIe+Qa7kRLUT3WjeOd2YV22v0yHCHwmyjEw4yC2wU0piywh7tbD4+oruTnsOQKgQvp5Llkwo7pO1KBy7brzA9kI3WDoW8SjeXumEcTt5iHOoGxqoePKGQte6NZTl7FY7b+6wUfOnVhpmKP/8dewcjVwjehowetxWK0bU56e5TyAbKZNKypYoKbv8WNEGPlTfVRLLVqwdnpRBcBbnbVsiHEE2Y6Iy9DU/TXgqdoK8UWuKuETlCDvLxaAD3uZIAp51ftBRXp/T46zVrheBtbkoKFw8mpHdVO1iQ6TwsmhPrqQbp6vRSrXPWubpYeKpfCuGd7zQHgg84lt+FbNCCDOD4iWk0zP0b99NuctMzvJ76AGcSQNLGorI5ieqgmWZt/uqcU4esulN2jZzHs5Se/syLVQvfQrFf67XwY1J4p7x0ZvXT5NObS2Z5al48zd3pdg7GctL3ldBPmURRo/GpJ4+vBQbt3mElZ+lXGHpHMflwa1G8+bC/U0BijYFF/P2AAvVM6wUXyYReudF/NP6AAl+IM6R/VjuK5wmb0j/+W3jR08G3XDOCIMgHgPOy8+KFE+aAv8a58c3qime2yvY05TD4cb/fL6zV8yr8ziZ2rlI+577aXMvfjatrK/1BSOGMGCuinlny31f+ryhCSGHJR8BPki1yOQ17tFyO7MZLlxPgbcDddqGRYqbrS5dnxIVXIc98Hruv/B8RPbsS3qzyQF4llQrJ1tN5VZGLC6JevDLLfbi7Qgr94OoTdnBKhXyqJa0MC+btFe8iFyyG0Cfe8MVpYqowXC/8irZdUHhPnrfS4yi05Nir2O1cBNd613/QwYXvb+0u7SZVWCH5vimPzO9MoRX5vv/MHxocSyGLCbz1vElDUuwCzoTjiOK+WDYhh4LtfbWVwpBkyx8OWERB4fomntcjCvXkCk3lhxRqui0bauKh0KFMTILufL4Ips5qLyFIkj7nYth+mHe3rTdTWLFbovQzVcjjJAnMeOBTqGfCWScezeejiSgpFH5wPV8MDhg4xMiuqGwjoqPVTvNlzgqxlecpm1zkC30ujMvrZdUjNpwnW9P2VJIHdRhjlPC+wnA9Di/BrRor1C6MJMsEfnuerTKjThU6IwVPVeTr4f5whte1rFQUWKx3l/oZMSehp109CSvKziSCa1TdvgorYWXDaa4VenOwg55IKw4bl+G2L9Uem8RduNjUo7J4qcuHDyQ9ac8Pt+Qt77zMu8jL9ViHVpD7uB5NB1pi9jhQGI6hdcQj0FPhzUYjjEJi3hi8EmkUab1PKQzHdgixEyqHlybycqhdQeV6+JLD7QGzAfSclmBcX+4l4IFVySCPEvV1iNThLQxJ0pHRnTbGzQ8XjMJoZlfskeBNkOHpl/akQijzhkzWbTCIUObl4KW6kbQWup4DulUz+qCxLCH5+zRPzNZCTc/2Vwqhk/S+jNG9sTuUKvTT+nQYIvEzCm/MhxcDffHKSiukpfe4Bei2D7hBqsO8HlPGXAuNZo7l+5FYQnHWSK3QTlKbKrjgDYWiBb6rq7vwqxA7FRKzqp1mHG5e7l2m3blQhSD9/8MnYKZjqR8Wfl0NLc4GY+NpFhdeUWH2kY28CXcp5BaMLvsRyod8p0IwYHNLVFKYmSaDXPKQCi3ZCLNXT5LcNLh/A67cSPQqZYWm3HlGoTZ38IjenWPtVpglw2+jULfIbi2hUWQdhRQ8b171/WrwGL5SocWV9vi6eLfCylsqNFGgAUaqrvNaWQBBYST1pFSWx+FLFOrAqg3fejcK9cj27r1CkwXEsSy7Ea9XaAldqp3We1FonBvEW28dKnSISL2ddaOtVLxKIeur9Nub96LQEiZVKoQgMdL+tSOErD/aOngZMS9WaPFmM8rf1LtQyAI9VSXrrXReh8zJI4vuI7EvTSRmr1KYL86/G4UmLHnFZFfMdMroKY+MhZdnGK9QmFdTUDg/pULLmStS/mzEiU0whBRGDyplPmXTs6f8GxQo21zBMStRqqzwLr+3sJZmZk8kU6hvccvlFhvBYffQm2yuu/H1A2OT/rCuZ9ssqk7c/CJ3fb27+alWsXz7svVhZ6OerUs7T1V+BIqLuW/wOARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBEARBPgj/A+NysjZMPQRHAAAAAElFTkSuQmCC', N'85 Nguyen Huu Cau', N'TRỌ VĂN MINH LÀ NƠI BẠN TRỞ VỀ, SAU MỖI GIỜ LÀM VIỆC MỆT MỎI 🏘️ 💬 “Sống ở Hội An, Quảng Nam nhưng ra Đà Nẵng làm việc, lắm lúc chỉ muốn chuyển lên đây sống luôn cho tiện đi lại. Giá xăng thì tăng lên đến 27k, đi đi lại lại vừa cực vừa tốn một khoản chi phí” - chia sẻ từ cư dân nhà Văn Minh. 💛Hiểu được rằng mỗi cư dân đều có cuộc sống riêng, và đa số mọi người đều vì mục đích sinh sống, học tập...')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions]) VALUES (17, 7, N'dinhbang121@gmail.com', N'0947191234', CAST(N'2024-02-21T22:09:08.360' AS DateTime), N'Phong tro FPT', N'.\uploads\428601849_25203006625951356_5122735991227032362_n.jpg', N'584 truong sa ', N'oc cho kiem nhan ngu l ')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions]) VALUES (19, 28, N'nhat123@gmail.com', N'0909914777', CAST(N'2024-02-23T11:30:49.850' AS DateTime), N'Happy Home', N'.\uploads\170717667_4093853677301490_3423072413144648167_n.jpg', N'73 Nguyen Tao', N'
Happy home, 73 Nguyen Tao, Ngu Hanh Son - Da Nang.
ð Phong moi sach se
ð Day du may lanh, nuoc nong, bep tu, gac lung, toilet trong, khong chung chu. Nha xe, san phoi, he thong PCCC, he thong khoa van tay an toan. Wifi free.
ð Nam giua lang Dai hoc, gan cac truong: Dai hoc y duoc, cong nghe thong tin, FPT, cao dang Du lich, Dai hoc Viet Han, ...
ð Han hoan chao don tat ca quy anh chi khach hang den tham quan, luu tru tai day.
ð Co chinh sach ho tro cho cac ban trong mua dich.
ð Gia ca phu hop, tien ich khong doi con chan cho gi ma khong trai nghiem.')
INSERT [dbo].[Listings] ([ListingID], [LandlordID], [ContactEmail], [ContactPhone], [CreatedAt], [Title], [imgsrc], [Location], [Descriptions]) VALUES (23, 30, N'tuan123@gmail.com', N'0868289502', CAST(N'2024-02-23T23:26:35.350' AS DateTime), N'Euro Village', N'.\uploads\noi-that-biet-thu-euro-village-da-nang8.jpg', N'Tran Hung Dao', N'can ho dang cap nhat cai dat da nang.')
SET IDENTITY_INSERT [dbo].[Listings] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (5, N'admin', N'123', N'admin@example.com', N'Admin', N'User', N'Landlord', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (7, N'Bang', N'123', N'dinhbang121@gmail.com', N'Nguyen', N'Bang', N'Tenant', 10000, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (8, N'bangdinh', N'123', N'dinhbang@gmail.com', N'Nguyen', N'Bang', N'Landlord', 10000, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (11, N'bang123', N'123', N'bang@gmail.com', N'bang', N'dinh', N'Landlord', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (27, N'nhan123', N'123', N'nhan@gmail.com', N'Nhan', N'Tran', N'Tenant', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (28, N'nhat123', N'123', N'nhat123@gmail.com', N'Nhat', N'Mai', N'Landlord', 999999, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (29, N'doanquan', N'123', N'doanquan123@gmail.com', N'Quan', N'Doan', N'Landlord', NULL, NULL, NULL)
INSERT [dbo].[Users] ([UserID], [Username], [Password], [Email], [FirstName], [LastName], [UserType], [Balance], [ContactPhone], [imgsrc]) VALUES (30, N'user299.', N'123', N'tuan123@gmail.com', N'Wild.', N'Tuna', N'Landlord', NULL, N'0868289502', N'.\uploads\110468 - Copy.png')
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
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([PropertyID])
REFERENCES [dbo].[ApartmentInfo] ([ApartmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD FOREIGN KEY([TenantID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Listings]  WITH CHECK ADD FOREIGN KEY([LandlordID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD FOREIGN KEY([ListingID])
REFERENCES [dbo].[Listings] ([ListingID])
GO
ALTER TABLE [dbo].[Ratings]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([ContractID])
REFERENCES [dbo].[Contracts] ([ContractID])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD CHECK  (([Status]='Cancelled' OR [Status]='Approved' OR [Status]='Pending'))
GO
ALTER TABLE [dbo].[Contracts]  WITH CHECK ADD CHECK  (([Status]='Cancelled' OR [Status]='Expired' OR [Status]='Active'))
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [CK__Users__UserType__4CA06362] CHECK  (([UserType]='Tenant' OR [UserType]='Landlord' OR [UserType]='admin'))
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [CK__Users__UserType__4CA06362]
GO
