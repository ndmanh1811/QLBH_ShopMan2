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
