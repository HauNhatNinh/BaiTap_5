# BaiTap_5 by HẦU NHẬT NINH - K225480106077 - K58KTP.K01
# Trigger on MSSQL
## Tên đề tài: PHÂN TÍCH THIẾT KẾ HỆ THỐNG ĐẶT ĐỒ ĂN ONLINE CHO QUÁN CƠM TNUT
### Yêu cầu bài toán:
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
   - Bảng ```vai_tro```:
     - Mục đích: Lưu trữ các vai trò (roles) của người dùng trong hệ thống, chẳng hạn như quản trị viên (admin), nhân viên phục vụ, khách hàng, v.v.
   - Bảng ```nguoi_dung```:
     - Mục đích: Lưu trữ thông tin về người dùng của hệ thống, bao gồm khách hàng, nhân viên và chủ quán.
   - Bảng ```mon_an```:        
     - Mục đích: Lưu trữ thông tin về các món ăn có trong thực đơn của quán.
   - Bảng ```thuc_don```:
     - Mục đích: Lưu trữ thông tin về thực đơn theo ngày và theo ca (trưa/tối).
   - Bảng ```chi_tiet_thuc_don```:
     - Mục đích: Lưu trữ thông tin chi tiết về các món ăn trong thực đơn mỗi ngày.    
   - Bảng ```trang_thai_don```:
     - Mục đích: Lưu trữ các trạng thái của đơn đặt món, chẳng hạn như "Đang chuẩn bị", "Đã giao", "Đã hủy".
   - Bảng ```don_dat```:
     - Mục đích: Lưu trữ thông tin về các đơn đặt hàng của khách hàng.
   - Bảng chi_tiet_don:
     - Mục đích: Lưu trữ thông tin chi tiết về các món ăn trong mỗi đơn hàng, bao gồm số lượng món.    
 - Check Constraints (CK) của một số bảng và lợi ích của chúng:
   - Bảng ```thuc_don```:
     - Ràng buộc ca_an: Đảm bảo giá trị của ca_an chỉ có thể là "trưa" hoặc "tối".
   - Bảng ```mon_an```:
	  - Ràng buộc giá món ăn: Đảm bảo giá món ăn phải lớn hơn 0.
   - Bảng ```chi_tiet_don```:
     - Ràng buộc số lượng món ăn: Đảm bảo số lượng món ăn trong đơn hàng phải lớn hơn 0.
   - Bảng ```nguoi_dung```:
     - Ràng buộc email: Đảm bảo email phải chứa ký tự "@" (một kiểm tra đơn giản về định dạng email).
### Thêm trường phi chuẩn

  Trường phi chuẩn là những trường không cần thiết phải lưu trong cơ sở dữ liệu, nhưng có thể tính toán một cách dễ dàng thông qua các truy vấn. Tuy nhiên, nếu chúng ta muốn tăng tốc độ truy vấn hoặc giảm tải tính toán cho các hệ thống, việc lưu trữ các trường phi chuẩn có thể là một sự cải thiện tốt.
  
  Ở database này tôi sẽ thêm một trường ```tong_tien``` vào trong bảng ```don_dat```, trường này sẽ lưu tổng tiền mà người dùng phải thanh toán cho đơn đặt hàng, thay vì phải tính lại mỗi khi cần thiết.

  ![Screenshot (44)](https://github.com/user-attachments/assets/4bf901e6-4d25-407b-bfcd-becb304665c8)

  #### Logic:

  Trường ```tong_tien``` được tính bằng cách nhân giá món ăn với số lượng món ăn trong ```chi_tiet_don```. Việc tính toán này có thể được thực hiện qua một *JOIN* giữa các bảng ```don_dat```, ```chi_tiet_don```, và ```mon_an```. Tuy nhiên, để giảm bớt việc tính toán lặp lại mỗi khi truy vấn đơn đặt hàng, ta có thể lưu sẵn trường này vào bảng ```don_dat```.

  Việc thêm trường này sẽ giúp giảm thời gian truy vấn, đặc biệt là trong trường hợp hệ thống có rất nhiều đơn đặt hàng và yêu cầu tính toán tổng tiền nhiều lần. 

  #### => Trường ```tong_tien``` sẽ được tính tự động và cập nhật mỗi khi có thay đổi trong bảng ```chi_tiet_don``` hoặc ```mon_an```.

  ![Screenshot (45)](https://github.com/user-attachments/assets/b762b903-d117-4b72-8255-e95f811fa22a)

  #### Mục tiêu của Trigger:

   - Mục tiêu 1: Cập nhật trường tong_tien mỗi khi có sự thay đổi trong bảng ```chi_tiet_don``` hoặc ```mon_an``` (khi có thay đổi về giá món ăn hoặc số lượng món ăn).

   - Mục tiêu 2: Đảm bảo tính chính xác của trường phi chuẩn mà không cần phải tính lại thủ công mỗi lần người dùng truy vấn.
     
  #### Giải thích Trigger:

   - Khi có thay đổi trong bảng ```chi_tiet_don``` (thêm, cập nhật, hoặc xóa), Trigger sẽ tự động chạy.

   - Trigger sẽ cập nhật trường ```tong_tien``` trong bảng ```don_dat``` cho đơn hàng tương ứng bằng cách tính lại tổng tiền từ bảng ```chi_tiet_don``` và ```mon_an```.

   - ``` SUM(chi_tiet_don.so_luong * mon_an.gia) ``` sẽ tính tổng tiền cho đơn hàng dựa trên số lượng và giá của mỗi món ăn.


### Nhập dữ liệu cho các bảng trong database, test trigger
- Tiến hành nhập dữ liệu để test hiệu quả của trigger
  
  ![image](https://github.com/user-attachments/assets/7e2bec02-8c49-4fd2-9a1e-38388311a1d8)


#### Test truy vấn sau khi thêm trigger auto run
- Mục tiêu: Thêm 1 món mới vào một đơn đã có, và xem tong_tien có tự cập nhật hay không.
- Truy vấn test trigger: Giả sử muốn thêm món "Cơm sườn" (mã món = 2) vào đơn ma_don = 3:
- Kết quả mong đợi:
   ```tong_tien``` của đơn hàng số 3 sẽ tăng thêm 25.000 so với giá trị cũ.
  
  • Nếu đúng như vậy → trigger hoạt động tốt.
   
![Screenshot (46)](https://github.com/user-attachments/assets/35ed2785-6b32-4af8-af0a-f22cb6dda7f3)

##### => Trigger đã hoạt động.

#### Kết Luận:
- Trigger đã giúp cho đồ án của tôi:
  - Giảm rủi ro người dùng/nhân viên quên tính tổng tiền, hoặc tính sai.
  - Trigger giúp dữ liệu luôn đồng bộ giữa chi tiết đơn và đơn chính.
###### => Đảm bảo toàn vẹn dữ liệu 

- Dễ dàng thống kê doanh thu, lợi nhuận, các phân tích theo thời gian, theo người dùng, món ăn...
- Ví dụ: tổng doanh thu trong ngày chỉ cần:
   ```sql
   SELECT SUM(tong_tien) FROM don_dat WHERE CAST(thoi_gian_dat AS DATE) = 'yy-mm-dd';
   
###### => Hỗ trợ thống kê nhanh và chính xác 
  
### Tóm lại: Trigger ```tong_tien``` đã tự động hóa, tối ưu hóa và bảo vệ dữ liệu, góp phần biến hệ thống quán cơm sinh viên TNUT của tôi trở nên thực tế và đáng tin cậy hơn nhiều.



