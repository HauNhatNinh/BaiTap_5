USE [QuanComTNUT]
GO
SET IDENTITY_INSERT [dbo].[vai_tro] ON 

INSERT [dbo].[vai_tro] ([ma_vai_tro], [ten_vai_tro]) VALUES (1, N'khach_hang')
INSERT [dbo].[vai_tro] ([ma_vai_tro], [ten_vai_tro]) VALUES (2, N'nhan_vien')
INSERT [dbo].[vai_tro] ([ma_vai_tro], [ten_vai_tro]) VALUES (3, N'chu_quan')
SET IDENTITY_INSERT [dbo].[vai_tro] OFF
GO
SET IDENTITY_INSERT [dbo].[nguoi_dung] ON 

INSERT [dbo].[nguoi_dung] ([ma_nguoi_dung], [ho_ten], [email], [mat_khau], [ma_vai_tro]) VALUES (1, N'Nguyen Van A', N'a@gmail.com', N'123456', 1)
INSERT [dbo].[nguoi_dung] ([ma_nguoi_dung], [ho_ten], [email], [mat_khau], [ma_vai_tro]) VALUES (2, N'Tran Thi B', N'b@gmail.com', N'123456', 2)
INSERT [dbo].[nguoi_dung] ([ma_nguoi_dung], [ho_ten], [email], [mat_khau], [ma_vai_tro]) VALUES (3, N'Le Van C', N'c@gmail.com', N'123456', 3)
SET IDENTITY_INSERT [dbo].[nguoi_dung] OFF
GO
SET IDENTITY_INSERT [dbo].[thuc_don] ON 

INSERT [dbo].[thuc_don] ([ma_thuc_don], [ngay], [ca_an]) VALUES (1, CAST(N'2025-04-22' AS Date), N'trua')
INSERT [dbo].[thuc_don] ([ma_thuc_don], [ngay], [ca_an]) VALUES (2, CAST(N'2025-04-22' AS Date), N'toi')
INSERT [dbo].[thuc_don] ([ma_thuc_don], [ngay], [ca_an]) VALUES (3, CAST(N'2025-04-24' AS Date), N'trua')
INSERT [dbo].[thuc_don] ([ma_thuc_don], [ngay], [ca_an]) VALUES (4, CAST(N'2025-04-24' AS Date), N'toi')
INSERT [dbo].[thuc_don] ([ma_thuc_don], [ngay], [ca_an]) VALUES (5, CAST(N'2025-04-25' AS Date), N'trua')
INSERT [dbo].[thuc_don] ([ma_thuc_don], [ngay], [ca_an]) VALUES (6, CAST(N'2025-04-25' AS Date), N'toi')
SET IDENTITY_INSERT [dbo].[thuc_don] OFF
GO
SET IDENTITY_INSERT [dbo].[trang_thai_don] ON 

INSERT [dbo].[trang_thai_don] ([ma_trang_thai], [ten_trang_thai]) VALUES (1, N'dang_chuan_bi')
INSERT [dbo].[trang_thai_don] ([ma_trang_thai], [ten_trang_thai]) VALUES (2, N'da_giao')
INSERT [dbo].[trang_thai_don] ([ma_trang_thai], [ten_trang_thai]) VALUES (3, N'da_huy')
SET IDENTITY_INSERT [dbo].[trang_thai_don] OFF
GO
SET IDENTITY_INSERT [dbo].[don_dat] ON 

