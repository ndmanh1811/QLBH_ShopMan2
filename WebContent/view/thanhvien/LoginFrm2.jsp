<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String msg = request.getParameter("msg");
    String error = request.getParameter("error");
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
