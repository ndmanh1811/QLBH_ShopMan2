# Danh mục các tệp mã nguồn PlantUML (.puml) mặc định

Toàn bộ **20 sơ đồ UML chính thức** của hệ thống ShopMan (Đề số 35, hậu tố 2) được đồng bộ hóa tuyệt đối 1-1 với Báo cáo bài tập lớn (từ Hình 1.1 đến Hình 6.6), sử dụng cú pháp PlantUML chuẩn mặc định (không màu mè tùy biến):

> **Tệp gộp toàn bộ sơ đồ (dành cho việc kiểm tra một lần hoặc nạp vào AI khác):**
> * Tệp PUML gộp: **[tat_ca_so_do.puml](tat_ca_so_do.puml)** (Gồm 20 sơ đồ chính thức + 2 sơ đồ tuần tự phân tích phụ lục).
> * Tệp Markdown gộp: **[tat_ca_so_do.md](tat_ca_so_do.md)** (Dạng tài liệu Markdown kèm tiêu đề và khối mã `plantuml`, tiện gửi vào ChatGPT/Claude).

---

## 1. Tuần 1: Khảo sát & Phân tích Use Case
* **tuan1_hinh1_1_usecase_tongquan.puml**: Hình 1.1: Sơ đồ use case tổng quan toàn hệ thống ShopMan.
* **tuan1_hinh1_2_usecase_register_member.puml**: Hình 1.2: Sơ đồ use case chi tiết module Đăng ký thành viên (Register Member 2).
* **tuan1_hinh1_3_usecase_item_revenue_stat.puml**: Hình 1.3: Sơ đồ use case chi tiết module Thống kê mặt hàng theo doanh thu (Item Statistics By Revenue 2).

## 2. Tuần 2: Lớp phân tích thực thể
* **tuan2_hinh2_1_class_diagram_phantich.puml**: Hình 2.1: Sơ đồ 15 lớp thực thể pha phân tích và các mối quan hệ (kế thừa, hợp thành, lớp liên kết).

## 3. Tuần 3: Phân tích ca sử dụng
* **tuan3_hinh3_1_bce_register_member.puml**: Hình 3.1: Sơ đồ lớp phân tích BCE - Đăng ký thành viên.
* **tuan3_hinh3_2_bce_item_revenue_stat.puml**: Hình 3.2: Sơ đồ lớp phân tích BCE - Thống kê mặt hàng theo doanh thu.
* **tuan3_hinh3_3_state_register_member.puml**: Hình 3.3: Sơ đồ máy trạng thái - Đăng ký thành viên.
* **tuan3_hinh3_4_state_item_revenue_stat.puml**: Hình 3.4: Sơ đồ máy trạng thái - Thống kê mặt hàng theo doanh thu.
* **tuan3_hinh3_5_comm_register_member.puml**: Hình 3.5: Sơ đồ giao tiếp (Communication Diagram) - Đăng ký thành viên.
* **tuan3_hinh3_6_comm_item_revenue_stat.puml**: Hình 3.6: Sơ đồ giao tiếp (Communication Diagram) - Thống kê mặt hàng theo doanh thu.

## 4. Tuần 4: Thiết kế dữ liệu
* **tuan4_hinh4_1_design_entity_class.puml**: Hình 4.1: Sơ đồ thiết kế lớp thực thể (đầy đủ thuộc tính, kiểu dữ liệu, quan hệ aggregation/composition).
* **tuan4_hinh4_2_database_schema_erd.puml**: Hình 4.2: Sơ đồ thiết kế cơ sở dữ liệu quan hệ (ERD/Schema với đầy đủ <<PK>>, <<FK>> và ràng buộc duy nhất <<UQ>>).

## 5. Tuần 5: Thiết kế lớp chi tiết
*(Lưu ý: Hình 5.1 và Hình 5.3 trong Báo cáo dành cho bản vẽ wireframe giao diện)*
* **tuan5_hinh5_2_class_design_register_member.puml**: Hình 5.2: Sơ đồ lớp thiết kế chi tiết (View - DAO - Model) Đăng ký thành viên.
* **tuan5_hinh5_4_class_design_item_revenue_stat.puml**: Hình 5.4: Sơ đồ lớp thiết kế chi tiết (View - DAO - Model) Thống kê mặt hàng theo doanh thu.

## 6. Tuần 6: Kiến trúc & Hành vi hệ thống
* **tuan6_hinh6_1_activity_register_member.puml**: Hình 6.1: Sơ đồ hoạt động (Activity Diagram) chuẩn giáo trình PTIT (luồng Happy Path, tách biệt khối DAO) - Đăng ký thành viên.
* **tuan6_hinh6_2_sequence_register_member.puml**: Hình 6.2: Sơ đồ tuần tự thiết kế (Design Sequence Diagram - 16 bước kịch bản ver 3.0) - Đăng ký thành viên.
* **tuan6_hinh6_3_activity_item_revenue_stat.puml**: Hình 6.3: Sơ đồ hoạt động (Activity Diagram) chuẩn giáo trình PTIT (luồng Happy Path, tách biệt khối DAO) - Thống kê mặt hàng theo doanh thu.
* **tuan6_hinh6_4_sequence_item_revenue_stat.puml**: Hình 6.4: Sơ đồ tuần tự thiết kế (Design Sequence Diagram - 24 bước kịch bản ver 3.0) - Thống kê mặt hàng theo doanh thu.
* **tuan6_hinh6_5_package_diagram.puml**: Hình 6.5: Sơ đồ thiết kế gói (Package Diagram) kiến trúc MVC 3 tầng.
* **tuan6_hinh6_6_deployment_diagram.puml**: Hình 6.6: Sơ đồ triển khai vật lý (Deployment Diagram) hệ thống Web ShopMan trên Apache Tomcat 9.

---

## 7. Phụ lục bổ trợ tham khảo
* **phu_luc_tuan3_sequence_register_member.puml**: Biểu đồ tuần tự pha phân tích - Đăng ký thành viên (đã chuẩn hóa mũi tên phản hồi nét đứt `-->`).
* **phu_luc_tuan3_sequence_item_revenue_stat.puml**: Biểu đồ tuần tự pha phân tích - Thống kê mặt hàng theo doanh thu (đã chuẩn hóa mũi tên phản hồi nét đứt `-->`).
