USE [QuanComTNUT]
GO
/****** Object:  Table [dbo].[chi_tiet_don]    Script Date: 4/23/2025 7:25:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_don](
	[ma_don] [int] NOT NULL,
	[ma_mon_an] [int] NOT NULL,
	[so_luong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_don] ASC,
	[ma_mon_an] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[chi_tiet_thuc_don]    Script Date: 4/23/2025 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_thuc_don](
	[ma_thuc_don] [int] NOT NULL,
	[ma_mon_an] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_thuc_don] ASC,
	[ma_mon_an] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[don_dat]    Script Date: 4/23/2025 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[don_dat](
	[ma_don] [int] IDENTITY(1,1) NOT NULL,
	[ma_nguoi_dung] [int] NULL,
	[ma_thuc_don] [int] NULL,
	[thoi_gian_dat] [datetime] NULL,
	[thoi_gian_nhan] [time](0) NULL,
	[ma_trang_thai] [int] NULL,
	[ghi_chu] [nvarchar](max) NULL,
	[tong_tien] [decimal](10, 2) NULL,
 CONSTRAINT [PK__don_dat__057D6CE16466924B] PRIMARY KEY CLUSTERED 
(
	[ma_don] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[mon_an]    Script Date: 4/23/2025 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mon_an](
	[ma_mon_an] [int] IDENTITY(1,1) NOT NULL,
	[ten_mon_an] [nvarchar](100) NULL,
	[gia] [decimal](10, 2) NULL,
	[mo_ta] [nvarchar](max) NULL,
	[hinh_anh] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_mon_an] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nguoi_dung]    Script Date: 4/23/2025 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nguoi_dung](
	[ma_nguoi_dung] [int] IDENTITY(1,1) NOT NULL,
	[ho_ten] [nvarchar](100) NULL,
	[email] [nvarchar](100) NULL,
	[mat_khau] [nvarchar](100) NULL,
	[ma_vai_tro] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_nguoi_dung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thuc_don]    Script Date: 4/23/2025 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thuc_don](
	[ma_thuc_don] [int] IDENTITY(1,1) NOT NULL,
	[ngay] [date] NULL,
	[ca_an] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_thuc_don] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[trang_thai_don]    Script Date: 4/23/2025 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[trang_thai_don](
	[ma_trang_thai] [int] IDENTITY(1,1) NOT NULL,
	[ten_trang_thai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_trang_thai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vai_tro]    Script Date: 4/23/2025 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vai_tro](
	[ma_vai_tro] [int] IDENTITY(1,1) NOT NULL,
	[ten_vai_tro] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ma_vai_tro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[don_dat] ADD  CONSTRAINT [DF__don_dat__thoi_gi__46E78A0C]  DEFAULT (getdate()) FOR [thoi_gian_dat]
GO
ALTER TABLE [dbo].[chi_tiet_don]  WITH CHECK ADD  CONSTRAINT [FK__chi_tiet___ma_do__4CA06362] FOREIGN KEY([ma_don])
REFERENCES [dbo].[don_dat] ([ma_don])
GO
ALTER TABLE [dbo].[chi_tiet_don] CHECK CONSTRAINT [FK__chi_tiet___ma_do__4CA06362]
GO
ALTER TABLE [dbo].[chi_tiet_don]  WITH CHECK ADD FOREIGN KEY([ma_mon_an])
REFERENCES [dbo].[mon_an] ([ma_mon_an])
GO
ALTER TABLE [dbo].[chi_tiet_thuc_don]  WITH CHECK ADD FOREIGN KEY([ma_mon_an])
REFERENCES [dbo].[mon_an] ([ma_mon_an])
GO
ALTER TABLE [dbo].[chi_tiet_thuc_don]  WITH CHECK ADD FOREIGN KEY([ma_thuc_don])
REFERENCES [dbo].[thuc_don] ([ma_thuc_don])
GO
ALTER TABLE [dbo].[don_dat]  WITH CHECK ADD  CONSTRAINT [FK__don_dat__ma_nguo__47DBAE45] FOREIGN KEY([ma_nguoi_dung])
REFERENCES [dbo].[nguoi_dung] ([ma_nguoi_dung])
GO
ALTER TABLE [dbo].[don_dat] CHECK CONSTRAINT [FK__don_dat__ma_nguo__47DBAE45]
GO
ALTER TABLE [dbo].[don_dat]  WITH CHECK ADD  CONSTRAINT [FK__don_dat__ma_thuc__48CFD27E] FOREIGN KEY([ma_thuc_don])
REFERENCES [dbo].[thuc_don] ([ma_thuc_don])
GO
ALTER TABLE [dbo].[don_dat] CHECK CONSTRAINT [FK__don_dat__ma_thuc__48CFD27E]
GO
ALTER TABLE [dbo].[don_dat]  WITH CHECK ADD  CONSTRAINT [FK__don_dat__ma_tran__49C3F6B7] FOREIGN KEY([ma_trang_thai])
REFERENCES [dbo].[trang_thai_don] ([ma_trang_thai])
GO
ALTER TABLE [dbo].[don_dat] CHECK CONSTRAINT [FK__don_dat__ma_tran__49C3F6B7]
GO
ALTER TABLE [dbo].[nguoi_dung]  WITH CHECK ADD FOREIGN KEY([ma_vai_tro])
REFERENCES [dbo].[vai_tro] ([ma_vai_tro])
GO
ALTER TABLE [dbo].[chi_tiet_don]  WITH CHECK ADD  CONSTRAINT [chk_so_luong_mon_an] CHECK  (([so_luong]>(0)))
GO
ALTER TABLE [dbo].[chi_tiet_don] CHECK CONSTRAINT [chk_so_luong_mon_an]
GO
ALTER TABLE [dbo].[mon_an]  WITH CHECK ADD  CONSTRAINT [chk_gia_mon_an] CHECK  (([gia]>(0)))
GO
ALTER TABLE [dbo].[mon_an] CHECK CONSTRAINT [chk_gia_mon_an]
GO
ALTER TABLE [dbo].[nguoi_dung]  WITH CHECK ADD  CONSTRAINT [chk_email_format] CHECK  (([email] like '%@%'))
GO
ALTER TABLE [dbo].[nguoi_dung] CHECK CONSTRAINT [chk_email_format]
GO
ALTER TABLE [dbo].[thuc_don]  WITH CHECK ADD  CONSTRAINT [chk_ca_an] CHECK  (([ca_an]=N'toi' OR [ca_an]=N'trua'))
GO
ALTER TABLE [dbo].[thuc_don] CHECK CONSTRAINT [chk_ca_an]
GO
/****** Object:  Trigger [dbo].[trg_update_tong_tien]    Script Date: 4/23/2025 7:25:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Trigger để cập nhật trường tong_tien mỗi khi có sự thay đổi trong chi_tiet_don
CREATE TRIGGER [dbo].[trg_update_tong_tien]
ON [dbo].[chi_tiet_don]
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    -- Cập nhật lại tổng tiền cho đơn đặt hàng liên quan
    DECLARE @ma_don INT;

    -- Lấy ma_don từ bản ghi vừa thay đổi
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SELECT @ma_don = ma_don FROM inserted;
    END

    -- Cập nhật trường tong_tien cho đơn đặt hàng
    UPDATE don_dat
    SET tong_tien = (
        SELECT SUM(chi_tiet_don.so_luong * mon_an.gia)
        FROM chi_tiet_don
        JOIN mon_an ON chi_tiet_don.ma_mon_an = mon_an.ma_mon_an
        WHERE chi_tiet_don.ma_don = @ma_don
        GROUP BY chi_tiet_don.ma_don
    )
    WHERE ma_don = @ma_don;
END;
GO
ALTER TABLE [dbo].[chi_tiet_don] ENABLE TRIGGER [trg_update_tong_tien]
GO
