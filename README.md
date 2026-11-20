# Hệ thống Quản lý Bán hàng Bách hóa Trực tuyến (ShopMan)
**Mã đề số: 35** | Học phần: Phân tích và Thiết kế Hệ thống Thông tin (PTIT)

- **Sinh viên thực hiện:** Nguyễn Đức Mạnh
- **Mã sinh viên:** B23DCCN532
- **Lớp hành chính:** D23CQCN14-B
- **Hậu tố định danh:** 2

---

## 1. Công nghệ sử dụng
- **Ngôn ngữ:** Java EE (Servlet 4.0 / JSP 2.3)
- **Kiến trúc:** 3 tầng (3-Tier Architecture) kết hợp JSP Model 1
- **Máy chủ Web:** Apache Tomcat 9.0+
- **Cơ sở dữ liệu:** MySQL / MariaDB (db_shopman2)
- **Kiểm thử tự động:** JUnit 4

---

## 2. Cấu trúc thư mục
- `database/`: Kịch bản `shopman2_db.sql` định nghĩa 9 bảng và nạp dữ liệu mẫu
- `src/model/`: 15 lớp thực thể mang hậu tố 2
- `src/dao/`: Lớp cơ sở `DAO2.java` và các lớp truy xuất dữ liệu `*DAO2.java`
- `src/test/`: 11 ca kiểm thử đơn vị tự động JUnit 4
- `so_do_puml/`: Toàn bộ 20 sơ đồ UML chuẩn PlantUML khớp 1-1 với báo cáo (Hình 1.1 đến 6.6)
- `code.md`: Tài liệu gộp toàn bộ mã nguồn hệ thống
- `run_test.bat`: Script tự động biên dịch và chạy 11 unit test cases JUnit 4
- `WebContent/`: Trang chủ `index.jsp`, tài nguyên tĩnh `assets/css/style.css`, thư viện `WEB-INF/lib/` và các giao diện `view/quanli/`, `view/thanhvien/`
