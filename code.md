# TOÀN BỘ MÃ NGUỒN HỆ THỐNG SHOPMAN (ĐỀ 35 - HẬU TỐ 2)

**Sinh viên thực hiện**: Nguyễn Đức Mạnh - Mã sinh viên: B23DCCN532  
**Học phần**: Phân tích và Thiết kế Hệ thống Thông tin (PTIT)  
**Kiến trúc**: Mô hình MVC 3 tầng chuẩn (JSP / Servlet + DAO + Model POJO) trên Apache Tomcat 9 & MySQL 8  

---

## MỤC LỤC TẬP TIN MÃ NGUỒN

### 1. Cơ sở dữ liệu MySQL (Schema & Seed Data)
- **`database/shopman2_db.sql`** (shopman2_db.sql): Script khởi tạo CSDL db_shopman2, 9 bảng và dữ liệu mẫu khớp 100% Wireframe Hình 5.3

### 2. Tầng DAO (Data Access Object)
- **`src/dao/DAO2.java`** (DAO2.java): Lớp cha dùng chung quản lý kết nối MySQL Connection
- **`src/dao/MemberDAO2.java`** (MemberDAO2.java): Xử lý kiểm tra trùng lặp thành viên và kiểm tra đăng nhập
- **`src/dao/CustomerDAO2.java`** (CustomerDAO2.java): Lưu khách hàng mới với Transaction 2 bảng tblMember2 và tblCustomer2
- **`src/dao/ItemRevenueStatDAO2.java`** (ItemRevenueStatDAO2.java): Thống kê mặt hàng theo doanh thu giảm dần trong khoảng thời gian
- **`src/dao/InvoiceDetailDAO2.java`** (InvoiceDetailDAO2.java): Lấy chi tiết các lần giao dịch của mặt hàng theo thời gian tăng dần

### 3. Tầng Model (Thực thể & Thống kê DTO)
- **`src/model/Member2.java`** (Member2.java): Lớp thực thể cơ sở Thành viên
- **`src/model/Customer2.java`** (Customer2.java): Lớp thực thể Khách hàng kế thừa Member2
- **`src/model/Employee2.java`** (Employee2.java): Lớp thực thể Nhân viên kế thừa Member2
- **`src/model/Manager2.java`** (Manager2.java): Lớp thực thể Quản lý kế thừa Employee2
- **`src/model/SalesStaff2.java`** (SalesStaff2.java): Lớp thực thể Nhân viên bán hàng kế thừa Employee2
- **`src/model/Supplier2.java`** (Supplier2.java): Lớp thực thể Nhà cung cấp
- **`src/model/Item2.java`** (Item2.java): Lớp thực thể Mặt hàng
- **`src/model/Invoice2.java`** (Invoice2.java): Lớp thực thể Hóa đơn bán hàng
- **`src/model/InvoiceDetail2.java`** (InvoiceDetail2.java): Lớp thực thể Chi tiết hóa đơn
- **`src/model/ImportReceipt2.java`** (ImportReceipt2.java): Lớp thực thể Phiếu nhập
- **`src/model/ImportReceiptDetail2.java`** (ImportReceiptDetail2.java): Lớp thực thể Chi tiết phiếu nhập
- **`src/model/ItemRevenueStat2.java`** (ItemRevenueStat2.java): Lớp thống kê mặt hàng theo doanh thu kế thừa Item2
- **`src/model/ItemImportStat2.java`** (ItemImportStat2.java): Lớp thống kê hàng nhập kế thừa Item2
- **`src/model/CustomerStat2.java`** (CustomerStat2.java): Lớp thống kê khách hàng kế thừa Customer2
- **`src/model/SupplierStat2.java`** (SupplierStat2.java): Lớp thống kê nhà cung cấp kế thừa Supplier2

### 4. Tầng Kiểm thử Đơn vị JUnit (Unit Test Tuần 7)
- **`src/test/MemberDAO2Test.java`** (MemberDAO2Test.java): Kiểm thử đơn vị MemberDAO2 (trùng username, trùng email, dữ liệu mới)
- **`src/test/CustomerDAO2Test.java`** (CustomerDAO2Test.java): Kiểm thử đơn vị CustomerDAO2 (lưu thành công, rollback khi lỗi)
- **`src/test/ItemRevenueStatDAO2Test.java`** (ItemRevenueStatDAO2Test.java): Kiểm thử đơn vị ItemRevenueStatDAO2 (chuẩn Wireframe, khoảng trống)
- **`src/test/InvoiceDetailDAO2Test.java`** (InvoiceDetailDAO2Test.java): Kiểm thử đơn vị InvoiceDetailDAO2 (chi tiết giao dịch MH01, kiểm tra thứ tự)
- **`src/test/TestRunner.java`** (TestRunner.java): Class thực thi tập trung toàn bộ 11 Unit Test Cases JUnit 4

### 5. Tầng Giao diện & Điều khiển JSP (View & Controller)
- **`WebContent/index.jsp`** (index.jsp): Cổng điều hướng tổng quan hệ thống ShopMan
- **`WebContent/view/thanhvien/CustomerHomeFrm2.jsp`** (CustomerHomeFrm2.jsp): Trang chủ khách hàng vãng lai
- **`WebContent/view/thanhvien/RegisterMemberFrm2.jsp`** (RegisterMemberFrm2.jsp): Giao diện biểu mẫu đăng ký thành viên mới
- **`WebContent/view/thanhvien/doRegisterMember2.jsp`** (doRegisterMember2.jsp): Controller xử lý đăng ký thành viên (validate, gọi DAO, redirect/forward)
- **`WebContent/view/thanhvien/LoginFrm2.jsp`** (LoginFrm2.jsp): Giao diện biểu mẫu đăng nhập hệ thống
- **`WebContent/view/thanhvien/doLogin2.jsp`** (doLogin2.jsp): Controller xử lý đăng nhập và phân quyền Session
- **`WebContent/view/quanli/ManagerHomeFrm2.jsp`** (ManagerHomeFrm2.jsp): Trang chủ phân hệ Quản lý
- **`WebContent/view/quanli/SelectStatTypeFrm2.jsp`** (SelectStatTypeFrm2.jsp): Giao diện chọn loại báo cáo thống kê
- **`WebContent/view/quanli/SelectDateRangeFrm2.jsp`** (SelectDateRangeFrm2.jsp): Giao diện chọn khoảng thời gian thống kê
- **`WebContent/view/quanli/ItemRevenueStatFrm2.jsp`** (ItemRevenueStatFrm2.jsp): Giao diện kết quả thống kê mặt hàng theo doanh thu
- **`WebContent/view/quanli/ItemTransactionDetailFrm2.jsp`** (ItemTransactionDetailFrm2.jsp): Giao diện chi tiết các lần giao dịch của mặt hàng đã chọn

---

## 1. Cơ sở dữ liệu MySQL (Schema & Seed Data)

### Tệp: `database/shopman2_db.sql`
*Script khởi tạo CSDL db_shopman2, 9 bảng và dữ liệu mẫu khớp 100% Wireframe Hình 5.3*

```sql
-- ====================================================================
-- HỆ THỐNG QUẢN LÝ BÁN HÀNG BÁCH HÓA TRỰC TUYẾN (SHOPMAN)
-- CSDL ĐỀ BÀI SỐ 35 - SINH VIÊN: NGUYỄN ĐỨC MẠNH - B23DCCN532 - HẬU TỐ: 2
-- ĐỒNG BỘ 100% VỚI BÁO CÁO THIẾT KẾ 35B23DCCN532.docx (9 BẢNG tbl*2)
-- DỮ LIỆU MẪU KHỚP 100% VỚI WIREFRAME HÌNH 5.3 TRONG BÁO CÁO
-- ====================================================================

CREATE DATABASE IF NOT EXISTS `db_shopman2` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `db_shopman2`;

-- Vô hiệu hóa kiểm tra khóa ngoại tạm thời để xóa bảng cũ an toàn
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `tblImportReceiptDetail2`;
DROP TABLE IF EXISTS `tblImportReceipt2`;
DROP TABLE IF EXISTS `tblInvoiceDetail2`;
DROP TABLE IF EXISTS `tblInvoice2`;
DROP TABLE IF EXISTS `tblItem2`;
DROP TABLE IF EXISTS `tblSupplier2`;
DROP TABLE IF EXISTS `tblEmployee2`;
DROP TABLE IF EXISTS `tblCustomer2`;
DROP TABLE IF EXISTS `tblMember2`;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. Bảng tblMember2 (Thành viên dùng chung)
CREATE TABLE `tblMember2` (
    `id` INT(10) AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `fullName` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `phone` VARCHAR(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 2. Bảng tblCustomer2 (Khách hàng)
CREATE TABLE `tblCustomer2` (
    `tblMember2id` INT(10) PRIMARY KEY,
    `customerCode` VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT `fk_customer_member` FOREIGN KEY (`tblMember2id`) REFERENCES `tblMember2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 3. Bảng tblEmployee2 (Nhân viên)
