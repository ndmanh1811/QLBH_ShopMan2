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
