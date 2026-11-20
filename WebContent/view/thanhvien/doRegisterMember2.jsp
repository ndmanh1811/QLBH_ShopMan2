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
