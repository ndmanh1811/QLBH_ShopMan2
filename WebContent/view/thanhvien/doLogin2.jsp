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
