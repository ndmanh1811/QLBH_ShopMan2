<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.ItemRevenueStatDAO2" %>
<%@ page import="model.ItemRevenueStat2" %>
<%@ page import="model.Manager2" %>
<%
    Manager2 manager = (Manager2) session.getAttribute("manager");
    if (manager == null) {
        manager = new Manager2();
        manager.setFullName("Nguyễn Đức Mạnh");
        session.setAttribute("manager", manager);
    }

    String startParam = request.getParameter("inStartDate");
    String endParam = request.getParameter("inEndDate");

    if (startParam == null) startParam = request.getParameter("startDate");
    if (endParam == null) endParam = request.getParameter("endDate");
    if (startParam == null) startParam = (String) session.getAttribute("startDateStr");
    if (endParam == null) endParam = (String) session.getAttribute("endDateStr");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date startDate = null;
    Date endDate = null;
    String outMessage = null;
    List<ItemRevenueStat2> listItemRevenueStat = null;

    try {
        if (startParam != null && endParam != null && !startParam.trim().isEmpty() && !endParam.trim().isEmpty()) {
            startDate = sdf.parse(startParam.trim());
            endDate = sdf.parse(endParam.trim());

            if (startDate.after(endDate)) {
                request.setAttribute("outMessage", "Lỗi: Ngày bắt đầu không được lớn hơn ngày kết thúc!");
                request.getRequestDispatcher("SelectDateRangeFrm2.jsp").forward(request, response);
                return;
            }

            session.setAttribute("startDateStr", startParam.trim());
            session.setAttribute("endDateStr", endParam.trim());
            session.setAttribute("startDate", startDate);
            session.setAttribute("endDate", endDate);

            ItemRevenueStatDAO2 statDAO = new ItemRevenueStatDAO2();
            listItemRevenueStat = statDAO.getItemRevenueStat(startDate, endDate);

            if (listItemRevenueStat == null || listItemRevenueStat.isEmpty()) {
                outMessage = "Không có dữ liệu giao dịch trong khoảng thời gian đã chọn.";
            }
        } else {
            response.sendRedirect("SelectDateRangeFrm2.jsp");
            return;
        }
    } catch (Exception e) {
        request.setAttribute("outMessage", "Định dạng ngày không hợp lệ. Vui lòng nhập đúng dạng yyyy-MM-dd!");
        request.getRequestDispatcher("SelectDateRangeFrm2.jsp").forward(request, response);
        return;
    }

    DecimalFormat df = new DecimalFormat("#,###");
    float grandTotal = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopMan - Thống kê mặt hàng theo doanh thu</title>
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
        <div class="card" style="max-width: 900px; margin: 2rem auto;">
            <h2 class="card-title">Thống kê mặt hàng theo doanh thu</h2>
            
            <div style="margin-bottom: 1.25rem; font-size: 0.95rem; color: var(--text);">
                <div><strong>Báo cáo doanh thu bán hàng:</strong> <%= startParam %> đến <%= endParam %></div>
                <div style="color: var(--text-muted); font-size: 0.85rem; margin-top: 0.25rem;">Quản lí thực hiện: <%= manager.getFullName() %></div>
            </div>

            <% if (outMessage != null) { %>
                <div class="alert alert-danger"><%= outMessage %></div>
            <% } else if (listItemRevenueStat != null && !listItemRevenueStat.isEmpty()) { %>
                <div class="table-responsive">
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th style="width: 50px;" class="text-center">TT</th>
                                <th style="width: 90px;" class="text-center">Mã MH</th>
                                <th>Tên mặt hàng</th>
                                <th style="width: 70px;" class="text-center">ĐVT</th>
                                <th style="width: 90px;" class="text-right">SL bán</th>
                                <th style="width: 150px;" class="text-right">Doanh thu (VNĐ)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < listItemRevenueStat.size(); i++) {
                                ItemRevenueStat2 item = listItemRevenueStat.get(i);
                                grandTotal += item.getTotalRevenue();
                            %>
                            <tr>
                                <td class="text-center"><%= (i + 1) %></td>
                                <td class="text-center"><%= item.getItemCode() %></td>
                                <td>
                                    <a href="ItemTransactionDetailFrm2.jsp?itemCode=<%= item.getItemCode() %>&inStartDate=<%= startParam %>&inEndDate=<%= endParam %>" class="item-link" title="Nhấp chuột xem chi tiết các lần giao dịch">
                                        <%= item.getName() %>
                                    </a>
                                </td>
                                <td class="text-center"><%= item.getUnit() %></td>
                                <td class="text-right"><%= item.getTotalQuantitySold() %></td>
                                <td class="text-right"><strong><%= df.format(item.getTotalRevenue()) %></strong></td>
                            </tr>
                            <% } %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="5" style="text-align: right; font-weight: bold; padding: 0.85rem 0.75rem;">TỔNG CỘNG DOANH THU:</td>
                                <td class="text-right" style="font-weight: bold; font-size: 1rem; color: #1e293b; padding: 0.85rem 0.75rem;"><%= df.format(grandTotal) %> VNĐ</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            <% } %>

            <p style="font-size: 0.85rem; color: var(--text-muted); margin-top: 1rem; font-style: italic;">
                (*) Nhấp chuột vào tên mặt hàng để xem chi tiết các lần giao dịch của mặt hàng đó.
            </p>

            <div style="margin-top: 1.5rem;">
                <a href="SelectDateRangeFrm2.jsp" class="btn btn-outline" id="subBack">&laquo; Quay lại chọn khoảng ngày</a>
            </div>
        </div>
    </main>

    <footer>
        <p>ShopMan - Báo cáo Thống kê</p>
    </footer>
</body>
</html>