INSERT [dbo].[don_dat] ([ma_don], [ma_nguoi_dung], [ma_thuc_don], [thoi_gian_dat], [thoi_gian_nhan], [ma_trang_thai], [ghi_chu], [tong_tien]) VALUES (1, 1, 1, CAST(N'2025-04-23T00:08:54.523' AS DateTime), CAST(N'11:30:00' AS Time), 1, N'Không lấy hành', CAST(70000.00 AS Decimal(10, 2)))
INSERT [dbo].[don_dat] ([ma_don], [ma_nguoi_dung], [ma_thuc_don], [thoi_gian_dat], [thoi_gian_nhan], [ma_trang_thai], [ghi_chu], [tong_tien]) VALUES (2, 2, 2, CAST(N'2025-04-23T00:08:54.523' AS DateTime), CAST(N'18:00:00' AS Time), 2, N'Thêm cơm', CAST(25000.00 AS Decimal(10, 2)))
INSERT [dbo].[don_dat] ([ma_don], [ma_nguoi_dung], [ma_thuc_don], [thoi_gian_dat], [thoi_gian_nhan], [ma_trang_thai], [ghi_chu], [tong_tien]) VALUES (3, 1, 1, CAST(N'2025-04-23T15:31:47.313' AS DateTime), CAST(N'12:00:00' AS Time), 1, N'Không lấy hành', CAST(65000.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[don_dat] OFF
GO
SET IDENTITY_INSERT [dbo].[mon_an] ON 

INSERT [dbo].[mon_an] ([ma_mon_an], [ten_mon_an], [gia], [mo_ta], [hinh_anh]) VALUES (1, N'Cơm gà', CAST(20000.00 AS Decimal(10, 2)), N'Cơm với thịt gà chiên', N'com_ga.jpg')
INSERT [dbo].[mon_an] ([ma_mon_an], [ten_mon_an], [gia], [mo_ta], [hinh_anh]) VALUES (2, N'Cơm sườn', CAST(25000.00 AS Decimal(10, 2)), N'Cơm với sườn nướng', N'com_suon.jpg')
INSERT [dbo].[mon_an] ([ma_mon_an], [ten_mon_an], [gia], [mo_ta], [hinh_anh]) VALUES (3, N'Canh chua', CAST(10000.00 AS Decimal(10, 2)), N'Canh chua cá', N'canh_chua.jpg')
INSERT [dbo].[mon_an] ([ma_mon_an], [ten_mon_an], [gia], [mo_ta], [hinh_anh]) VALUES (4, N'Cơm chiên dương châu', CAST(22000.00 AS Decimal(10, 2)), N'Cơm chiên với rau củ và xúc xích', N'com_chien.jpg')
INSERT [dbo].[mon_an] ([ma_mon_an], [ten_mon_an], [gia], [mo_ta], [hinh_anh]) VALUES (5, N'Tráng miệng thạch dừa', CAST(5000.00 AS Decimal(10, 2)), N'Món tráng miệng thanh mát', N'thach_dua.jpg')
INSERT [dbo].[mon_an] ([ma_mon_an], [ten_mon_an], [gia], [mo_ta], [hinh_anh]) VALUES (6, N'Coca Cola', CAST(10000.00 AS Decimal(10, 2)), N'Nước uống giải khát', N'coca.jpg')
INSERT [dbo].[mon_an] ([ma_mon_an], [ten_mon_an], [gia], [mo_ta], [hinh_anh]) VALUES (7, N'Bún bò', CAST(25000.00 AS Decimal(10, 2)), N'Bún với bò hầm cay', N'bun_bo.jpg')
INSERT [dbo].[mon_an] ([ma_mon_an], [ten_mon_an], [gia], [mo_ta], [hinh_anh]) VALUES (8, N'Cơm cá kho', CAST(23000.00 AS Decimal(10, 2)), N'Cơm với cá kho tộ', N'ca_kho.jpg')
SET IDENTITY_INSERT [dbo].[mon_an] OFF
GO
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (1, 1)
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (1, 3)
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (2, 2)
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (3, 1)
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (3, 4)
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (3, 6)
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (4, 2)
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (4, 5)
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (5, 3)
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (5, 7)
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (6, 1)
INSERT [dbo].[chi_tiet_thuc_don] ([ma_thuc_don], [ma_mon_an]) VALUES (6, 8)
GO
INSERT [dbo].[chi_tiet_don] ([ma_don], [ma_mon_an], [so_luong]) VALUES (1, 1, 3)
INSERT [dbo].[chi_tiet_don] ([ma_don], [ma_mon_an], [so_luong]) VALUES (2, 2, 1)
INSERT [dbo].[chi_tiet_don] ([ma_don], [ma_mon_an], [so_luong]) VALUES (3, 1, 1)
INSERT [dbo].[chi_tiet_don] ([ma_don], [ma_mon_an], [so_luong]) VALUES (3, 2, 1)
INSERT [dbo].[chi_tiet_don] ([ma_don], [ma_mon_an], [so_luong]) VALUES (3, 3, 2)
GO