CREATE TABLE `tblEmployee2` (
    `tblMember2id` INT(10) PRIMARY KEY,
    `employeeCode` VARCHAR(50) NOT NULL UNIQUE,
    `position` VARCHAR(50) NOT NULL CHECK (`position` IN ('Quản lí', 'Bán hàng')),
    CONSTRAINT `fk_employee_member` FOREIGN KEY (`tblMember2id`) REFERENCES `tblMember2` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 4. Bảng tblSupplier2 (Nhà cung cấp)
CREATE TABLE `tblSupplier2` (
    `id` INT(10) AUTO_INCREMENT PRIMARY KEY,
    `supplierCode` VARCHAR(50) NOT NULL UNIQUE,
    `name` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(50) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 5. Bảng tblItem2 (Mặt hàng)
CREATE TABLE `tblItem2` (
    `id` INT(10) AUTO_INCREMENT PRIMARY KEY,
    `itemCode` VARCHAR(50) NOT NULL UNIQUE,
    `name` VARCHAR(255) NOT NULL,
    `unit` VARCHAR(50) NOT NULL,
    `price` FLOAT NOT NULL CHECK (`price` >= 0),
    `stockQuantity` INT(10) NOT NULL CHECK (`stockQuantity` >= 0),
    `description` VARCHAR(255) NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 6. Bảng tblInvoice2 (Hóa đơn bán hàng trực tuyến)
CREATE TABLE `tblInvoice2` (
    `id` INT(10) AUTO_INCREMENT PRIMARY KEY,
    `invoiceCode` VARCHAR(50) NOT NULL UNIQUE,
    `createdDate` DATE NOT NULL,
    `deliveryAddress` VARCHAR(255) NOT NULL,
    `status` VARCHAR(50) NOT NULL DEFAULT 'Chờ duyệt'
        CHECK (`status` IN ('Chờ duyệt', 'Đã duyệt', 'Đang giao hàng', 'Hoàn thành', 'Đã hủy')),
    `deliveryStaffName` VARCHAR(255) NULL,
    `tblCustomer2id` INT(10) NOT NULL,
    `tblEmployee2id` INT(10) NULL,
    CONSTRAINT `fk_invoice_customer` FOREIGN KEY (`tblCustomer2id`) REFERENCES `tblCustomer2` (`tblMember2id`),
    CONSTRAINT `fk_invoice_employee` FOREIGN KEY (`tblEmployee2id`) REFERENCES `tblEmployee2` (`tblMember2id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 7. Bảng tblInvoiceDetail2 (Chi tiết mặt hàng trong hóa đơn)
CREATE TABLE `tblInvoiceDetail2` (
    `id` INT(10) AUTO_INCREMENT PRIMARY KEY,
    `quantity` INT(10) NOT NULL CHECK (`quantity` > 0),
    `unitPrice` FLOAT NOT NULL CHECK (`unitPrice` >= 0),
    `tblInvoice2id` INT(10) NOT NULL,
    `tblItem2id` INT(10) NOT NULL,
    CONSTRAINT `fk_invdetail_invoice` FOREIGN KEY (`tblInvoice2id`) REFERENCES `tblInvoice2` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_invdetail_item` FOREIGN KEY (`tblItem2id`) REFERENCES `tblItem2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 8. Bảng tblImportReceipt2 (Phiếu nhập hàng từ nhà cung cấp)
CREATE TABLE `tblImportReceipt2` (
    `id` INT(10) AUTO_INCREMENT PRIMARY KEY,
    `receiptCode` VARCHAR(50) NOT NULL UNIQUE,
    `importDate` DATE NOT NULL,
    `tblEmployee2id` INT(10) NOT NULL,
    `tblSupplier2id` INT(10) NOT NULL,
    CONSTRAINT `fk_import_employee` FOREIGN KEY (`tblEmployee2id`) REFERENCES `tblEmployee2` (`tblMember2id`),
    CONSTRAINT `fk_import_supplier` FOREIGN KEY (`tblSupplier2id`) REFERENCES `tblSupplier2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- 9. Bảng tblImportReceiptDetail2 (Chi tiết mặt hàng trong phiếu nhập)
CREATE TABLE `tblImportReceiptDetail2` (
    `id` INT(10) AUTO_INCREMENT PRIMARY KEY,
    `quantity` INT(10) NOT NULL CHECK (`quantity` > 0),
    `importPrice` FLOAT NOT NULL CHECK (`importPrice` >= 0),
    `tblImportReceipt2id` INT(10) NOT NULL,
    `tblItem2id` INT(10) NOT NULL,
    CONSTRAINT `fk_impdetail_receipt` FOREIGN KEY (`tblImportReceipt2id`) REFERENCES `tblImportReceipt2` (`id`) ON DELETE CASCADE,
    CONSTRAINT `fk_impdetail_item` FOREIGN KEY (`tblItem2id`) REFERENCES `tblItem2` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ====================================================================
-- NẠP DỮ LIỆU MẪU KHỚP 100% VỚI WIREFRAME HÌNH 5.3 TRONG BÁO CÁO
-- Khoảng ngày thống kê: 01/10/2026 - 31/10/2026
-- Tổng doanh thu: 8.040.000 VNĐ
-- Sữa chua Vinamilk: 250 hộp = 2.000.000 VNĐ (qua HD01, HD03, HD07)
-- ====================================================================

INSERT INTO `tblMember2` (`id`, `username`, `password`, `fullName`, `address`, `email`, `phone`) VALUES
(1, 'quanli1', '123456', 'Nguyễn Đức Mạnh', 'Số 128 Trần Phú, Hà Đông, Hà Nội', 'quanli@shopman.vn', '0987654321'),
(2, 'banhang1', '123456', 'Phạm Thu Hà', 'Thanh Xuân, Hà Nội', 'banhang@shopman.vn', '0911223344'),
(3, 'nguyenvanan', '123456', 'Nguyễn Văn An', '12 Nguyễn Trãi, Thanh Xuân, Hà Nội', 'an.nguyen@gmail.com', '0912345678'),
(4, 'tranthibinh', '123456', 'Trần Thị Bình', 'Cầu Giấy, Hà Nội', 'binh.tran@gmail.com', '0922334455'),
(5, 'levancuong', '123456', 'Lê Văn Cường', 'Đống Đa, Hà Nội', 'cuong.le@gmail.com', '0933445566');

INSERT INTO `tblEmployee2` (`tblMember2id`, `employeeCode`, `position`) VALUES
(1, 'NV001', 'Quản lí'),
(2, 'NV002', 'Bán hàng');

INSERT INTO `tblCustomer2` (`tblMember2id`, `customerCode`) VALUES
(3, 'KH001'),
(4, 'KH002'),
(5, 'KH003');

INSERT INTO `tblSupplier2` (`id`, `supplierCode`, `name`, `address`, `phone`, `email`, `description`) VALUES
(1, 'NCC01', 'Công ty Cổ phần Sữa Việt Nam (Vinamilk)', 'Số 10 Tân Trào, Q.7, TP.HCM', '02854155555', 'vinamilk@vinamilk.com.vn', 'Nhà cung cấp sữa và các sản phẩm từ sữa'),
(2, 'NCC02', 'Công ty Cổ phần Acecook Việt Nam', 'KCN Tân Bình, Tân Phú, TP.HCM', '02838154064', 'acecook@acecookvietnam.com', 'Nhà cung cấp mì ăn liền Hảo Hảo'),
(3, 'NCC03', 'Công ty TNHH La Vie', 'Quốc lộ 1A, Tân An, Long An', '02723826222', 'lavie@waters.nestle.com', 'Nhà cung cấp nước khoáng thiên nhiên Lavie');

INSERT INTO `tblItem2` (`id`, `itemCode`, `name`, `unit`, `price`, `stockQuantity`, `description`) VALUES
(1, 'MH01', 'Sữa chua Vinamilk', 'Hộp', 8000, 500, 'Sữa chua có đường Vinamilk lốc 4 hộp'),
(2, 'MH02', 'Mì Hảo Hảo Tôm cay', 'Gói', 4500, 1000, 'Mì ăn liền Hảo Hảo hương vị tôm chua cay'),
(3, 'MH03', 'Nước khoáng Lavie', 'Chai', 5000, 800, 'Nước khoáng thiên nhiên Lavie 500ml'),
(4, 'MH04', 'Bánh Cosy mè giòn', 'Hộp', 18000, 300, 'Bánh quy bơ mè giòn Cosy hộp 240g'),
(5, 'MH05', 'Dầu ăn Simply 1L', 'Chai', 52000, 200, 'Dầu đậu nành nguyên chất Simply chai 1 lít');

INSERT INTO `tblInvoice2` (`id`, `invoiceCode`, `createdDate`, `deliveryAddress`, `status`, `deliveryStaffName`, `tblCustomer2id`, `tblEmployee2id`) VALUES
(1, 'HD01', '2026-10-05', '12 Nguyễn Trãi, Thanh Xuân, Hà Nội', 'Hoàn thành', 'Hoàng Văn Nam', 3, 2),
(2, 'HD03', '2026-10-12', 'Cầu Giấy, Hà Nội', 'Hoàn thành', 'Hoàng Văn Nam', 4, 2),
(3, 'HD07', '2026-10-25', 'Đống Đa, Hà Nội', 'Hoàn thành', 'Hoàng Văn Nam', 5, 2),
(4, 'HD09', '2026-10-28', '12 Nguyễn Trãi, Thanh Xuân, Hà Nội', 'Hoàn thành', 'Hoàng Văn Nam', 3, 2),
(5, 'HD10', '2026-10-29', '12 Nguyễn Trãi, Thanh Xuân, Hà Nội', 'Chờ duyệt', NULL, 3, NULL);

INSERT INTO `tblInvoiceDetail2` (`id`, `quantity`, `unitPrice`, `tblInvoice2id`, `tblItem2id`) VALUES
(1, 50, 8000, 1, 1),   -- HD01: 50 hộp Sữa chua = 400.000 VNĐ
(2, 100, 8000, 2, 1),  -- HD03: 100 hộp Sữa chua = 800.000 VNĐ
(3, 100, 8000, 3, 1),  -- HD07: 100 hộp Sữa chua = 800.000 VNĐ -> Tổng Sữa chua = 250 hộp = 2.000.000 VNĐ
(4, 400, 4500, 4, 2),  -- HD09: 400 gói Mì Hảo Hảo = 1.800.000 VNĐ
(5, 300, 5000, 4, 3),  -- HD09: 300 chai Lavie = 1.500.000 VNĐ
(6, 80, 18000, 4, 4),  -- HD09: 80 hộp Cosy = 1.440.000 VNĐ
(7, 25, 52000, 4, 5),  -- HD09: 25 chai Simply = 1.300.000 VNĐ -> Tổng doanh thu = 8.040.000 VNĐ
(8, 20, 8000, 5, 1);   -- HD10: 20 hộp Sữa chua Vinamilk (Chờ duyệt: lọc bỏ, không cộng vào doanh thu)

INSERT INTO `tblImportReceipt2` (`id`, `receiptCode`, `importDate`, `tblEmployee2id`, `tblSupplier2id`) VALUES
(1, 'PN01', '2026-09-28', 1, 1),
(2, 'PN02', '2026-10-01', 1, 2);

INSERT INTO `tblImportReceiptDetail2` (`id`, `quantity`, `importPrice`, `tblImportReceipt2id`, `tblItem2id`) VALUES
(1, 600, 6500, 1, 1),
(2, 1200, 3800, 2, 2);
```

## 2. Tầng DAO (Data Access Object)

### Tệp: `src/dao/DAO2.java`
*Lớp cha dùng chung quản lý kết nối MySQL Connection*

```java
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DAO2 {
    public static Connection con;

    public DAO2() {
        try {
            if (con == null || con.isClosed() || !con.isValid(2)) {
                String dbUrl = "jdbc:mysql://localhost:3306/db_shopman2?useSSL=false&allowPublicKeyRetrieval=true&characterEncoding=UTF-8&serverTimezone=Asia/Ho_Chi_Minh";
                String dbClass = "com.mysql.cj.jdbc.Driver";
                Class.forName(dbClass);
                try {
                    con = DriverManager.getConnection(dbUrl, "root", "");
                } catch (Exception e) {
                    con = DriverManager.getConnection(dbUrl, "root", "root");
                }
            }
        } catch (Exception ex) {
            System.err.println("Database connection failed in DAO2: " + ex.getMessage());
        }
    }
}
```

### Tệp: `src/dao/MemberDAO2.java`
*Xử lý kiểm tra trùng lặp thành viên và kiểm tra đăng nhập*

```java
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Customer2;
import model.Manager2;
import model.Member2;
import model.SalesStaff2;

public class MemberDAO2 extends DAO2 {
    public MemberDAO2() {
        super();
    }

    /**
     * Kiem tra tinh duy nhat cua username hoac email trong he thong.
     * @param username Ten dang nhap can kiem tra
     * @param email Email can kiem tra
     * @return true neu da ton tai (trung), false neu hop le (chua ton tai)
     */
    public boolean checkExistingMember(String username, String email) {
        String sql = "SELECT id FROM tblMember2 WHERE username = ? OR email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Kiem tra dang nhap va phan quyen tac nhan (Customer / Manager / SalesStaff).
     * @param username Ten dang nhap
     * @param password Mat khau
     * @return Doi tuong Member2 cu the (Manager2, SalesStaff2 hoac Customer2), hoac null neu sai thong tin
     */
    public Member2 checkLogin(String username, String password) {
        if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
            return null;
        }
        String sql = "SELECT m.*, c.customerCode, e.employeeCode, e.position "
                   + "FROM tblMember2 m "
                   + "LEFT JOIN tblCustomer2 c ON m.id = c.tblMember2id "
                   + "LEFT JOIN tblEmployee2 e ON m.id = e.tblMember2id "
                   + "WHERE m.username = ? AND m.password = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String position = rs.getString("position");
                Member2 member;
                if ("Quản lí".equals(position)) {
                    Manager2 mgr = new Manager2();
                    mgr.setEmployeeCode(rs.getString("employeeCode"));
                    mgr.setPosition(position);
                    member = mgr;
                } else if ("Bán hàng".equals(position)) {
                    SalesStaff2 staff = new SalesStaff2();
                    staff.setEmployeeCode(rs.getString("employeeCode"));
                    staff.setPosition(position);
                    member = staff;
                } else {
                    Customer2 cust = new Customer2();
                    cust.setCustomerCode(rs.getString("customerCode"));
                    member = cust;
                }
                member.setId(rs.getInt("id"));
                member.setUsername(rs.getString("username"));
                member.setFullName(rs.getString("fullName"));
                member.setAddress(rs.getString("address"));
                member.setEmail(rs.getString("email"));
                member.setPhone(rs.getString("phone"));
                return member;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
```

### Tệp: `src/dao/CustomerDAO2.java`
*Lưu khách hàng mới với Transaction 2 bảng tblMember2 và tblCustomer2*

```java
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import model.Customer2;

public class CustomerDAO2 extends DAO2 {
    public CustomerDAO2() {
        super();
    }

    /**
     * Luu thong tin khach hang vao 2 bang tblMember2 va tblCustomer2 voi Transaction.
     * @param customer Doi tuong Customer2 can luu
     * @return true neu luu thanh cong, false neu that bai
     */
    public boolean saveCustomer(Customer2 customer) {
        String sqlMember = "INSERT INTO tblMember2 (username, password, fullName, address, email, phone) VALUES (?, ?, ?, ?, ?, ?)";
        String sqlCustomer = "INSERT INTO tblCustomer2 (tblMember2id, customerCode) VALUES (?, ?)";

        boolean originalAutoCommit = true;
        try {
            originalAutoCommit = con.getAutoCommit();
            con.setAutoCommit(false);

            PreparedStatement psMember = con.prepareStatement(sqlMember, Statement.RETURN_GENERATED_KEYS);
            psMember.setString(1, customer.getUsername());
            psMember.setString(2, customer.getPassword());
            psMember.setString(3, customer.getFullName());
            psMember.setString(4, customer.getAddress());
            psMember.setString(5, customer.getEmail());
            psMember.setString(6, customer.getPhone());
            psMember.executeUpdate();

            ResultSet rs = psMember.getGeneratedKeys();
            int memberId = 0;
            if (rs.next()) {
                memberId = rs.getInt(1);
                customer.setId(memberId);
            }

            // Sinh ma customerCode neu chua co: KH + 3 chu so (KH001, KH002...)
            if (customer.getCustomerCode() == null || customer.getCustomerCode().trim().isEmpty()) {
                customer.setCustomerCode("KH" + String.format("%03d", memberId));
            }

            PreparedStatement psCustomer = con.prepareStatement(sqlCustomer);
            psCustomer.setInt(1, memberId);
            psCustomer.setString(2, customer.getCustomerCode());
            psCustomer.executeUpdate();

            con.commit();
            return true;
        } catch (Exception e) {
            try {
                con.rollback();
            } catch (Exception ex) {
                // Bo qua ngoai le khi rollback
            }
            return false;
        } finally {
            try {
                con.setAutoCommit(originalAutoCommit);
            } catch (Exception e) {
                // Bo qua
            }
        }
    }
}
```

### Tệp: `src/dao/ItemRevenueStatDAO2.java`
*Thống kê mặt hàng theo doanh thu giảm dần trong khoảng thời gian*

```java
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ItemRevenueStat2;

public class ItemRevenueStatDAO2 extends DAO2 {
    public ItemRevenueStatDAO2() {
        super();
    }

    /**
     * Lay danh sach thong ke mat hang theo doanh thu giam dan trong khoang thoi gian [startDate, endDate].
     * @param startDate Ngay bat dau
     * @param endDate Ngay ket thuc
     * @return Danh sach ItemRevenueStat2 sap xep giam dan theo totalRevenue
     */
    public List<ItemRevenueStat2> getItemRevenueStat(java.util.Date startDate, java.util.Date endDate) {
        List<ItemRevenueStat2> list = new ArrayList<>();
        if (startDate == null || endDate == null || startDate.after(endDate)) {
            return list;
        }

        String sql = "SELECT i.id, i.itemCode, i.name, i.unit, i.price, i.stockQuantity, i.description, "
                   + "       SUM(d.quantity) AS totalQuantitySold, "
                   + "       SUM(d.quantity * d.unitPrice) AS totalRevenue "
                   + "FROM tblItem2 i "
                   + "JOIN tblInvoiceDetail2 d ON i.id = d.tblItem2id "
                   + "JOIN tblInvoice2 inv ON d.tblInvoice2id = inv.id "
                   + "WHERE inv.createdDate BETWEEN ? AND ? "
                   + "  AND inv.status = 'Hoàn thành' "
                   + "GROUP BY i.id, i.itemCode, i.name, i.unit, i.price, i.stockQuantity, i.description "
                   + "ORDER BY totalRevenue DESC";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, new Date(startDate.getTime()));
            ps.setDate(2, new Date(endDate.getTime()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ItemRevenueStat2 item = new ItemRevenueStat2();
                item.setId(rs.getInt("id"));
                item.setItemCode(rs.getString("itemCode"));
                item.setName(rs.getString("name"));
                item.setUnit(rs.getString("unit"));
                item.setPrice(rs.getFloat("price"));
                item.setStockQuantity(rs.getInt("stockQuantity"));
                item.setDescription(rs.getString("description"));
                item.setTotalQuantitySold(rs.getInt("totalQuantitySold"));
                item.setTotalRevenue(rs.getFloat("totalRevenue"));
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
```

### Tệp: `src/dao/InvoiceDetailDAO2.java`
*Lấy chi tiết các lần giao dịch của mặt hàng theo thời gian tăng dần*

```java
package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Customer2;
import model.Invoice2;
import model.InvoiceDetail2;
import model.Item2;

public class InvoiceDetailDAO2 extends DAO2 {
    public InvoiceDetailDAO2() {
        super();
    }

    public List<InvoiceDetail2> getItemTransactionDetails(String itemCode, java.util.Date startDate, java.util.Date endDate) {
        List<InvoiceDetail2> list = new ArrayList<>();
        if (itemCode == null || startDate == null || endDate == null || startDate.after(endDate)) {
            return list;
        }

        String sql = "SELECT d.id, d.quantity, d.unitPrice, inv.invoiceCode, inv.createdDate, "
                   + "       i.name AS itemName, i.unit AS itemUnit, c.customerCode, m.fullName AS customerName "
                   + "FROM tblInvoiceDetail2 d "
                   + "JOIN tblInvoice2 inv ON d.tblInvoice2id = inv.id "
                   + "JOIN tblItem2 i ON d.tblItem2id = i.id "
                   + "JOIN tblCustomer2 c ON inv.tblCustomer2id = c.tblMember2id "
                   + "JOIN tblMember2 m ON c.tblMember2id = m.id "
                   + "WHERE i.itemCode = ? "
                   + "  AND inv.createdDate BETWEEN ? AND ? "
                   + "  AND inv.status = 'Hoàn thành' "
                   + "ORDER BY inv.createdDate ASC";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, itemCode);
            ps.setDate(2, new Date(startDate.getTime()));
            ps.setDate(3, new Date(endDate.getTime()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer2 cust = new Customer2();
                cust.setCustomerCode(rs.getString("customerCode"));
                cust.setFullName(rs.getString("customerName"));

                Invoice2 inv = new Invoice2();
                inv.setInvoiceCode(rs.getString("invoiceCode"));
                inv.setCreatedDate(rs.getDate("createdDate"));
                inv.setCustomer(cust);

                Item2 item = new Item2();
                item.setItemCode(itemCode);
                item.setName(rs.getString("itemName"));
                item.setUnit(rs.getString("itemUnit"));
                item.setPrice(rs.getFloat("unitPrice"));

                InvoiceDetail2 detail = new InvoiceDetail2();
                detail.setId(rs.getInt("id"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setUnitPrice(rs.getFloat("unitPrice"));
                detail.setItem(item);
                detail.setInvoice(inv);

                list.add(detail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
```

## 3. Tầng Model (Thực thể & Thống kê DTO)

### Tệp: `src/model/Member2.java`
*Lớp thực thể cơ sở Thành viên*

```java
package model;

import java.io.Serializable;

public abstract class Member2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private String username;
    private String password;
    private String fullName;
    private String address;
    private String email;
    private String phone;

    public Member2() {
    }

    public Member2(String username, String password, String fullName, String address, String email, String phone) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
}
```

### Tệp: `src/model/Customer2.java`
*Lớp thực thể Khách hàng kế thừa Member2*

```java
package model;

public class Customer2 extends Member2 {
    private static final long serialVersionUID = 2L;
    private String customerCode;

    public Customer2() {
        super();
    }

    public Customer2(String username, String password, String fullName, String address, String email, String phone, String customerCode) {
        super(username, password, fullName, address, email, phone);
        this.customerCode = customerCode;
    }

    public String getCustomerCode() { return customerCode; }
    public void setCustomerCode(String customerCode) { this.customerCode = customerCode; }
}
```

### Tệp: `src/model/Employee2.java`
*Lớp thực thể Nhân viên kế thừa Member2*

```java
package model;

public abstract class Employee2 extends Member2 {
    private static final long serialVersionUID = 2L;
    private String employeeCode;
    private String position;

    public Employee2() {
        super();
    }

    public String getEmployeeCode() { return employeeCode; }
    public void setEmployeeCode(String employeeCode) { this.employeeCode = employeeCode; }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }
}
```

### Tệp: `src/model/Manager2.java`
*Lớp thực thể Quản lý kế thừa Employee2*

```java
package model;

public class Manager2 extends Employee2 {
    private static final long serialVersionUID = 2L;

    public Manager2() {
        super();
        setPosition("Quản lí");
    }
}
```

### Tệp: `src/model/SalesStaff2.java`
*Lớp thực thể Nhân viên bán hàng kế thừa Employee2*

```java
package model;

public class SalesStaff2 extends Employee2 {
    private static final long serialVersionUID = 2L;

    public SalesStaff2() {
        super();
        setPosition("Bán hàng");
    }
}
```

### Tệp: `src/model/Supplier2.java`
*Lớp thực thể Nhà cung cấp*

```java
package model;

import java.io.Serializable;

public class Supplier2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private String supplierCode;
    private String name;
    private String address;
    private String phone;
    private String email;
    private String description;

    public Supplier2() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getSupplierCode() { return supplierCode; }
    public void setSupplierCode(String supplierCode) { this.supplierCode = supplierCode; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
```

### Tệp: `src/model/Item2.java`
*Lớp thực thể Mặt hàng*

```java
package model;

import java.io.Serializable;

public class Item2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private String itemCode;
    private String name;
    private String unit;
    private float price;
    private int stockQuantity;
    private String description;

    public Item2() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getItemCode() { return itemCode; }
    public void setItemCode(String itemCode) { this.itemCode = itemCode; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public float getPrice() { return price; }
    public void setPrice(float price) { this.price = price; }

    public int getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(int stockQuantity) { this.stockQuantity = stockQuantity; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
```

### Tệp: `src/model/Invoice2.java`
*Lớp thực thể Hóa đơn bán hàng*

```java
package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class Invoice2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private String invoiceCode;
    private Date createdDate;
    private String deliveryAddress;
    private float totalAmount;
    private String status;
    private String deliveryStaffName;
    private Customer2 customer;
    private SalesStaff2 salesStaff;
    private List<InvoiceDetail2> listInvoiceDetail = new ArrayList<>();

    public Invoice2() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getInvoiceCode() { return invoiceCode; }
    public void setInvoiceCode(String invoiceCode) { this.invoiceCode = invoiceCode; }

    public Date getCreatedDate() { return createdDate; }
    public void setCreatedDate(Date createdDate) { this.createdDate = createdDate; }

    public String getDeliveryAddress() { return deliveryAddress; }
    public void setDeliveryAddress(String deliveryAddress) { this.deliveryAddress = deliveryAddress; }

    public float getTotalAmount() { return totalAmount; }
    public void setTotalAmount(float totalAmount) { this.totalAmount = totalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getDeliveryStaffName() { return deliveryStaffName; }
    public void setDeliveryStaffName(String deliveryStaffName) { this.deliveryStaffName = deliveryStaffName; }

    public Customer2 getCustomer() { return customer; }
    public void setCustomer(Customer2 customer) { this.customer = customer; }

    public SalesStaff2 getSalesStaff() { return salesStaff; }
    public void setSalesStaff(SalesStaff2 salesStaff) { this.salesStaff = salesStaff; }

    public List<InvoiceDetail2> getListInvoiceDetail() { return listInvoiceDetail; }
    public void setListInvoiceDetail(List<InvoiceDetail2> listInvoiceDetail) { this.listInvoiceDetail = listInvoiceDetail; }
}
```

### Tệp: `src/model/InvoiceDetail2.java`
*Lớp thực thể Chi tiết hóa đơn*

```java
package model;

import java.io.Serializable;

public class InvoiceDetail2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private int quantity;
    private float unitPrice;
    private Item2 item;
    private Invoice2 invoice;

    public InvoiceDetail2() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public float getUnitPrice() { return unitPrice; }
    public void setUnitPrice(float unitPrice) { this.unitPrice = unitPrice; }

    public Item2 getItem() { return item; }
    public void setItem(Item2 item) { this.item = item; }

    public Invoice2 getInvoice() { return invoice; }
    public void setInvoice(Invoice2 invoice) { this.invoice = invoice; }
}
```

### Tệp: `src/model/ImportReceipt2.java`
*Lớp thực thể Phiếu nhập*

```java
package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class ImportReceipt2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private String receiptCode;
    private Date importDate;
    private Manager2 manager;
    private Supplier2 supplier;
    private List<ImportReceiptDetail2> listImportReceiptDetail = new ArrayList<>();

    public ImportReceipt2() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getReceiptCode() { return receiptCode; }
    public void setReceiptCode(String receiptCode) { this.receiptCode = receiptCode; }

    public Date getImportDate() { return importDate; }
    public void setImportDate(Date importDate) { this.importDate = importDate; }

    public Manager2 getManager() { return manager; }
    public void setManager(Manager2 manager) { this.manager = manager; }

    public Supplier2 getSupplier() { return supplier; }
    public void setSupplier(Supplier2 supplier) { this.supplier = supplier; }

    public List<ImportReceiptDetail2> getListImportReceiptDetail() { return listImportReceiptDetail; }
    public void setListImportReceiptDetail(List<ImportReceiptDetail2> listImportReceiptDetail) { this.listImportReceiptDetail = listImportReceiptDetail; }
}
```

### Tệp: `src/model/ImportReceiptDetail2.java`
*Lớp thực thể Chi tiết phiếu nhập*

```java
package model;

import java.io.Serializable;

public class ImportReceiptDetail2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private int quantity;
    private float importPrice;
    private Item2 item;
    private ImportReceipt2 importReceipt;

    public ImportReceiptDetail2() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public float getImportPrice() { return importPrice; }
    public void setImportPrice(float importPrice) { this.importPrice = importPrice; }

    public Item2 getItem() { return item; }
    public void setItem(Item2 item) { this.item = item; }

    public ImportReceipt2 getImportReceipt() { return importReceipt; }
    public void setImportReceipt(ImportReceipt2 importReceipt) { this.importReceipt = importReceipt; }
}
```

### Tệp: `src/model/ItemRevenueStat2.java`
*Lớp thống kê mặt hàng theo doanh thu kế thừa Item2*

```java
package model;

public class ItemRevenueStat2 extends Item2 {
    private static final long serialVersionUID = 2L;
    private int totalQuantitySold;
    private float totalRevenue;

    public ItemRevenueStat2() {
        super();
    }

    public int getTotalQuantitySold() { return totalQuantitySold; }
    public void setTotalQuantitySold(int totalQuantitySold) { this.totalQuantitySold = totalQuantitySold; }

    public float getTotalRevenue() { return totalRevenue; }
    public void setTotalRevenue(float totalRevenue) { this.totalRevenue = totalRevenue; }
}
```

### Tệp: `src/model/ItemImportStat2.java`
*Lớp thống kê hàng nhập kế thừa Item2*

```java
package model;

public class ItemImportStat2 extends Item2 {
    private static final long serialVersionUID = 2L;
    private int totalQuantityImported;
    private float totalImportAmount;

    public ItemImportStat2() {
        super();
    }

    public int getTotalQuantityImported() { return totalQuantityImported; }
    public void setTotalQuantityImported(int totalQuantityImported) { this.totalQuantityImported = totalQuantityImported; }

    public float getTotalImportAmount() { return totalImportAmount; }
    public void setTotalImportAmount(float totalImportAmount) { this.totalImportAmount = totalImportAmount; }
}
```

### Tệp: `src/model/CustomerStat2.java`
*Lớp thống kê khách hàng kế thừa Customer2*

```java
package model;

public class CustomerStat2 extends Customer2 {
    private static final long serialVersionUID = 2L;
    private int totalInvoices;
    private float totalAmount;

    public CustomerStat2() {
        super();
    }

    public int getTotalInvoices() { return totalInvoices; }
    public void setTotalInvoices(int totalInvoices) { this.totalInvoices = totalInvoices; }

    public float getTotalAmount() { return totalAmount; }
    public void setTotalAmount(float totalAmount) { this.totalAmount = totalAmount; }
}
```

### Tệp: `src/model/SupplierStat2.java`
*Lớp thống kê nhà cung cấp kế thừa Supplier2*

```java
package model;

public class SupplierStat2 extends Supplier2 {
    private static final long serialVersionUID = 2L;
    private int totalImports;
    private float totalImportValue;

    public SupplierStat2() {
        super();
    }

    public int getTotalImports() { return totalImports; }
    public void setTotalImports(int totalImports) { this.totalImports = totalImports; }

    public float getTotalImportValue() { return totalImportValue; }
    public void setTotalImportValue(float totalImportValue) { this.totalImportValue = totalImportValue; }
}
```

## 4. Tầng Kiểm thử Đơn vị JUnit (Unit Test Tuần 7)

### Tệp: `src/test/MemberDAO2Test.java`
*Kiểm thử đơn vị MemberDAO2 (trùng username, trùng email, dữ liệu mới)*

```java
package test;

import dao.MemberDAO2;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class MemberDAO2Test {
    private MemberDAO2 memberDAO;

    @Before
    public void setUp() {
        memberDAO = new MemberDAO2();
    }

    @Test
    public void testCheckExistingMember_TrungUsername() {
        // Truong hop username da ton tai trong CSDL ('nguyenvanan')
        boolean existed = memberDAO.checkExistingMember("nguyenvanan", "email_hoan_toan_moi_999@gmail.com");
        Assert.assertTrue("Phai phat hien username da ton tai", existed);
    }

    @Test
    public void testCheckExistingMember_TrungEmail() {
        // Truong hop email da ton tai trong CSDL ('an.nguyen@gmail.com')
        boolean existed = memberDAO.checkExistingMember("user_hoan_toan_moi_999", "an.nguyen@gmail.com");
        Assert.assertTrue("Phai phat hien email da ton tai", existed);
    }

    @Test
    public void testCheckExistingMember_ChuaTonTai() {
        // Truong hop ca username va email deu chua ton tai trong CSDL
        boolean existed = memberDAO.checkExistingMember("user_chua_ton_tai_12345", "email_chua_ton_tai_12345@gmail.com");
        Assert.assertFalse("Chua ton tai thi phai tra ve false", existed);
    }
}
```

### Tệp: `src/test/CustomerDAO2Test.java`
*Kiểm thử đơn vị CustomerDAO2 (lưu thành công, rollback khi lỗi)*

```java
package test;

import dao.CustomerDAO2;
import dao.DAO2;
import model.Customer2;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerDAO2Test {
    private CustomerDAO2 customerDAO;

    @Before
    public void setUp() {
        customerDAO = new CustomerDAO2();
    }

    @Test
    public void testSaveCustomer_ThanhCong() {
        String uniqueSuffix = String.valueOf(System.currentTimeMillis() % 100000);
        String uniqueUser = "test_user_" + uniqueSuffix;
        String uniqueEmail = "test_" + uniqueSuffix + "@gmail.com";

        Customer2 customer = new Customer2(
            uniqueUser,
            "MatKhau@123",
            "Nguyễn Văn Thử Nghiệm",
            "Số 10 Phố Xốm, Hà Đông, Hà Nội",
            uniqueEmail,
            "0987654321",
            null
        );

        try {
            boolean success = customerDAO.saveCustomer(customer);
            Assert.assertTrue("Lưu khách hàng mới phải thành công", success);
            Assert.assertTrue("Id sinh ra phải lớn hơn 0", customer.getId() > 0);
            Assert.assertNotNull("customerCode phải được sinh ra", customer.getCustomerCode());
            Assert.assertTrue("customerCode phải bắt đầu bằng KH", customer.getCustomerCode().startsWith("KH"));

            // Kiểm tra trực tiếp trong CSDL
            PreparedStatement ps = DAO2.con.prepareStatement("SELECT * FROM tblMember2 WHERE username = ?");
            ps.setString(1, uniqueUser);
            ResultSet rs = ps.executeQuery();
            Assert.assertTrue("Phải tìm thấy bản ghi vừa insert trong tblMember2", rs.next());
            Assert.assertEquals("Nguyễn Văn Thử Nghiệm", rs.getString("fullName"));

        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail("Xảy ra ngoại lệ trong testSaveCustomer_ThanhCong: " + e.getMessage());
        } finally {
            // Dọn dẹp dữ liệu test để bảo đảm môi trường CSDL sạch sẽ
            try {
                PreparedStatement psDel = DAO2.con.prepareStatement("DELETE FROM tblMember2 WHERE username LIKE 'test_user_%'");
                psDel.executeUpdate();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    @Test
    public void testSaveCustomer_ThatBaiDoTrungUsername() {
        // Username 'nguyenvanan' da ton tai trong CSDL
        Customer2 customer = new Customer2(
            "nguyenvanan",
            "123456",
            "Trùng Tên Đăng Nhập",
            "Hà Nội",
            "email_khac_123@gmail.com",
            "0911222333",
            null
        );

        boolean success = customerDAO.saveCustomer(customer);
        Assert.assertFalse("Luu bi trung username phai that bai va tra ve false", success);
    }
}
```

### Tệp: `src/test/ItemRevenueStatDAO2Test.java`
*Kiểm thử đơn vị ItemRevenueStatDAO2 (chuẩn Wireframe, khoảng trống)*

```java
package test;

import dao.ItemRevenueStatDAO2;
import model.ItemRevenueStat2;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ItemRevenueStatDAO2Test {
    private ItemRevenueStatDAO2 statDAO;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Before
    public void setUp() {
        statDAO = new ItemRevenueStatDAO2();
    }

    @Test
    public void testGetItemRevenueStat_Chuan() throws Exception {
        Date startDate = sdf.parse("2026-10-01");
        Date endDate = sdf.parse("2026-10-31");

        List<ItemRevenueStat2> list = statDAO.getItemRevenueStat(startDate, endDate);
        Assert.assertNotNull("Ket qua thong ke khong duoc null", list);
        Assert.assertEquals("Phai co dung 5 mat hang co doanh thu theo Wireframe Hinh 5.3", 5, list.size());

        // Kiem tra sap xep giam dan theo doanh thu
        for (int i = 0; i < list.size() - 1; i++) {
            Assert.assertTrue("Doanh thu phai sap xep giam dan",
                list.get(i).getTotalRevenue() >= list.get(i + 1).getTotalRevenue());
        }

        // Mat hang dung dau doanh thu cao nhat phai la MH01 (Sua chua Vinamilk)
        ItemRevenueStat2 top1 = list.get(0);
        Assert.assertEquals("MH01", top1.getItemCode());
        Assert.assertEquals("Sữa chua Vinamilk", top1.getName());
        Assert.assertEquals(250, top1.getTotalQuantitySold());
        Assert.assertEquals(2000000.0f, top1.getTotalRevenue(), 0.01f);

        // Tong doanh thu phai la 8.040.000 VND
        float grandTotal = 0;
        for (ItemRevenueStat2 item : list) {
            grandTotal += item.getTotalRevenue();
        }
        Assert.assertEquals(8040000.0f, grandTotal, 0.01f);
    }

    @Test
    public void testGetItemRevenueStat_KhongCoGiaoDich() throws Exception {
        Date startDate = sdf.parse("2025-01-01");
        Date endDate = sdf.parse("2025-01-31");

        List<ItemRevenueStat2> list = statDAO.getItemRevenueStat(startDate, endDate);
        Assert.assertNotNull("Ket qua khong duoc null", list);
        Assert.assertEquals("Khoang thoi gian khong co giao dich phai tra ve danh sach rong", 0, list.size());
    }

    @Test
    public void testGetItemRevenueStat_NgayBatDauLonHonNgayKetThuc() throws Exception {
        Date startDate = sdf.parse("2026-10-31");
        Date endDate = sdf.parse("2026-10-01");

        List<ItemRevenueStat2> list = statDAO.getItemRevenueStat(startDate, endDate);
        Assert.assertNotNull("Ket qua khong duoc null", list);
        Assert.assertEquals("Khoang thoi gian nguoc phai tra ve danh sach rong", 0, list.size());
    }
}
```

### Tệp: `src/test/InvoiceDetailDAO2Test.java`
*Kiểm thử đơn vị InvoiceDetailDAO2 (chi tiết giao dịch MH01, kiểm tra thứ tự)*

```java
package test;

import dao.InvoiceDetailDAO2;
import model.InvoiceDetail2;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class InvoiceDetailDAO2Test {
    private InvoiceDetailDAO2 detailDAO;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Before
    public void setUp() {
        detailDAO = new InvoiceDetailDAO2();
    }

    @Test
    public void testGetItemTransactionDetails_Chuan() throws Exception {
        Date startDate = sdf.parse("2026-10-01");
        Date endDate = sdf.parse("2026-10-31");

        List<InvoiceDetail2> list = detailDAO.getItemTransactionDetails("MH01", startDate, endDate);
        Assert.assertNotNull("Danh sach chi tiet giao dich khong duoc null", list);
        Assert.assertEquals("Mat hang MH01 phai co dung 3 lan giao dich hoan thanh theo Wireframe Hinh 5.3", 3, list.size());

        // Kiem tra lan giao dich dau tien: HD01 ngay 2026-10-05
        InvoiceDetail2 firstTrans = list.get(0);
        Assert.assertEquals("HD01", firstTrans.getInvoice().getInvoiceCode());
        Assert.assertEquals("KH001", firstTrans.getInvoice().getCustomer().getCustomerCode());
        Assert.assertEquals("Nguyễn Văn An", firstTrans.getInvoice().getCustomer().getFullName());
        Assert.assertEquals(50, firstTrans.getQuantity());
        Assert.assertEquals(8000.0f, firstTrans.getUnitPrice(), 0.01f);
        Assert.assertEquals("Sữa chua Vinamilk", firstTrans.getItem().getName());

        // Kiem tra tong so luong ban = 250 va tong doanh thu = 2.000.000 VND
        int totalQty = 0;
        float totalRev = 0;
        for (InvoiceDetail2 d : list) {
            totalQty += d.getQuantity();
            totalRev += d.getQuantity() * d.getUnitPrice();
        }
        Assert.assertEquals(250, totalQty);
        Assert.assertEquals(2000000.0f, totalRev, 0.01f);

        // Kiem tra thu tu thoi gian tang dan
        for (int i = 0; i < list.size() - 1; i++) {
            Date d1 = list.get(i).getInvoice().getCreatedDate();
            Date d2 = list.get(i + 1).getInvoice().getCreatedDate();
            Assert.assertTrue("Thu tu giao dich phai tang dan theo thoi gian", !d1.after(d2));
        }
    }

    @Test
    public void testGetItemTransactionDetails_KhongCoGiaoDich() throws Exception {
        Date startDate = sdf.parse("2025-01-01");
        Date endDate = sdf.parse("2025-01-31");

        List<InvoiceDetail2> list = detailDAO.getItemTransactionDetails("MH01", startDate, endDate);
        Assert.assertNotNull("Ket qua khong duoc null", list);
        Assert.assertEquals("Khong co giao dich phai tra ve rong", 0, list.size());
    }

    @Test
    public void testGetItemTransactionDetails_MaMatHangKhongTonTai() throws Exception {
        Date startDate = sdf.parse("2026-10-01");
        Date endDate = sdf.parse("2026-10-31");

        List<InvoiceDetail2> list = detailDAO.getItemTransactionDetails("MH999_UNKNOWN", startDate, endDate);
        Assert.assertNotNull("Ket qua khong duoc null", list);
        Assert.assertEquals("Ma mat hang khong ton tai phai tra ve rong", 0, list.size());
    }
}
```

### Tệp: `src/test/TestRunner.java`
*Class thực thi tập trung toàn bộ 11 Unit Test Cases JUnit 4*

```java
package test;

import org.junit.runner.JUnitCore;
import org.junit.runner.Result;
import org.junit.runner.notification.Failure;

public class TestRunner {
    public static void main(String[] args) {
        System.out.println("=================================================");
        System.out.println("BAT DAU CHAY TOAN BO TEST CASE KIEM THU DON VI");
        System.out.println("=================================================");

        Class<?>[] testClasses = new Class<?>[] {
            MemberDAO2Test.class,
            CustomerDAO2Test.class,
            ItemRevenueStatDAO2Test.class,
            InvoiceDetailDAO2Test.class
        };

        int totalTests = 0;
        int totalFailures = 0;
        long startTime = System.currentTimeMillis();

        for (Class<?> testClass : testClasses) {
            System.out.println("\n>>> Chay test suite: " + testClass.getSimpleName() + "...");
            Result result = JUnitCore.runClasses(testClass);
            totalTests += result.getRunCount();
            totalFailures += result.getFailureCount();

            System.out.println("    - So luong test cases: " + result.getRunCount());
            System.out.println("    - So luong thanh cong: " + (result.getRunCount() - result.getFailureCount()));
            System.out.println("    - So luong that bai:   " + result.getFailureCount());
            System.out.println("    - Thoi gian chay:      " + result.getRunTime() + " ms");

            if (!result.wasSuccessful()) {
                System.out.println("    [!] CHI TIET LOI:");
                for (Failure failure : result.getFailures()) {
                    System.out.println("        + " + failure.toString());
                }
            } else {
                System.out.println("    [OK] TAT CA TEST CASES TRONG SUITE DEU PASS 100%!");
            }
        }

        long totalTime = System.currentTimeMillis() - startTime;
        System.out.println("\n=================================================");
        System.out.println("TONG KET KET QUA KIEM THU DON VI UNIT TEST (TUAN 7)");
        System.out.println("=================================================");
        System.out.println("Tong so test cases da thuc thi: " + totalTests);
        System.out.println("Tong so test cases PASS:        " + (totalTests - totalFailures));
        System.out.println("Tong so test cases FAILED:      " + totalFailures);
        System.out.println("Ti le thanh cong:               " + (totalTests > 0 ? ((totalTests - totalFailures) * 100 / totalTests) : 0) + "%");
        System.out.println("Tong thoi gian thuc thi:        " + totalTime + " ms");
        System.out.println("=================================================");
    }
}
```

## 5. Tầng Giao diện & Điều khiển JSP (View & Controller)

### Tệp: `WebContent/index.jsp`
*Cổng điều hướng tổng quan hệ thống ShopMan*

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopMan - Hệ thống Quản lý Bách hóa Trực tuyến</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <header>
        <div class="header-content">
            <div class="brand-title">ShopMan</div>
            <div class="user-info">Cổng thông tin hệ thống</div>
        </div>
    </header>

    <main>
        <div class="card" style="max-width: 680px; margin: 3rem auto; text-align: center;">
            <h2 class="card-title" style="border: none; margin-bottom: 0.75rem;">Hệ thống Quản lý Bách hóa Trực tuyến</h2>
            <p style="color: var(--text-muted); margin-bottom: 2rem; font-size: 0.95rem;">
                Lựa chọn phân hệ làm việc tương ứng:
            </p>

            <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 1.5rem; text-align: left;">
                <div style="border: 1px solid var(--border); border-radius: 6px; padding: 1.5rem; background: #ffffff;">
                    <h3 style="font-size: 1.05rem; margin-bottom: 0.5rem; color: var(--text);">Khách hàng</h3>
                    <p style="font-size: 0.85rem; color: var(--text-muted); margin-bottom: 1.25rem;">
                        Đăng ký tài khoản thành viên mới và theo dõi mua sắm.
                    </p>
                    <a href="view/thanhvien/CustomerHomeFrm2.jsp" class="btn btn-primary" style="width: 100%;">
                        Trang chủ Khách hàng
                    </a>
                </div>

                <div style="border: 1px solid var(--border); border-radius: 6px; padding: 1.5rem; background: #ffffff;">
                    <h3 style="font-size: 1.05rem; margin-bottom: 0.5rem; color: var(--text);">Quản lý</h3>
                    <p style="font-size: 0.85rem; color: var(--text-muted); margin-bottom: 1.25rem;">
                        Tra cứu báo cáo thống kê doanh thu mặt hàng và giao dịch.
                    </p>
                    <a href="view/quanli/ManagerHomeFrm2.jsp" class="btn btn-primary" style="width: 100%;">
                        Trang Quản lý
                    </a>
                </div>
            </div>
        </div>
    </main>

    <footer>
        <p>ShopMan - Hệ thống Quản lý Bách hóa Trực tuyến</p>
    </footer>
</body>
</html>
```

### Tệp: `WebContent/view/thanhvien/CustomerHomeFrm2.jsp`
*Trang chủ khách hàng vãng lai*

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopMan - Trang chủ Khách hàng</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <header>
        <div class="header-content">
            <div class="brand-title">ShopMan</div>
            <div class="user-info">
                Khách vãng lai | 
                <a href="RegisterMemberFrm2.jsp" id="subRegister">Đăng ký thành viên</a> |
                <a href="LoginFrm2.jsp">Đăng nhập</a>
            </div>
        </div>
    </header>

    <main>
        <div class="card" style="text-align: center; padding: 3rem 1.5rem; max-width: 600px; margin: 2rem auto;">
            <h2 class="card-title" style="border: none; margin-bottom: 0.75rem;">Trang chủ Khách hàng</h2>
            <p style="color: var(--text-muted); margin-bottom: 2rem; font-size: 0.95rem;">
                Hệ thống bán lẻ bách hóa trực tuyến. Vui lòng đăng ký tài khoản thành viên để bắt đầu đặt hàng.
            </p>
            <div style="display: flex; justify-content: center; gap: 1rem;">
                <a href="RegisterMemberFrm2.jsp" class="btn btn-primary" id="subRegisterBtn">
                    Đăng ký thành viên mới
                </a>
                <a href="../../index.jsp" class="btn btn-outline">
                    Quay lại
                </a>
            </div>
        </div>
    </main>

    <footer>
        <p>ShopMan - Cổng Khách hàng</p>
    </footer>
</body>
</html>
```

### Tệp: `WebContent/view/thanhvien/RegisterMemberFrm2.jsp`
*Giao diện biểu mẫu đăng ký thành viên mới*

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Customer2" %>
<%
    Customer2 customer = (Customer2) request.getAttribute("customer");
    if (customer == null) {
        customer = new Customer2();
        customer.setUsername("");
        customer.setFullName("");
        customer.setEmail("");
        customer.setPhone("");
        customer.setAddress("");
    }
    String outMessage = (String) request.getAttribute("outMessage");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopMan - Đăng ký tài khoản thành viên</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
    <script>
        function validateClient() {
            var fullName = document.getElementById("inFullName").value.trim();
            var username = document.getElementById("inUsername").value.trim();
            var password = document.getElementById("inPassword").value;
            var phone = document.getElementById("inPhone").value.trim();
            var email = document.getElementById("inEmail").value.trim();
            var address = document.getElementById("inAddress").value.trim();

            if (fullName === "" || username === "" || password === "" || phone === "" || email === "" || address === "") {
                alert("Vui lòng điền đầy đủ tất cả thông tin bắt buộc!");
                return false;
            }
            if (!email.includes("@") || !email.includes(".")) {
                alert("Định dạng email không hợp lệ!");
                return false;
            }
            if (phone.length < 9 || phone.length > 12 || isNaN(phone)) {
                alert("Số điện thoại không hợp lệ (9-12 chữ số)!");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="brand-title">ShopMan</div>
            <div class="user-info">
                <a href="CustomerHomeFrm2.jsp">Trang chủ</a>
            </div>
        </div>
    </header>

    <main>
        <div class="card" style="max-width: 580px; margin: 1.5rem auto;">
            <h2 class="card-title">Đăng ký thành viên</h2>

            <% if (outMessage != null && !outMessage.trim().isEmpty()) { %>
                <div class="alert alert-danger" id="outMessage">
                    <%= outMessage %>
                </div>
            <% } %>

            <form action="doRegisterMember2.jsp" method="post" onsubmit="return validateClient();">
                <div class="form-group">
                    <label for="inFullName">Họ và tên: <span style="color: var(--danger);">*</span></label>
                    <input type="text" id="inFullName" name="inFullName" class="form-control" 
                           value="<%= customer.getFullName() != null ? customer.getFullName() : "" %>" required>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label for="inUsername">Tên đăng nhập: <span style="color: var(--danger);">*</span></label>
                        <input type="text" id="inUsername" name="inUsername" class="form-control" 
                               value="<%= customer.getUsername() != null ? customer.getUsername() : "" %>" required>
                    </div>

                    <div class="form-group">
                        <label for="inPassword">Mật khẩu: <span style="color: var(--danger);">*</span></label>
                        <input type="password" id="inPassword" name="inPassword" class="form-control" required>
                    </div>
                </div>

                <div class="form-grid">
                    <div class="form-group">
                        <label for="inPhone">Số điện thoại: <span style="color: var(--danger);">*</span></label>
                        <input type="text" id="inPhone" name="inPhone" class="form-control" 
                               value="<%= customer.getPhone() != null ? customer.getPhone() : "" %>" required>
                    </div>

                    <div class="form-group">
                        <label for="inEmail">Email: <span style="color: var(--danger);">*</span></label>
                        <input type="email" id="inEmail" name="inEmail" class="form-control" 
                               value="<%= customer.getEmail() != null ? customer.getEmail() : "" %>" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="inAddress">Địa chỉ: <span style="color: var(--danger);">*</span></label>
                    <input type="text" id="inAddress" name="inAddress" class="form-control" 
                           value="<%= customer.getAddress() != null ? customer.getAddress() : "" %>" required>
                </div>

                <div style="display: flex; justify-content: flex-end; gap: 0.75rem; margin-top: 1.5rem;">
                    <a href="CustomerHomeFrm2.jsp" class="btn btn-outline" id="subBack">
                        Hủy
                    </a>
                    <button type="submit" class="btn btn-primary" id="subRegister">
                        Đăng ký
                    </button>
                </div>
            </form>
        </div>
    </main>

    <footer>
        <p>ShopMan</p>
    </footer>
</body>
</html>
```

### Tệp: `WebContent/view/thanhvien/doRegisterMember2.jsp`
*Controller xử lý đăng ký thành viên (validate, gọi DAO, redirect/forward)*

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Customer2" %>
<%@ page import="dao.MemberDAO2" %>
<%@ page import="dao.CustomerDAO2" %>
<%
    request.setCharacterEncoding("UTF-8");

    // 1. Tiep nhan 6 tham so tu bieu mau RegisterMemberFrm2.jsp
    String fullName = request.getParameter("inFullName");
    String username = request.getParameter("inUsername");
    String password = request.getParameter("inPassword");
    String phone = request.getParameter("inPhone");
    String email = request.getParameter("inEmail");
    String address = request.getParameter("inAddress");

    // Dong goi tam thoi doi tuong customer de duy tri du lieu neu co loi
    Customer2 customer = new Customer2();
    customer.setFullName(fullName != null ? fullName.trim() : "");
    customer.setUsername(username != null ? username.trim() : "");
    customer.setPassword(password);
    customer.setPhone(phone != null ? phone.trim() : "");
    customer.setEmail(email != null ? email.trim() : "");
    customer.setAddress(address != null ? address.trim() : "");

    // 2. Kiem tra tinh hop le du lieu phia Server (Server-side validation)
    if (fullName == null || fullName.trim().isEmpty() ||
        username == null || username.trim().isEmpty() ||
        password == null || password.trim().isEmpty() ||
        phone == null || phone.trim().isEmpty() ||
        email == null || email.trim().isEmpty() ||
        address == null || address.trim().isEmpty()) {
        
        request.setAttribute("outMessage", "Dữ liệu không được để trống bất kỳ trường nào!");
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("RegisterMemberFrm2.jsp").forward(request, response);
        return;
    }

    if (!email.contains("@") || !email.contains(".")) {
        request.setAttribute("outMessage", "Địa chỉ email không đúng định dạng!");
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("RegisterMemberFrm2.jsp").forward(request, response);
        return;
    }

    // 3. Goi MemberDAO2 kiem tra tinh duy nhat cua username va email
    MemberDAO2 memberDAO = new MemberDAO2();
    boolean existed = memberDAO.checkExistingMember(customer.getUsername(), customer.getEmail());

    if (existed) {
        // Ngoai le: Da ton tai username hoac email trong CSDL
        request.setAttribute("outMessage", "Tên đăng nhập hoặc Email đã tồn tại trong hệ thống! Vui lòng chọn thông tin khác.");
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("RegisterMemberFrm2.jsp").forward(request, response);
        return;
    }

    // 4. Goi CustomerDAO2 thuc hien luu khach hang moi vao CSDL
    CustomerDAO2 customerDAO = new CustomerDAO2();
    boolean saveOk = customerDAO.saveCustomer(customer);

    if (saveOk) {
        // Kich ban chinh thanh cong: Chuyen huong sang LoginFrm2.jsp kem thong bao
        response.sendRedirect("LoginFrm2.jsp?msg=success");
    } else {
        request.setAttribute("outMessage", "Lỗi xảy ra trong quá trình lưu dữ liệu vào cơ sở dữ liệu. Vui lòng thử lại!");
        request.setAttribute("customer", customer);
        request.getRequestDispatcher("RegisterMemberFrm2.jsp").forward(request, response);
    }
%>
```

### Tệp: `WebContent/view/thanhvien/LoginFrm2.jsp`
*Giao diện biểu mẫu đăng nhập hệ thống*

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String msg = request.getParameter("msg");
    String err = request.getParameter("err");
    String error = request.getParameter("error");
    if ("empty".equals(err)) error = "Vui lòng nhập đầy đủ tên đăng nhập và mật khẩu!";
    if ("fail".equals(err)) error = "Tên đăng nhập hoặc mật khẩu không chính xác!";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopMan - Đăng nhập</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <header>
        <div class="header-content">
            <div class="brand-title">ShopMan</div>
            <div class="user-info">
                <a href="CustomerHomeFrm2.jsp">Trang chủ</a>
            </div>
        </div>
    </header>

    <main>
        <div class="card" style="max-width: 420px; margin: 2rem auto;">
            <h2 class="card-title">Đăng nhập tài khoản</h2>

            <% if ("success".equals(msg)) { %>
                <div class="alert alert-success">
                    Đăng ký tài khoản thành công! Vui lòng đăng nhập.
                </div>
            <% } %>

            <% if (error != null) { %>
                <div class="alert alert-danger">
                    <%= error %>
                </div>
            <% } %>

            <form action="doLogin2.jsp" method="post">
                <div class="form-group">
                    <label for="username">Tên đăng nhập:</label>
                    <input type="text" id="username" name="username" class="form-control" required>
                </div>

                <div class="form-group">
                    <label for="password">Mật khẩu:</label>
                    <input type="password" id="password" name="password" class="form-control" required>
                </div>

                <div style="display: flex; justify-content: space-between; align-items: center; margin-top: 1.5rem;">
                    <a href="RegisterMemberFrm2.jsp" style="color: var(--link); text-decoration: none; font-size: 0.85rem;">
                        Chưa có tài khoản? Đăng ký
                    </a>
                    <button type="submit" class="btn btn-primary">
                        Đăng nhập
                    </button>
                </div>
            </form>
        </div>
    </main>

    <footer>
        <p>ShopMan</p>
    </footer>
</body>
</html>
```

### Tệp: `WebContent/view/thanhvien/doLogin2.jsp`
*Controller xử lý đăng nhập và phân quyền Session*

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.MemberDAO2" %>
<%@ page import="model.Customer2" %>
<%@ page import="model.Manager2" %>
<%@ page import="model.Member2" %>
<%@ page import="model.SalesStaff2" %>
<%
    request.setCharacterEncoding("UTF-8");
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username == null || password == null || username.trim().isEmpty() || password.trim().isEmpty()) {
        response.sendRedirect("LoginFrm2.jsp?err=empty");
        return;
    }

    // Goi duy nhat MemberDAO2 theo dung kien truc 3 tang va Bieu do lop Hinh 5.2 (khong dung raw SQL trong JSP)
    MemberDAO2 memberDAO = new MemberDAO2();
    Member2 member = memberDAO.checkLogin(username.trim(), password);

    if (member instanceof Manager2) {
        session.setAttribute("manager", (Manager2) member);
        response.sendRedirect("../quanli/ManagerHomeFrm2.jsp");
    } else if (member instanceof SalesStaff2) {
        session.setAttribute("salesStaff", (SalesStaff2) member);
        response.sendRedirect("CustomerHomeFrm2.jsp?role=salesStaff");
    } else if (member instanceof Customer2) {
        session.setAttribute("customer", (Customer2) member);
        response.sendRedirect("CustomerHomeFrm2.jsp?role=customer");
    } else {
        response.sendRedirect("LoginFrm2.jsp?err=fail");
    }
%>
```

### Tệp: `WebContent/view/quanli/ManagerHomeFrm2.jsp`
*Trang chủ phân hệ Quản lý*

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Manager2" %>
<%
    Manager2 manager = (Manager2) session.getAttribute("manager");
    if (manager == null) {
        manager = new Manager2();
        manager.setFullName("Nguyễn Đức Mạnh");
        manager.setUsername("quanli1");
        session.setAttribute("manager", manager);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopMan - Quản lý</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <header>
        <div class="header-content">
            <div class="brand-title">ShopMan</div>
            <div class="user-info">
                Quản lý: <strong><%= manager.getFullName() %></strong> | 
                <a href="../../index.jsp">Đăng xuất</a>
            </div>
        </div>
    </header>

    <main>
        <div class="card" style="max-width: 600px; margin: 2rem auto;">
            <h2 class="card-title">Phân hệ Quản trị</h2>
            <p style="color: var(--text-muted); margin-bottom: 1.5rem; font-size: 0.95rem;">
                Chọn chức năng làm việc:
            </p>

            <div style="border: 1px solid var(--border); border-radius: 6px; padding: 1.5rem; background: #ffffff;">
                <h3 style="font-size: 1.05rem; margin-bottom: 0.5rem; color: var(--text);">Thống kê & Báo cáo</h3>
                <p style="font-size: 0.85rem; color: var(--text-muted); margin-bottom: 1.25rem;">
                    Tra cứu và tổng hợp thống kê doanh thu mặt hàng theo khoảng thời gian.
                </p>
                <a href="SelectStatTypeFrm2.jsp" class="btn btn-primary" id="subViewStatistics" style="width: 100%;">
                    Xem báo cáo thống kê
                </a>
            </div>
        </div>
    </main>

    <footer>
        <p>ShopMan - Phân hệ Quản lý</p>
    </footer>
</body>
</html>
```

### Tệp: `WebContent/view/quanli/SelectStatTypeFrm2.jsp`
*Giao diện chọn loại báo cáo thống kê*

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Manager2" %>
<%
    Manager2 manager = (Manager2) session.getAttribute("manager");
    if (manager == null) {
        manager = new Manager2();
        manager.setFullName("Nguyễn Đức Mạnh");
        session.setAttribute("manager", manager);
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopMan - Chọn loại báo cáo thống kê</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
    <script>
        function handleTypeChange() {
            var select = document.getElementById("inoutStatType");
            var notice = document.getElementById("scopeNotice");
            if (select.value !== "revenue") {
                notice.style.display = "block";
            } else {
                notice.style.display = "none";
            }
        }

        function checkStatType() {
            var select = document.getElementById("inoutStatType");
            var text = select.options[select.selectedIndex].text;
            if (select.value !== "revenue") {
                alert("Chức năng '" + text + "' thuộc phạm vi mở rộng.\n\nHiện tại hệ thống cài đặt hoàn chỉnh chức năng: 'Thống kê mặt hàng theo doanh thu'.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <header>
        <div class="header-content">
            <div class="brand-title">ShopMan</div>
            <div class="user-info">
                Quản lý: <strong><%= manager.getFullName() %></strong> |
                <a href="ManagerHomeFrm2.jsp">Trang chủ</a>
            </div>
        </div>
    </header>

    <main>
        <div class="card" style="max-width: 580px; margin: 2rem auto;">
            <h2 class="card-title">Chọn loại báo cáo thống kê</h2>
            <p style="color: var(--text-muted); margin-bottom: 1.25rem; font-size: 0.95rem;">
                Chọn loại báo cáo cần kết xuất dữ liệu:
            </p>

            <form action="SelectDateRangeFrm2.jsp" method="get" onsubmit="return checkStatType();">
                <div class="form-group">
                    <label for="inoutStatType">Loại báo cáo:</label>
                    <select id="inoutStatType" name="inoutStatType" class="form-control" style="padding: 0.65rem 0.75rem;" onchange="handleTypeChange();">
                        <option value="revenue" selected>Thống kê mặt hàng theo doanh thu</option>
                        <option value="import">Thống kê hàng nhập theo số lượng và giá trị</option>
                        <option value="customer">Thống kê khách hàng theo doanh thu</option>
                        <option value="supplier">Thống kê nhà cung cấp theo giá trị nhập</option>
                    </select>
                </div>

                <div id="scopeNotice" class="alert alert-danger" style="display: none; margin-top: 1rem;">
                    Chức năng báo cáo này thuộc phạm vi mở rộng. Hiện tại hệ thống đang cài đặt chức năng: <strong>Thống kê mặt hàng theo doanh thu</strong>.
                </div>

                <div style="display: flex; justify-content: flex-end; gap: 0.75rem; margin-top: 1.5rem;">
                    <a href="ManagerHomeFrm2.jsp" class="btn btn-outline" id="subBack">
                        Quay lại
                    </a>
                    <button type="submit" class="btn btn-primary" id="subSelect">
                        Tiếp tục
                    </button>
                </div>
            </form>
        </div>
    </main>

    <footer>
        <p>ShopMan - Báo cáo Thống kê</p>
    </footer>
</body>
</html>
```

### Tệp: `WebContent/view/quanli/SelectDateRangeFrm2.jsp`
*Giao diện chọn khoảng thời gian thống kê*

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="model.Manager2" %>
<%
    Manager2 manager = (Manager2) session.getAttribute("manager");
    if (manager == null) {
        manager = new Manager2();
        manager.setFullName("Nguyễn Đức Mạnh");
        session.setAttribute("manager", manager);
    }
    String outMessage = (String) request.getAttribute("outMessage");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopMan - Chọn khoảng thời gian thống kê</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <header>
        <div class="header-content">
            <div class="brand-title">ShopMan</div>
            <div class="user-info">
                Quản lý: <strong><%= manager.getFullName() %></strong> | 
                <a href="ManagerHomeFrm2.jsp">Trang chủ</a>
            </div>
        </div>
    </header>

    <main>
        <div class="card" style="max-width: 580px; margin: 2rem auto;">
            <h2 class="card-title">Chọn khoảng thời gian thống kê</h2>
            <p style="color: var(--text-muted); margin-bottom: 1.25rem; font-size: 0.95rem;">
                Chọn khoảng thời gian báo cáo doanh thu bán hàng:
            </p>

            <% if (outMessage != null) { %>
                <div class="alert alert-danger"><%= outMessage %></div>
            <% } %>

            <form action="ItemRevenueStatFrm2.jsp" method="get">
                <div class="form-grid" style="margin-bottom: 1.25rem;">
                    <div class="form-group">
                        <label for="inStartDate">Từ ngày (*):</label>
                        <input type="date" id="inStartDate" name="inStartDate" class="form-control" value="2026-10-01" required>
                    </div>
                    <div class="form-group">
                        <label for="inEndDate">Đến ngày (*):</label>
                        <input type="date" id="inEndDate" name="inEndDate" class="form-control" value="2026-10-31" required>
                    </div>
                </div>

                <div style="display: flex; justify-content: flex-end; gap: 0.75rem; margin-top: 1.5rem;">
                    <a href="SelectStatTypeFrm2.jsp" class="btn btn-outline" id="subBack">Quay lại</a>
                    <button type="submit" class="btn btn-primary" id="subViewStat" name="subViewStat">Xem thống kê</button>
                </div>
            </form>
        </div>
    </main>

    <footer>
        <p>ShopMan - Báo cáo Thống kê</p>
    </footer>
</body>
</html>
```

### Tệp: `WebContent/view/quanli/ItemRevenueStatFrm2.jsp`
*Giao diện kết quả thống kê mặt hàng theo doanh thu*

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ItemRevenueStatDAO2" %>
<%@ page import="model.ItemRevenueStat2" %>
<%@ page import="model.Manager2" %>
<%
    Manager2 manager = (Manager2) session.getAttribute("manager");
    if (manager == null) {
        manager = new Manager2();
        manager.setFullName("Nguyễn Đức Mạnh");
        session.setAttribute("manager", manager);
    }

    String startParam = request.getParameter("inStartDate");
    String endParam = request.getParameter("inEndDate");

    if (startParam == null) startParam = request.getParameter("startDate");
    if (endParam == null) endParam = request.getParameter("endDate");
    if (startParam == null) startParam = (String) session.getAttribute("startDateStr");
    if (endParam == null) endParam = (String) session.getAttribute("endDateStr");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date startDate = null;
    Date endDate = null;
    String outMessage = null;
    List<ItemRevenueStat2> listItemRevenueStat = null;

    try {
        if (startParam != null && endParam != null && !startParam.trim().isEmpty() && !endParam.trim().isEmpty()) {
            startDate = sdf.parse(startParam.trim());
            endDate = sdf.parse(endParam.trim());

            if (startDate.after(endDate)) {
                request.setAttribute("outMessage", "Lỗi: Ngày bắt đầu không được lớn hơn ngày kết thúc!");
                request.getRequestDispatcher("SelectDateRangeFrm2.jsp").forward(request, response);
                return;
            }

            session.setAttribute("startDateStr", startParam.trim());
            session.setAttribute("endDateStr", endParam.trim());
            session.setAttribute("startDate", startDate);
            session.setAttribute("endDate", endDate);

            ItemRevenueStatDAO2 statDAO = new ItemRevenueStatDAO2();
            listItemRevenueStat = statDAO.getItemRevenueStat(startDate, endDate);

            if (listItemRevenueStat == null || listItemRevenueStat.isEmpty()) {
                outMessage = "Không có dữ liệu giao dịch trong khoảng thời gian đã chọn.";
            }
        } else {
            response.sendRedirect("SelectDateRangeFrm2.jsp");
            return;
        }
    } catch (Exception e) {
        request.setAttribute("outMessage", "Định dạng ngày không hợp lệ. Vui lòng nhập đúng dạng yyyy-MM-dd!");
        request.getRequestDispatcher("SelectDateRangeFrm2.jsp").forward(request, response);
        return;
    }

    DecimalFormat df = new DecimalFormat("#,###");
    float grandTotal = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopMan - Thống kê mặt hàng theo doanh thu</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <header>
        <div class="header-content">
            <div class="brand-title">ShopMan</div>
            <div class="user-info">
                Quản lý: <strong><%= manager.getFullName() %></strong> | 
                <a href="ManagerHomeFrm2.jsp">Trang chủ</a>
            </div>
        </div>
    </header>

    <main>
        <div class="card" style="max-width: 900px; margin: 2rem auto;">
            <h2 class="card-title">Thống kê mặt hàng theo doanh thu</h2>
            
            <div style="margin-bottom: 1.25rem; font-size: 0.95rem; color: var(--text);">
                <div><strong>Báo cáo doanh thu bán hàng:</strong> <%= startParam %> đến <%= endParam %></div>
                <div style="color: var(--text-muted); font-size: 0.85rem; margin-top: 0.25rem;">Quản lí thực hiện: <%= manager.getFullName() %></div>
            </div>

            <% if (outMessage != null) { %>
                <div class="alert alert-danger"><%= outMessage %></div>
            <% } else if (listItemRevenueStat != null && !listItemRevenueStat.isEmpty()) { %>
                <div class="table-responsive">
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th style="width: 50px;" class="text-center">TT</th>
                                <th style="width: 90px;" class="text-center">Mã MH</th>
                                <th>Tên mặt hàng</th>
                                <th style="width: 70px;" class="text-center">ĐVT</th>
                                <th style="width: 90px;" class="text-right">SL bán</th>
                                <th style="width: 150px;" class="text-right">Doanh thu (VNĐ)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < listItemRevenueStat.size(); i++) {
                                ItemRevenueStat2 item = listItemRevenueStat.get(i);
                                grandTotal += item.getTotalRevenue();
                            %>
                            <tr>
                                <td class="text-center"><%= (i + 1) %></td>
                                <td class="text-center"><%= item.getItemCode() %></td>
                                <td>
                                    <a href="ItemTransactionDetailFrm2.jsp?itemCode=<%= item.getItemCode() %>&inStartDate=<%= startParam %>&inEndDate=<%= endParam %>" class="item-link" title="Nhấp chuột xem chi tiết các lần giao dịch">
                                        <%= item.getName() %>
                                    </a>
                                </td>
                                <td class="text-center"><%= item.getUnit() %></td>
                                <td class="text-right"><%= item.getTotalQuantitySold() %></td>
                                <td class="text-right"><strong><%= df.format(item.getTotalRevenue()) %></strong></td>
                            </tr>
                            <% } %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="5" style="text-align: right; font-weight: bold; padding: 0.85rem 0.75rem;">TỔNG CỘNG DOANH THU:</td>
                                <td class="text-right" style="font-weight: bold; font-size: 1rem; color: #1e293b; padding: 0.85rem 0.75rem;"><%= df.format(grandTotal) %> VNĐ</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            <% } %>

            <p style="font-size: 0.85rem; color: var(--text-muted); margin-top: 1rem; font-style: italic;">
                (*) Nhấp chuột vào tên mặt hàng để xem chi tiết các lần giao dịch của mặt hàng đó.
            </p>

            <div style="margin-top: 1.5rem;">
                <a href="SelectDateRangeFrm2.jsp" class="btn btn-outline" id="subBack">&laquo; Quay lại chọn khoảng ngày</a>
            </div>
        </div>
    </main>

    <footer>
        <p>ShopMan - Báo cáo Thống kê</p>
    </footer>
</body>
</html>
```

### Tệp: `WebContent/view/quanli/ItemTransactionDetailFrm2.jsp`
*Giao diện chi tiết các lần giao dịch của mặt hàng đã chọn*

```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.InvoiceDetailDAO2" %>
<%@ page import="model.InvoiceDetail2" %>
<%@ page import="model.Manager2" %>
<%
    Manager2 manager = (Manager2) session.getAttribute("manager");
    if (manager == null) {
        manager = new Manager2();
        manager.setFullName("Nguyễn Đức Mạnh");
        session.setAttribute("manager", manager);
    }

    String itemCode = request.getParameter("itemCode");
    String startStr = request.getParameter("inStartDate");
    String endStr = request.getParameter("inEndDate");
    if (startStr == null) startStr = (String) session.getAttribute("startDateStr");
    if (endStr == null) endStr = (String) session.getAttribute("endDateStr");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date startDate = null;
    Date endDate = null;
    try {
        if (startStr != null) startDate = sdf.parse(startStr.trim());
        if (endStr != null) endDate = sdf.parse(endStr.trim());
    } catch (Exception e) {}

    if (itemCode == null || itemCode.trim().isEmpty() || startDate == null || endDate == null) {
        response.sendRedirect("ItemRevenueStatFrm2.jsp");
        return;
    }

    InvoiceDetailDAO2 detailDAO = new InvoiceDetailDAO2();
    List<InvoiceDetail2> listTransactionDetail = detailDAO.getItemTransactionDetails(itemCode, startDate, endDate);

    String outItemName = itemCode;
    String outItemUnit = "";
    if (listTransactionDetail != null && !listTransactionDetail.isEmpty()) {
        outItemName = listTransactionDetail.get(0).getItem().getName();
        outItemUnit = listTransactionDetail.get(0).getItem().getUnit();
    }

    DecimalFormat df = new DecimalFormat("#,###");
    int outTotalQuantity = 0;
    float outTotalRevenue = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopMan - Chi tiết các lần giao dịch của mặt hàng</title>
    <link rel="stylesheet" href="../../assets/css/style.css">
</head>
<body>
    <header>
        <div class="header-content">
            <div class="brand-title">ShopMan</div>
            <div class="user-info">
                Quản lý: <strong><%= manager.getFullName() %></strong> | 
                <a href="ManagerHomeFrm2.jsp">Trang chủ</a>
            </div>
        </div>
    </header>

    <main>
        <div class="card" style="max-width: 900px; margin: 2rem auto;">
            <h2 class="card-title">Chi tiết các lần giao dịch của mặt hàng</h2>
            
            <div style="margin-bottom: 1.25rem; font-size: 0.95rem; color: var(--text);">
                <div><strong>Mặt hàng:</strong> <%= outItemName %> (<%= itemCode %>) - <strong>ĐVT:</strong> <%= outItemUnit %></div>
                <div style="color: var(--text-muted); font-size: 0.85rem; margin-top: 0.25rem;"><strong>Khoảng thời gian:</strong> <%= startStr %> đến <%= endStr %></div>
            </div>

            <% if (listTransactionDetail == null || listTransactionDetail.isEmpty()) { %>
                <div class="alert alert-danger">Không có giao dịch nào của mặt hàng này trong khoảng thời gian đã chọn.</div>
            <% } else { %>
                <div class="table-responsive">
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th style="width: 50px;" class="text-center">TT</th>
                                <th style="width: 90px;" class="text-center">Mã HĐ</th>
                                <th style="width: 110px;" class="text-center">Ngày lập</th>
                                <th>Tên khách hàng</th>
                                <th style="width: 70px;" class="text-right">SL</th>
                                <th style="width: 110px;" class="text-right">Đơn giá</th>
                                <th style="width: 140px;" class="text-right">Thành tiền (VNĐ)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < listTransactionDetail.size(); i++) {
                                InvoiceDetail2 d = listTransactionDetail.get(i);
                                float lineTotal = d.getQuantity() * d.getUnitPrice();
                                outTotalQuantity += d.getQuantity();
                                outTotalRevenue += lineTotal;
                                String customerName = (d.getInvoice() != null && d.getInvoice().getCustomer() != null)
                                        ? d.getInvoice().getCustomer().getFullName() + " (" + d.getInvoice().getCustomer().getCustomerCode() + ")" : "N/A";
                                String invoiceCode = (d.getInvoice() != null) ? d.getInvoice().getInvoiceCode() : "N/A";
                                String invoiceDate = (d.getInvoice() != null && d.getInvoice().getCreatedDate() != null)
                                        ? sdf.format(d.getInvoice().getCreatedDate()) : "N/A";
                            %>
                            <tr>
                                <td class="text-center"><%= (i + 1) %></td>
                                <td class="text-center"><strong><%= invoiceCode %></strong></td>
                                <td class="text-center"><%= invoiceDate %></td>
                                <td><%= customerName %></td>
                                <td class="text-right"><%= d.getQuantity() %></td>
                                <td class="text-right"><%= df.format(d.getUnitPrice()) %></td>
                                <td class="text-right"><strong><%= df.format(lineTotal) %></strong></td>
                            </tr>
                            <% } %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="4" style="text-align: right; font-weight: bold; padding: 0.85rem 0.75rem;">TỔNG CỘNG:</td>
                                <td class="text-right" style="font-weight: bold; padding: 0.85rem 0.75rem;"><%= outTotalQuantity %></td>
                                <td></td>
                                <td class="text-right" style="font-weight: bold; font-size: 1rem; color: #1e293b; padding: 0.85rem 0.75rem;"><%= df.format(outTotalRevenue) %> VNĐ</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            <% } %>

            <div style="margin-top: 1.5rem;">
                <a href="ItemRevenueStatFrm2.jsp?inStartDate=<%= startStr != null ? startStr : "" %>&inEndDate=<%= endStr != null ? endStr : "" %>" class="btn btn-outline" id="subBack">&laquo; Quay lại bảng thống kê</a>
            </div>
        </div>
    </main>

    <footer>
        <p>ShopMan - Báo cáo Thống kê</p>
    </footer>
</body>
</html>
```
