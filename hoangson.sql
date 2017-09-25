USE [master]
GO
/****** Object:  Database [noi100760_data]    Script Date: 21/09/2017 8:35:43 SA ******/
CREATE DATABASE [noi100760_data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'noi100760_data', FILENAME = N'C:\Program Files (x86)\Parallels\Plesk\Databases\MSSQL\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\noi100760_data.mdf' , SIZE = 3136KB , MAXSIZE = 1048576KB , FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'noi100760_data_log', FILENAME = N'C:\Program Files (x86)\Parallels\Plesk\Databases\MSSQL\MSSQL11.MSSQLSERVER2012\MSSQL\DATA\noi100760_data_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [noi100760_data] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [noi100760_data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [noi100760_data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [noi100760_data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [noi100760_data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [noi100760_data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [noi100760_data] SET ARITHABORT OFF 
GO
ALTER DATABASE [noi100760_data] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [noi100760_data] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [noi100760_data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [noi100760_data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [noi100760_data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [noi100760_data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [noi100760_data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [noi100760_data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [noi100760_data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [noi100760_data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [noi100760_data] SET  ENABLE_BROKER 
GO
ALTER DATABASE [noi100760_data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [noi100760_data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [noi100760_data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [noi100760_data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [noi100760_data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [noi100760_data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [noi100760_data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [noi100760_data] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [noi100760_data] SET  MULTI_USER 
GO
ALTER DATABASE [noi100760_data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [noi100760_data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [noi100760_data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [noi100760_data] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [noi100760_data]
GO
/****** Object:  User [noi100760_user]    Script Date: 21/09/2017 8:35:45 SA ******/
CREATE USER [noi100760_user] FOR LOGIN [noi100760_user] WITH DEFAULT_SCHEMA=[noi100760_user]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [noi100760_user]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [noi100760_user]
GO
ALTER ROLE [db_datareader] ADD MEMBER [noi100760_user]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [noi100760_user]
GO
/****** Object:  Schema [noi100760_user]    Script Date: 21/09/2017 8:35:45 SA ******/
CREATE SCHEMA [noi100760_user]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 21/09/2017 8:35:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[ACCT_ID] [int] IDENTITY(1,1) NOT NULL,
	[ACCT_NAME] [nvarchar](30) NOT NULL,
	[ACCT_PASS] [nvarchar](50) NOT NULL,
	[NSTATUS] [int] NOT NULL DEFAULT ((0)),
	[ACCT_GROUP] [int] NULL,
	[ACCT_CREATE] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ACCT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAccountInfo]    Script Date: 21/09/2017 8:35:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblAccountInfo](
	[ACCT_ID] [int] NOT NULL,
	[FULLNAME] [nvarchar](50) NOT NULL,
	[AGE] [datetime] NULL,
	[SEX] [bit] NULL,
	[EMAIL] [nvarchar](50) NULL,
	[PHONE] [varchar](20) NULL,
	[ACCT_CREATE] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ACCT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblAcctGroup]    Script Date: 21/09/2017 8:35:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAcctGroup](
	[ID] [int] IDENTITY(0,1) NOT NULL,
	[NAME] [nvarchar](256) NOT NULL,
	[DESCRIBE] [nvarchar](50) NULL,
	[NSTATUS] [int] NOT NULL DEFAULT ((0)),
	[EDITTIME] [datetime] NULL,
	[EDITUSER] [int] NULL,
	[CREATETIME] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAnswer]    Script Date: 21/09/2017 8:35:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnswer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[Content] [ntext] NULL,
	[IORDER] [int] NULL,
	[CREATETIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAnswerResult]    Script Date: 21/09/2017 8:35:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAnswerResult](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[AnswerID] [int] NULL,
	[USERID] [int] NULL,
	[CREATETIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCategory]    Script Date: 21/09/2017 8:35:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCategory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](256) NULL,
	[IMG] [nvarchar](512) NULL,
	[DESCRIBE] [ntext] NULL,
	[LINK] [nvarchar](256) NULL,
	[NSTATUS] [int] NOT NULL DEFAULT ((0)),
	[CREATEDATE] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblChatMessage]    Script Date: 21/09/2017 8:35:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChatMessage](
	[ID] [nvarchar](50) NOT NULL,
	[RoomID] [nvarchar](50) NOT NULL,
	[UserID] [int] NULL,
	[MessageText] [nvarchar](500) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblChatRoom]    Script Date: 21/09/2017 8:35:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblChatRoom](
	[RoomID] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](20) NULL,
	[EditDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblChatUser]    Script Date: 21/09/2017 8:35:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tblChatUser](
	[ID] [nvarchar](50) NOT NULL,
	[RoomID] [nvarchar](50) NOT NULL,
	[UserID] [int] NULL,
	[IPChat] [varchar](20) NOT NULL,
	[PortChat] [int] NOT NULL,
	[OnlineDate] [datetime] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tblContact]    Script Date: 21/09/2017 8:35:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblContact](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Question] [nvarchar](500) NULL,
	[Answer] [ntext] NULL,
	[NSTATUS] [int] NOT NULL,
	[DayPost] [datetime] NULL,
	[DayAnswer] [datetime] NULL,
	[UserAnswer] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblDanhMuc]    Script Date: 21/09/2017 8:35:45 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDanhMuc](
	[IdDanhMuc] [int] IDENTITY(1,1) NOT NULL,
	[DanhMucId] [int] NOT NULL,
	[NameDanhMuc] [nvarchar](256) NULL,
	[Note] [ntext] NULL,
	[State] [bit] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblMenu]    Script Date: 21/09/2017 8:35:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMenu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NOT NULL DEFAULT ((1)),
	[NAME] [nvarchar](256) NOT NULL,
	[DESCRIBE] [ntext] NULL,
	[NTYPE] [int] NULL,
	[LINK] [nvarchar](512) NULL,
	[IORDER] [int] NULL,
	[PID] [int] NULL,
	[CREATEDATE] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNews]    Script Date: 21/09/2017 8:35:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNews](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatId] [int] NULL,
	[Title] [nvarchar](500) NULL,
	[ShortContent] [nvarchar](1500) NULL,
	[Content] [ntext] NULL,
	[ImgUrl] [nvarchar](250) NULL,
	[NoiBat] [bit] NOT NULL DEFAULT ((0)),
	[tag] [nvarchar](512) NULL,
	[NSTATUS] [int] NOT NULL DEFAULT ((0)),
	[DayPost] [datetime] NULL DEFAULT (getdate()),
	[DayEdit] [datetime] NULL,
	[UserPost] [int] NULL,
	[UserEdit] [int] NULL,
	[Author] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblNewsGroup]    Script Date: 21/09/2017 8:35:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblNewsGroup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](256) NOT NULL,
	[DESCRIBE] [nvarchar](50) NULL,
	[NSTATUS] [int] NOT NULL DEFAULT ((0)),
	[EDITTIME] [datetime] NULL,
	[EDITUSER] [int] NULL,
	[CREATETIME] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 21/09/2017 8:35:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[GROUPID] [int] NULL,
	[NAME] [nvarchar](500) NULL,
	[PRICE] [float] NULL,
	[DESCRIBE] [nvarchar](1500) NULL,
	[CONTENT] [ntext] NULL,
	[IMG] [nvarchar](512) NULL,
	[NoiBat] [bit] NOT NULL DEFAULT ((0)),
	[NSTATUS] [int] NOT NULL DEFAULT ((0)),
	[DayPost] [datetime] NULL DEFAULT (getdate()),
	[DayEdit] [datetime] NULL,
	[UserPost] [int] NULL,
	[UserEdit] [int] NULL,
	[Author] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblProtect]    Script Date: 21/09/2017 8:35:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProtect](
	[MA] [nvarchar](50) NOT NULL,
	[NAME] [nvarchar](500) NOT NULL,
	[IMG] [nvarchar](512) NULL,
	[ADDRESS] [nvarchar](500) NOT NULL,
	[DESCRIBE] [ntext] NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 21/09/2017 8:35:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](512) NOT NULL,
	[DESCRIBE] [ntext] NULL,
	[NSTATUS] [int] NOT NULL,
	[IORDER] [int] NULL,
	[EDITUSER] [int] NULL,
	[EDITTIME] [datetime] NULL,
	[CREATEUSER] [int] NULL,
	[CREATETIME] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRemember]    Script Date: 21/09/2017 8:35:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRemember](
	[RMKEY] [nvarchar](50) NOT NULL DEFAULT (newid()),
	[USERID] [int] NOT NULL,
	[PASS] [nvarchar](50) NOT NULL,
	[LGROUP] [int] NOT NULL DEFAULT ((0)),
	[REMEMBER] [bit] NOT NULL DEFAULT ((0)),
	[LOGINDATE] [datetime] NULL DEFAULT (getdate()),
	[ONLINEDATE] [datetime] NULL DEFAULT (getdate()),
	[CREATEDATE] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[RMKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSetting]    Script Date: 21/09/2017 8:35:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSetting](
	[STKEY] [nvarchar](30) NOT NULL,
	[VALUE] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[STKEY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSlider]    Script Date: 21/09/2017 8:35:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSlider](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TITLE] [nvarchar](256) NOT NULL,
	[DESCRIBE] [ntext] NULL,
	[NTYPE] [int] NOT NULL DEFAULT ((1)),
	[LINK] [nvarchar](512) NULL,
	[IMG] [nvarchar](512) NULL,
	[IORDER] [int] NULL,
	[CREATEDATE] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 21/09/2017 8:35:46 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[ID] [int] IDENTITY(0,1) NOT NULL,
	[NAME] [nvarchar](256) NULL,
	[DESCRIBE] [ntext] NULL,
	[CREATEDATE] [datetime] NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[tblAccount] ON 

