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
