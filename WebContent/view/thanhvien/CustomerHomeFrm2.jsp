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