INSERT [dbo].[tblAccount] ([ACCT_ID], [ACCT_NAME], [ACCT_PASS], [NSTATUS], [ACCT_GROUP], [ACCT_CREATE]) VALUES (1, N'kaisermtv', N'123123', 0, 1, CAST(N'2017-09-11 14:59:20.740' AS DateTime))
INSERT [dbo].[tblAccount] ([ACCT_ID], [ACCT_NAME], [ACCT_PASS], [NSTATUS], [ACCT_GROUP], [ACCT_CREATE]) VALUES (2, N'admin', N'123', 0, 1, CAST(N'2017-09-11 14:59:20.740' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblAccount] OFF
SET IDENTITY_INSERT [dbo].[tblAcctGroup] ON 

INSERT [dbo].[tblAcctGroup] ([ID], [NAME], [DESCRIBE], [NSTATUS], [EDITTIME], [EDITUSER], [CREATETIME]) VALUES (0, N'Register', N'Mới đăng ký, chờ duyệt', 0, NULL, NULL, CAST(N'2017-09-11 14:59:20.683' AS DateTime))
INSERT [dbo].[tblAcctGroup] ([ID], [NAME], [DESCRIBE], [NSTATUS], [EDITTIME], [EDITUSER], [CREATETIME]) VALUES (1, N'Admin', N'Quản trị viên', 0, NULL, NULL, CAST(N'2017-09-11 14:59:20.683' AS DateTime))
INSERT [dbo].[tblAcctGroup] ([ID], [NAME], [DESCRIBE], [NSTATUS], [EDITTIME], [EDITUSER], [CREATETIME]) VALUES (2, N'User', N'Thành viên', 0, NULL, NULL, CAST(N'2017-09-11 14:59:20.683' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblAcctGroup] OFF
SET IDENTITY_INSERT [dbo].[tblCategory] ON 

INSERT [dbo].[tblCategory] ([ID], [NAME], [IMG], [DESCRIBE], [LINK], [NSTATUS], [CREATEDATE]) VALUES (1, N'Sàn gỗ', N'/Images/POST/1-16-09-2017--10-20-25-9590399-San go.png', N'Ván sàn Châu Âu - Chất lượng Cao và phù hợp nhất trên thị trường hiện nay. Giao hàng nhanh 24h · Đổi trả miễn phí', NULL, 1, CAST(N'2017-09-16 10:20:20.640' AS DateTime))
INSERT [dbo].[tblCategory] ([ID], [NAME], [IMG], [DESCRIBE], [LINK], [NSTATUS], [CREATEDATE]) VALUES (2, N'Sàn nhựa', N'/Images/POST/1-16-09-2017--10-21-02-0330019-san nhua.png', N'Sàn nhựa tại thành phố Vinh - Nhà phân phối sàn nhựa lớn nhất tại Việt Nam, Cung cấp mua bán sàn nhựa vân gỗ, sàn nhựa hèm khóa, sàn nhựa pvc', NULL, 1, CAST(N'2017-09-16 10:20:56.730' AS DateTime))
INSERT [dbo].[tblCategory] ([ID], [NAME], [IMG], [DESCRIBE], [LINK], [NSTATUS], [CREATEDATE]) VALUES (3, N'Cổng nhôm đúc', N'/Images/POST/1-16-09-2017--10-21-29-2788110-Cong nhom duc.png', N'Chuyên tư vấn, thiết kế, thi công các sản phẩm Nhôm Đúc trang trí nội ngoại thất. Công Nghệ Hiện Đại · Tư Vấn Miễn Phí · Bảo Hành Trọn Đời', NULL, 1, CAST(N'2017-09-16 10:21:23.960' AS DateTime))
INSERT [dbo].[tblCategory] ([ID], [NAME], [IMG], [DESCRIBE], [LINK], [NSTATUS], [CREATEDATE]) VALUES (4, N'Đèn trang trí', N'/Images/POST/1-16-09-2017--10-21-59-9957262-den.png', N'Đèn trang trí - Chất lượng Cao và phù hợp nhất trên thị trường hiện nay. Giao hàng nhanh 24h · Đổi trả miễn phí', NULL, 1, CAST(N'2017-09-16 10:21:54.677' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblCategory] OFF
SET IDENTITY_INSERT [dbo].[tblMenu] ON 

INSERT [dbo].[tblMenu] ([ID], [MenuID], [NAME], [DESCRIBE], [NTYPE], [LINK], [IORDER], [PID], [CREATEDATE]) VALUES (1, 1, N'Trang chủ', N'', 0, N'/', 1, NULL, CAST(N'2017-09-13 10:10:32.833' AS DateTime))
INSERT [dbo].[tblMenu] ([ID], [MenuID], [NAME], [DESCRIBE], [NTYPE], [LINK], [IORDER], [PID], [CREATEDATE]) VALUES (2, 1, N'Giới thiệu', N'', 0, N'/Gioi-Thieu', 2, NULL, CAST(N'2017-09-13 10:10:52.123' AS DateTime))
INSERT [dbo].[tblMenu] ([ID], [MenuID], [NAME], [DESCRIBE], [NTYPE], [LINK], [IORDER], [PID], [CREATEDATE]) VALUES (3, 1, N'Sàn gỗ', N'', 0, N'/San-Go-gp1', 3, NULL, CAST(N'2017-09-13 10:11:12.313' AS DateTime))
INSERT [dbo].[tblMenu] ([ID], [MenuID], [NAME], [DESCRIBE], [NTYPE], [LINK], [IORDER], [PID], [CREATEDATE]) VALUES (4, 1, N'Sàn nhựa', N'', 0, N'/San-Nhua-gp2', 4, NULL, CAST(N'2017-09-13 10:11:48.823' AS DateTime))
INSERT [dbo].[tblMenu] ([ID], [MenuID], [NAME], [DESCRIBE], [NTYPE], [LINK], [IORDER], [PID], [CREATEDATE]) VALUES (5, 1, N'Cổng nhôm đúc', N'', 0, N'/Cong-Nhom-Duc-gp3', 5, NULL, CAST(N'2017-09-13 10:12:14.133' AS DateTime))
INSERT [dbo].[tblMenu] ([ID], [MenuID], [NAME], [DESCRIBE], [NTYPE], [LINK], [IORDER], [PID], [CREATEDATE]) VALUES (6, 1, N'Đèn trang trí', N'', 0, N'/Den-Trang-Tri-gp4', 6, NULL, CAST(N'2017-09-13 10:12:39.160' AS DateTime))
INSERT [dbo].[tblMenu] ([ID], [MenuID], [NAME], [DESCRIBE], [NTYPE], [LINK], [IORDER], [PID], [CREATEDATE]) VALUES (7, 1, N'Tin tức', N'', 0, N'/Tin-Tuc', 7, NULL, CAST(N'2017-09-13 10:13:10.203' AS DateTime))
INSERT [dbo].[tblMenu] ([ID], [MenuID], [NAME], [DESCRIBE], [NTYPE], [LINK], [IORDER], [PID], [CREATEDATE]) VALUES (8, 1, N'Khuyến mãi', N'', 0, N'/Khuyen-Mai-cat2', 8, NULL, CAST(N'2017-09-13 10:13:29.083' AS DateTime))
INSERT [dbo].[tblMenu] ([ID], [MenuID], [NAME], [DESCRIBE], [NTYPE], [LINK], [IORDER], [PID], [CREATEDATE]) VALUES (9, 1, N'Tuyển dụng', N'', 0, N'/Tuyen-Dung-cat3', 9, NULL, CAST(N'2017-09-13 10:13:51.927' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblMenu] OFF
SET IDENTITY_INSERT [dbo].[tblNews] ON 

INSERT [dbo].[tblNews] ([Id], [CatId], [Title], [ShortContent], [Content], [ImgUrl], [NoiBat], [tag], [NSTATUS], [DayPost], [DayEdit], [UserPost], [UserEdit], [Author]) VALUES (1, 1, N'Những lỗi cơ bản của các căn hộ chung cư khi bàn giao', N'Năm 2014 là năm nhiều căn hộ chung cư được bàn giao trong đó có những chung cư từ cao cấp cho đến trung bình. Ngoài các căn hộ được bàn giao đúng chất lượng mặt bằng thì vẫn có các căn hộ chất lượng vẫn chưa được đúng so với cam kết của chủ đầu tư.', N'<p>Đang cập nhật...</p>', N'/Images/News/1-14-09-2017--09-45-59-6585673-tin tuc 1.png', 0, N'', 0, CAST(N'2017-09-14 09:16:28.147' AS DateTime), CAST(N'2017-09-14 09:48:35.860' AS DateTime), 1, 1, N'')
INSERT [dbo].[tblNews] ([Id], [CatId], [Title], [ShortContent], [Content], [ImgUrl], [NoiBat], [tag], [NSTATUS], [DayPost], [DayEdit], [UserPost], [UserEdit], [Author]) VALUES (2, 1, N'TỦ BẾP SỐ 1 HÀ NỘI - ĐAM MÊ SÁNG TẠO - KHÁT KHAO LÀM ĐẸP', N'Khoảng 10 năm trước đây, chỉ những gia đình khá giả mới nghĩ đến chuyện lắp một hệ thống tủ bếp hoàn thiện.', N'<p>Đang cập nhật...</p>', N'/Images/News/1-14-09-2017--09-45-51-7381584-tin tuc 2.png', 0, N'', 0, CAST(N'2017-09-14 09:20:34.523' AS DateTime), CAST(N'2017-09-14 09:48:27.923' AS DateTime), 1, 1, N'')
INSERT [dbo].[tblNews] ([Id], [CatId], [Title], [ShortContent], [Content], [ImgUrl], [NoiBat], [tag], [NSTATUS], [DayPost], [DayEdit], [UserPost], [UserEdit], [Author]) VALUES (3, 1, N'Quy luật cơ bản trong thiết kế nội thất và kiến trúc nguyên lý thiết kế', N'Các quy luật cơ bản trong thiết kế nội thất và thiết kế kiến trúc nhà ở đó là luật về sự cân bằng, nhịp điệu, nhấn mạnh, hài hòa, tương xứng và tỉ lệ', N'<p>Đang cập nhật ...</p>', N'/Images/News/1-14-09-2017--09-45-35-5597035-tin tuc 3.png', 0, N'', 0, CAST(N'2017-09-14 09:21:25.793' AS DateTime), CAST(N'2017-09-14 09:48:11.770' AS DateTime), 1, 1, N'')
SET IDENTITY_INSERT [dbo].[tblNews] OFF
SET IDENTITY_INSERT [dbo].[tblNewsGroup] ON 

INSERT [dbo].[tblNewsGroup] ([ID], [NAME], [DESCRIBE], [NSTATUS], [EDITTIME], [EDITUSER], [CREATETIME]) VALUES (1, N'Tin tức - Sự kiện', N'', 1, CAST(N'2017-09-14 08:49:01.190' AS DateTime), 1, CAST(N'2017-09-14 08:43:51.270' AS DateTime))
INSERT [dbo].[tblNewsGroup] ([ID], [NAME], [DESCRIBE], [NSTATUS], [EDITTIME], [EDITUSER], [CREATETIME]) VALUES (2, N'Khuyễn mãi', N'', 1, CAST(N'2017-09-14 08:48:51.610' AS DateTime), 1, CAST(N'2017-09-14 08:44:08.340' AS DateTime))
INSERT [dbo].[tblNewsGroup] ([ID], [NAME], [DESCRIBE], [NSTATUS], [EDITTIME], [EDITUSER], [CREATETIME]) VALUES (3, N'Tuyển dụng', N'', 1, CAST(N'2017-09-16 10:59:45.310' AS DateTime), 1, CAST(N'2017-09-16 10:59:45.310' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblNewsGroup] OFF
SET IDENTITY_INSERT [dbo].[tblProduct] ON 

INSERT [dbo].[tblProduct] ([ID], [GROUPID], [NAME], [PRICE], [DESCRIBE], [CONTENT], [IMG], [NoiBat], [NSTATUS], [DayPost], [DayEdit], [UserPost], [UserEdit], [Author]) VALUES (1, 3, N'Cổng nhôm đúc 001', 50000000, N'Thông tin mô tả sản phẩm, ngắn gọn', N'', N'/Images/POST/1-19-09-2017--10-42-38-7729626-san pham 1.png', 0, 0, CAST(N'2017-09-19 10:43:40.057' AS DateTime), NULL, 1, NULL, N'')
INSERT [dbo].[tblProduct] ([ID], [GROUPID], [NAME], [PRICE], [DESCRIBE], [CONTENT], [IMG], [NoiBat], [NSTATUS], [DayPost], [DayEdit], [UserPost], [UserEdit], [Author]) VALUES (2, 1, N'Cổng nhôm đúc 002', 55000000, N'Thông tin mô tả sản phẩm, ngắn gọn', N'', N'/Images/POST/1-19-09-2017--03-06-38-7308621-san pham 1.png', 0, 0, CAST(N'2017-09-19 15:06:43.463' AS DateTime), NULL, 1, NULL, N'')
INSERT [dbo].[tblProduct] ([ID], [GROUPID], [NAME], [PRICE], [DESCRIBE], [CONTENT], [IMG], [NoiBat], [NSTATUS], [DayPost], [DayEdit], [UserPost], [UserEdit], [Author]) VALUES (3, 3, N'Cổng nhôm đúc 003', 40000000, N'Thông tin mô tả sản phẩm, ngắn gọn', N'', N'/Images/POST/1-20-09-2017--09-29-00-9524074-san pham 1.png', 0, 0, CAST(N'2017-09-20 09:29:26.197' AS DateTime), CAST(N'2017-09-20 09:30:45.687' AS DateTime), 1, 1, N'')
INSERT [dbo].[tblProduct] ([ID], [GROUPID], [NAME], [PRICE], [DESCRIBE], [CONTENT], [IMG], [NoiBat], [NSTATUS], [DayPost], [DayEdit], [UserPost], [UserEdit], [Author]) VALUES (4, 3, N'Cổng nhôm đúc 004', 30000000, N'Thông tin mô tả sản phẩm, ngắn gọn', N'', N'/Images/POST/1-20-09-2017--09-29-44-0852609-san pham 1.png', 0, 0, CAST(N'2017-09-20 09:30:09.340' AS DateTime), CAST(N'2017-09-20 09:31:30.197' AS DateTime), 1, 1, N'')
INSERT [dbo].[tblProduct] ([ID], [GROUPID], [NAME], [PRICE], [DESCRIBE], [CONTENT], [IMG], [NoiBat], [NSTATUS], [DayPost], [DayEdit], [UserPost], [UserEdit], [Author]) VALUES (5, 4, N'Đèn trang trí 001', 10000000, N'', N'', N'/Images/POST/1-20-09-2017--09-38-50-2039560-san pham 6.png', 0, 0, CAST(N'2017-09-20 09:39:15.640' AS DateTime), NULL, 1, NULL, N'')
INSERT [dbo].[tblProduct] ([ID], [GROUPID], [NAME], [PRICE], [DESCRIBE], [CONTENT], [IMG], [NoiBat], [NSTATUS], [DayPost], [DayEdit], [UserPost], [UserEdit], [Author]) VALUES (6, 4, N'Đèn trang trí 002', 20000000, N'', N'', N'/Images/POST/1-20-09-2017--09-39-23-7610870-san pham 6.png', 0, 0, CAST(N'2017-09-20 09:39:49.200' AS DateTime), NULL, 1, NULL, N'')
INSERT [dbo].[tblProduct] ([ID], [GROUPID], [NAME], [PRICE], [DESCRIBE], [CONTENT], [IMG], [NoiBat], [NSTATUS], [DayPost], [DayEdit], [UserPost], [UserEdit], [Author]) VALUES (7, 4, N'Đèn trang trí 003', 15000000, N'', N'', N'/Images/POST/1-20-09-2017--09-40-09-0681821-san pham 6.png', 0, 0, CAST(N'2017-09-20 09:40:34.530' AS DateTime), NULL, 1, NULL, N'')
INSERT [dbo].[tblProduct] ([ID], [GROUPID], [NAME], [PRICE], [DESCRIBE], [CONTENT], [IMG], [NoiBat], [NSTATUS], [DayPost], [DayEdit], [UserPost], [UserEdit], [Author]) VALUES (8, 4, N'Đèn trang trí 004', 30000000, N'', N'', N'/Images/POST/1-20-09-2017--09-40-37-5528714-san pham 6.png', 0, 0, CAST(N'2017-09-20 09:41:03.033' AS DateTime), NULL, 1, NULL, N'')
SET IDENTITY_INSERT [dbo].[tblProduct] OFF
INSERT [dbo].[tblRemember] ([RMKEY], [USERID], [PASS], [LGROUP], [REMEMBER], [LOGINDATE], [ONLINEDATE], [CREATEDATE]) VALUES (N'3EA54F32-AA84-4A6B-827C-CB64A3637605', 1, N'123123', 1, 1, CAST(N'2017-09-13 10:04:52.410' AS DateTime), CAST(N'2017-09-19 15:09:11.563' AS DateTime), CAST(N'2017-09-13 10:04:52.410' AS DateTime))
INSERT [dbo].[tblRemember] ([RMKEY], [USERID], [PASS], [LGROUP], [REMEMBER], [LOGINDATE], [ONLINEDATE], [CREATEDATE]) VALUES (N'6A9312DF-35FD-4AF1-91A2-1D8F87E23064', 1, N'123123', 1, 1, CAST(N'2017-09-18 08:42:59.030' AS DateTime), CAST(N'2017-09-20 09:26:52.380' AS DateTime), CAST(N'2017-09-18 08:42:59.030' AS DateTime))
INSERT [dbo].[tblRemember] ([RMKEY], [USERID], [PASS], [LGROUP], [REMEMBER], [LOGINDATE], [ONLINEDATE], [CREATEDATE]) VALUES (N'E9B9AB21-22A2-4110-8227-2D8B17B82419', 1, N'123123', 1, 1, CAST(N'2017-09-20 09:27:22.763' AS DateTime), CAST(N'2017-09-20 16:19:24.230' AS DateTime), CAST(N'2017-09-20 09:27:22.763' AS DateTime))
INSERT [dbo].[tblSetting] ([STKEY], [VALUE]) VALUES (N'Address', N'')
INSERT [dbo].[tblSetting] ([STKEY], [VALUE]) VALUES (N'Domain', N'')
INSERT [dbo].[tblSetting] ([STKEY], [VALUE]) VALUES (N'Email', N'')
INSERT [dbo].[tblSetting] ([STKEY], [VALUE]) VALUES (N'Greeting', N'')
INSERT [dbo].[tblSetting] ([STKEY], [VALUE]) VALUES (N'Greeting1', N'')
INSERT [dbo].[tblSetting] ([STKEY], [VALUE]) VALUES (N'Hotline', N'02386 288 555')
INSERT [dbo].[tblSetting] ([STKEY], [VALUE]) VALUES (N'Name', N'Công ty cổ phần phát triển Hoàng Sơn')
INSERT [dbo].[tblSetting] ([STKEY], [VALUE]) VALUES (N'Phone', N'')
SET IDENTITY_INSERT [dbo].[tblSlider] ON 

INSERT [dbo].[tblSlider] ([ID], [TITLE], [DESCRIBE], [NTYPE], [LINK], [IMG], [IORDER], [CREATEDATE]) VALUES (1, N'', N'', 1, N'', N'/Images/Slider/1-14-09-2017--09-53-16-8980659-Slide1.png', NULL, CAST(N'2017-09-12 14:49:28.150' AS DateTime))
INSERT [dbo].[tblSlider] ([ID], [TITLE], [DESCRIBE], [NTYPE], [LINK], [IMG], [IORDER], [CREATEDATE]) VALUES (2, N'', N'', 1, N'', N'/Images/Slider/1-14-09-2017--09-53-23-8959041-Slide2.png', NULL, CAST(N'2017-09-12 14:49:35.800' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblSlider] OFF
SET IDENTITY_INSERT [dbo].[tblStatus] ON 

INSERT [dbo].[tblStatus] ([ID], [NAME], [DESCRIBE], [CREATEDATE]) VALUES (0, N'-/-', N'Chờ xử lý', CAST(N'2017-09-11 14:59:20.493' AS DateTime))
INSERT [dbo].[tblStatus] ([ID], [NAME], [DESCRIBE], [CREATEDATE]) VALUES (1, N'Kích hoạt', N'Được chia sẻ', CAST(N'2017-09-11 14:59:20.563' AS DateTime))
INSERT [dbo].[tblStatus] ([ID], [NAME], [DESCRIBE], [CREATEDATE]) VALUES (2, N'Lưu trữ', N'Đã xóa, nhưng chưa chả khỏi sql', CAST(N'2017-09-11 14:59:20.563' AS DateTime))
INSERT [dbo].[tblStatus] ([ID], [NAME], [DESCRIBE], [CREATEDATE]) VALUES (3, N'Ẩn danh mục', N'Sẽ không hiển thị trong danh mục', CAST(N'2017-09-11 14:59:20.563' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblStatus] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tblAccou__760D6D8E9FE20ACC]    Script Date: 21/09/2017 8:35:49 SA ******/
ALTER TABLE [dbo].[tblAccount] ADD UNIQUE NONCLUSTERED 
(
	[ACCT_NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tblAcctG__D9C1FA00B11D7A2B]    Script Date: 21/09/2017 8:35:49 SA ******/
ALTER TABLE [dbo].[tblAcctGroup] ADD UNIQUE NONCLUSTERED 
(
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__tblNewsG__D9C1FA006BCD47EF]    Script Date: 21/09/2017 8:35:49 SA ******/
ALTER TABLE [dbo].[tblNewsGroup] ADD UNIQUE NONCLUSTERED 
(
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblAccountInfo] ADD  DEFAULT (getdate()) FOR [ACCT_CREATE]
GO
ALTER TABLE [dbo].[tblAnswer] ADD  DEFAULT (getdate()) FOR [CREATETIME]
GO
ALTER TABLE [dbo].[tblAnswerResult] ADD  DEFAULT (getdate()) FOR [CREATETIME]
GO
ALTER TABLE [dbo].[tblChatMessage] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[tblChatMessage] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblChatRoom] ADD  DEFAULT (newid()) FOR [RoomID]
GO
ALTER TABLE [dbo].[tblChatRoom] ADD  DEFAULT (getdate()) FOR [EditDate]
GO
ALTER TABLE [dbo].[tblChatRoom] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblChatUser] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[tblChatUser] ADD  DEFAULT (getdate()) FOR [OnlineDate]
GO
ALTER TABLE [dbo].[tblChatUser] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblContact] ADD  DEFAULT ((0)) FOR [NSTATUS]
GO
ALTER TABLE [dbo].[tblContact] ADD  DEFAULT (getdate()) FOR [DayPost]
GO
ALTER TABLE [dbo].[tblDanhMuc] ADD  DEFAULT ((0)) FOR [DanhMucId]
GO
ALTER TABLE [dbo].[tblDanhMuc] ADD  DEFAULT ((1)) FOR [State]
GO
ALTER TABLE [dbo].[tblDanhMuc] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblProtect] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[tblQuestion] ADD  DEFAULT ((0)) FOR [NSTATUS]
GO
ALTER TABLE [dbo].[tblQuestion] ADD  DEFAULT (getdate()) FOR [CREATETIME]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD FOREIGN KEY([ACCT_GROUP])
REFERENCES [dbo].[tblAcctGroup] ([ID])
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD FOREIGN KEY([NSTATUS])
REFERENCES [dbo].[tblStatus] ([ID])
GO
ALTER TABLE [dbo].[tblAccountInfo]  WITH CHECK ADD FOREIGN KEY([ACCT_ID])
REFERENCES [dbo].[tblAccount] ([ACCT_ID])
GO
ALTER TABLE [dbo].[tblAcctGroup]  WITH CHECK ADD FOREIGN KEY([NSTATUS])
REFERENCES [dbo].[tblStatus] ([ID])
GO
ALTER TABLE [dbo].[tblAnswer]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[tblQuestion] ([ID])
GO
ALTER TABLE [dbo].[tblAnswerResult]  WITH CHECK ADD FOREIGN KEY([AnswerID])
REFERENCES [dbo].[tblAnswer] ([ID])
GO
ALTER TABLE [dbo].[tblAnswerResult]  WITH CHECK ADD FOREIGN KEY([QuestionID])
REFERENCES [dbo].[tblQuestion] ([ID])
GO
ALTER TABLE [dbo].[tblAnswerResult]  WITH CHECK ADD FOREIGN KEY([USERID])
REFERENCES [dbo].[tblAccount] ([ACCT_ID])
GO
ALTER TABLE [dbo].[tblCategory]  WITH CHECK ADD FOREIGN KEY([NSTATUS])
REFERENCES [dbo].[tblStatus] ([ID])
GO
ALTER TABLE [dbo].[tblChatMessage]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[tblChatRoom] ([RoomID])
GO
ALTER TABLE [dbo].[tblChatMessage]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[tblAccount] ([ACCT_ID])
GO
ALTER TABLE [dbo].[tblChatUser]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[tblChatRoom] ([RoomID])
GO
ALTER TABLE [dbo].[tblChatUser]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[tblAccount] ([ACCT_ID])
GO
ALTER TABLE [dbo].[tblContact]  WITH CHECK ADD FOREIGN KEY([NSTATUS])
REFERENCES [dbo].[tblStatus] ([ID])
GO
ALTER TABLE [dbo].[tblMenu]  WITH CHECK ADD FOREIGN KEY([PID])
REFERENCES [dbo].[tblMenu] ([ID])
GO
ALTER TABLE [dbo].[tblNews]  WITH CHECK ADD FOREIGN KEY([CatId])
REFERENCES [dbo].[tblNewsGroup] ([ID])
GO
ALTER TABLE [dbo].[tblNews]  WITH CHECK ADD FOREIGN KEY([NSTATUS])
REFERENCES [dbo].[tblStatus] ([ID])
GO
ALTER TABLE [dbo].[tblNews]  WITH CHECK ADD FOREIGN KEY([UserEdit])
REFERENCES [dbo].[tblAccount] ([ACCT_ID])
GO
ALTER TABLE [dbo].[tblNews]  WITH CHECK ADD FOREIGN KEY([UserPost])
REFERENCES [dbo].[tblAccount] ([ACCT_ID])
GO
ALTER TABLE [dbo].[tblNewsGroup]  WITH CHECK ADD FOREIGN KEY([NSTATUS])
REFERENCES [dbo].[tblStatus] ([ID])
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD FOREIGN KEY([GROUPID])
REFERENCES [dbo].[tblCategory] ([ID])
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD FOREIGN KEY([NSTATUS])
REFERENCES [dbo].[tblStatus] ([ID])
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD FOREIGN KEY([UserEdit])
REFERENCES [dbo].[tblAccount] ([ACCT_ID])
GO
ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD FOREIGN KEY([UserPost])
REFERENCES [dbo].[tblAccount] ([ACCT_ID])
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD FOREIGN KEY([CREATEUSER])
REFERENCES [dbo].[tblAccount] ([ACCT_ID])
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD FOREIGN KEY([EDITUSER])
REFERENCES [dbo].[tblAccount] ([ACCT_ID])
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD FOREIGN KEY([NSTATUS])
REFERENCES [dbo].[tblStatus] ([ID])
GO
USE [master]
GO
ALTER DATABASE [noi100760_data] SET  READ_WRITE 
GO
