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
