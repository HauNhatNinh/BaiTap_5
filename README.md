# BaiTap_5 by HẦU NHẬT NINH - K225480106077 - K58KTP.K01
# Trigger on MSSQL
## Tên đề tài: PHÂN TÍCH THIẾT KẾ HỆ THỐNG ĐẶT ĐỒ ĂN ONLINE CHO QUÁN CƠM TNUT
### YÊU CẦU BÀI TOÁN:
#### •	Cung cấp giao diện đặt món đơn giản, dễ sử dụng trên điện thoại.
#### •	Cho phép hiển thị thực đơn theo ngày và khung giờ (trưa/tối).
#### •	Cho phép người dùng đặt món, chọn số lượng và thời gian nhận.
#### •	Hệ thống quản lý đơn hàng cho quán: theo dõi đơn mới, đã chuẩn bị, đã giao.
#### •	Chức năng thống kê doanh thu, số lượng món bán chạy theo thời gian.
#### •	Phân quyền người dùng: khách hàng, nhân viên quán, chủ quán.
---
## Bài Làm
### Sơ đồ của database đồ án

   ![Screenshot (47)](https://github.com/user-attachments/assets/e5317a90-445a-4136-b04e-633ad745ba6d)

- Mục đích khi tạo các bảng:
   - Bảng vai_tro:
     - Mục đích: Lưu trữ các vai trò (roles) của người dùng trong hệ thống, chẳng hạn như quản trị viên (admin), nhân viên phục vụ, khách hàng, v.v.
   - Bảng nguoi_dung:
     - Mục đích: Lưu trữ thông tin về người dùng của hệ thống, bao gồm khách hàng, nhân viên và chủ quán.
   - Bảng mon_an:        
     - Mục đích: Lưu trữ thông tin về các món ăn có trong thực đơn của quán.
   - Bảng thuc_don:
     - Mục đích: Lưu trữ thông tin về thực đơn theo ngày và theo ca (trưa/tối).
   - Bảng chi_tiet_thuc_don:
     - Mục đích: Lưu trữ thông tin chi tiết về các món ăn trong thực đơn mỗi ngày.    
   - Bảng trang_thai_don:
     - Mục đích: Lưu trữ các trạng thái của đơn đặt món, chẳng hạn như "Đang chuẩn bị", "Đã giao", "Đã hủy".
   - Bảng don_dat:
     - Mục đích: Lưu trữ thông tin về các đơn đặt hàng của khách hàng.
   - Bảng chi_tiet_don:
     - Mục đích: Lưu trữ thông tin chi tiết về các món ăn trong mỗi đơn hàng, bao gồm số lượng món.    














