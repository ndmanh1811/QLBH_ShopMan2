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
