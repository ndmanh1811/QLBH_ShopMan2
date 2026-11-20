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
