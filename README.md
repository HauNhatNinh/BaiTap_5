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
 - Check Constraints (CK) của một số bảng và lợi ích của chúng:
   - Bảng thuc_don:
     - Ràng buộc ca_an: Đảm bảo giá trị của ca_an chỉ có thể là "trưa" hoặc "tối".
   - Bảng mon_an:
	  - Ràng buộc giá món ăn: Đảm bảo giá món ăn phải lớn hơn 0.
   - Bảng chi_tiet_don:
     - Ràng buộc số lượng món ăn: Đảm bảo số lượng món ăn trong đơn hàng phải lớn hơn 0.
   - Bảng nguoi_dung:
     - Ràng buộc email: Đảm bảo email phải chứa ký tự "@" (một kiểm tra đơn giản về định dạng email).
### Thêm trường phi chuẩn

  Trường phi chuẩn là những trường không cần thiết phải lưu trong cơ sở dữ liệu, nhưng có thể tính toán một cách dễ dàng thông qua các truy vấn. Tuy nhiên, nếu chúng ta muốn tăng tốc độ truy vấn hoặc giảm tải tính toán cho các hệ thống, việc lưu trữ các trường phi chuẩn có thể là một sự cải thiện tốt.
  
  Ở database này tôi sẽ thêm một trường __tong_tien__ vào trong bảng __don_dat__, trường này sẽ lưu tổng tiền mà người dùng phải thanh toán cho đơn đặt hàng, thay vì phải tính lại mỗi khi cần thiết.

  #### Logic:

  Trường __tong_tien__ được tính bằng cách nhân giá món ăn với số lượng món ăn trong __chi_tiet_don__. Việc tính toán này có thể được thực hiện qua một *JOIN* giữa các bảng __don_dat__, __chi_tiet_don__, và __mon_an__. Tuy nhiên, để giảm bớt việc tính toán lặp lại mỗi khi truy vấn đơn đặt hàng, ta có thể lưu sẵn trường này vào bảng __don_dat__.

  Việc thêm trường này sẽ giúp giảm thời gian truy vấn, đặc biệt là trong trường hợp hệ thống có rất nhiều đơn đặt hàng và yêu cầu tính toán tổng tiền nhiều lần. 

  #### => Trường *tong_tien* sẽ được tính tự động và cập nhật mỗi khi có thay đổi trong bảng *chi_tiet_don* hoặc *mon_an*.













