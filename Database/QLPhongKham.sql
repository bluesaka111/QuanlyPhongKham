USE [QuanLyPhongKham]
GO
/****** Object:  Table [dbo].[Thuoc]    Script Date: 03/15/2016 19:08:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Thuoc](
	[MaTh] [nchar](10) NOT NULL,
	[TenThuoc] [nvarchar](50) NOT NULL,
	[DoViTinh] [nvarchar](50) NULL,
	[ChiDinh] [nvarchar](300) NULL,
	[SoLuongTonKho] [tinyint] NULL,
 CONSTRAINT [PK_Thuoc] PRIMARY KEY CLUSTERED 
(
	[MaTh] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 03/15/2016 19:08:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nchar](10) NOT NULL,
	[HoNV] [nvarchar](50) NOT NULL,
	[TenNV] [nvarchar](50) NOT NULL,
	[ChucVu] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[SoDienThoai] [tinyint] NULL,
	[DiaChi] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BenhNhan]    Script Date: 03/15/2016 19:08:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenhNhan](
	[MaBN] [nchar](10) NOT NULL,
	[HoBN] [nvarchar](50) NOT NULL,
	[TenBN] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[SoDienThoai] [tinyint] NULL,
	[AnhBN] [char](1000) NULL,
	[DiaChi] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_BenhNhan] PRIMARY KEY CLUSTERED 
(
	[MaBN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BenhAn]    Script Date: 03/15/2016 19:08:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BenhAn](
	[MaBA] [nchar](10) NOT NULL,
	[ChanDoanBenh] [nvarchar](300) NOT NULL,
	[MaNV] [nchar](10) NOT NULL,
	[MaBN] [nchar](10) NOT NULL,
	[NgayKham] [datetime] NOT NULL,
 CONSTRAINT [PK_BenhAn] PRIMARY KEY CLUSTERED 
(
	[MaBA] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 03/15/2016 19:08:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[Username] [nchar](50) NOT NULL,
	[Password] [nchar](255) NOT NULL,
	[MaNV] [nchar](10) NOT NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonThuoc]    Script Date: 03/15/2016 19:08:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonThuoc](
	[MaDT] [nchar](10) NOT NULL,
	[MaTh] [nchar](10) NOT NULL,
	[TenThuoc] [nvarchar](50) NOT NULL,
	[SoLuong] [tinyint] NOT NULL,
 CONSTRAINT [PK_DonThuoc] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietDonThuoc]    Script Date: 03/15/2016 19:08:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonThuoc](
	[MaDT] [nchar](10) NOT NULL,
	[MaBA] [nchar](10) NOT NULL,
	[NgayTaiKham] [datetime] NOT NULL,
	[GhiChu] [text] NOT NULL,
 CONSTRAINT [PK_ChiTietDonThuoc] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC,
	[MaBA] ASC,
	[NgayTaiKham] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  ForeignKey [FK_BenhAn_BenhNhan]    Script Date: 03/15/2016 19:08:33 ******/
ALTER TABLE [dbo].[BenhAn]  WITH CHECK ADD  CONSTRAINT [FK_BenhAn_BenhNhan] FOREIGN KEY([MaBN])
REFERENCES [dbo].[BenhNhan] ([MaBN])
GO
ALTER TABLE [dbo].[BenhAn] CHECK CONSTRAINT [FK_BenhAn_BenhNhan]
GO
/****** Object:  ForeignKey [FK_BenhAn_NhanVien]    Script Date: 03/15/2016 19:08:33 ******/
ALTER TABLE [dbo].[BenhAn]  WITH CHECK ADD  CONSTRAINT [FK_BenhAn_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[BenhAn] CHECK CONSTRAINT [FK_BenhAn_NhanVien]
GO
/****** Object:  ForeignKey [FK_ChiTietDonThuoc_BenhAn]    Script Date: 03/15/2016 19:08:33 ******/
ALTER TABLE [dbo].[ChiTietDonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonThuoc_BenhAn] FOREIGN KEY([MaBA])
REFERENCES [dbo].[BenhAn] ([MaBA])
GO
ALTER TABLE [dbo].[ChiTietDonThuoc] CHECK CONSTRAINT [FK_ChiTietDonThuoc_BenhAn]
GO
/****** Object:  ForeignKey [FK_ChiTietDonThuoc_DonThuoc]    Script Date: 03/15/2016 19:08:33 ******/
ALTER TABLE [dbo].[ChiTietDonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonThuoc_DonThuoc] FOREIGN KEY([MaDT])
REFERENCES [dbo].[DonThuoc] ([MaDT])
GO
ALTER TABLE [dbo].[ChiTietDonThuoc] CHECK CONSTRAINT [FK_ChiTietDonThuoc_DonThuoc]
GO
/****** Object:  ForeignKey [FK_DonThuoc_Thuoc]    Script Date: 03/15/2016 19:08:33 ******/
ALTER TABLE [dbo].[DonThuoc]  WITH CHECK ADD  CONSTRAINT [FK_DonThuoc_Thuoc] FOREIGN KEY([MaTh])
REFERENCES [dbo].[Thuoc] ([MaTh])
GO
ALTER TABLE [dbo].[DonThuoc] CHECK CONSTRAINT [FK_DonThuoc_Thuoc]
GO
/****** Object:  ForeignKey [FK_NguoiDung_NhanVien]    Script Date: 03/15/2016 19:08:33 ******/
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_NhanVien]
GO
