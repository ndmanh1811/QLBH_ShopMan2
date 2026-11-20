<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.InvoiceDetailDAO2" %>
<%@ page import="model.InvoiceDetail2" %>
<%@ page import="model.Manager2" %>
<%
    Manager2 manager = (Manager2) session.getAttribute("manager");
    if (manager == null) {
        manager = new Manager2();
        manager.setFullName("Nguyễn Đức Mạnh");
        session.setAttribute("manager", manager);
    }

    String itemCode = request.getParameter("itemCode");
    String startStr = request.getParameter("inStartDate");
    String endStr = request.getParameter("inEndDate");
    if (startStr == null) startStr = (String) session.getAttribute("startDateStr");
    if (endStr == null) endStr = (String) session.getAttribute("endDateStr");

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date startDate = null;
    Date endDate = null;
    try {
        if (startStr != null) startDate = sdf.parse(startStr.trim());
        if (endStr != null) endDate = sdf.parse(endStr.trim());
    } catch (Exception e) {}

    if (itemCode == null || itemCode.trim().isEmpty() || startDate == null || endDate == null) {
        response.sendRedirect("ItemRevenueStatFrm2.jsp");
        return;
    }

    InvoiceDetailDAO2 detailDAO = new InvoiceDetailDAO2();
    List<InvoiceDetail2> listTransactionDetail = detailDAO.getItemTransactionDetails(itemCode, startDate, endDate);

    String outItemName = itemCode;
    String outItemUnit = "";
    if (listTransactionDetail != null && !listTransactionDetail.isEmpty()) {
        outItemName = listTransactionDetail.get(0).getItem().getName();
        outItemUnit = listTransactionDetail.get(0).getItem().getUnit();
    }

    DecimalFormat df = new DecimalFormat("#,###");
    int outTotalQuantity = 0;
    float outTotalRevenue = 0;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ShopMan - Chi tiết các lần giao dịch của mặt hàng</title>
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
            <h2 class="card-title">Chi tiết các lần giao dịch của mặt hàng</h2>
            
            <div style="margin-bottom: 1.25rem; font-size: 0.95rem; color: var(--text);">
                <div><strong>Mặt hàng:</strong> <%= outItemName %> (<%= itemCode %>) - <strong>ĐVT:</strong> <%= outItemUnit %></div>
                <div style="color: var(--text-muted); font-size: 0.85rem; margin-top: 0.25rem;"><strong>Khoảng thời gian:</strong> <%= startStr %> đến <%= endStr %></div>
            </div>

            <% if (listTransactionDetail == null || listTransactionDetail.isEmpty()) { %>
                <div class="alert alert-danger">Không có giao dịch nào của mặt hàng này trong khoảng thời gian đã chọn.</div>
            <% } else { %>
                <div class="table-responsive">
                    <table class="styled-table">
                        <thead>
                            <tr>
                                <th style="width: 50px;" class="text-center">TT</th>
                                <th style="width: 90px;" class="text-center">Mã HĐ</th>
                                <th style="width: 110px;" class="text-center">Ngày lập</th>
                                <th>Tên khách hàng</th>
                                <th style="width: 70px;" class="text-right">SL</th>
                                <th style="width: 110px;" class="text-right">Đơn giá</th>
                                <th style="width: 140px;" class="text-right">Thành tiền (VNĐ)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < listTransactionDetail.size(); i++) {
                                InvoiceDetail2 d = listTransactionDetail.get(i);
                                float lineTotal = d.getQuantity() * d.getUnitPrice();
                                outTotalQuantity += d.getQuantity();
                                outTotalRevenue += lineTotal;
                                String customerName = (d.getInvoice() != null && d.getInvoice().getCustomer() != null)
                                        ? d.getInvoice().getCustomer().getFullName() + " (" + d.getInvoice().getCustomer().getCustomerCode() + ")" : "N/A";
                                String invoiceCode = (d.getInvoice() != null) ? d.getInvoice().getInvoiceCode() : "N/A";
                                String invoiceDate = (d.getInvoice() != null && d.getInvoice().getCreatedDate() != null)
                                        ? sdf.format(d.getInvoice().getCreatedDate()) : "N/A";
                            %>
                            <tr>
                                <td class="text-center"><%= (i + 1) %></td>
                                <td class="text-center"><strong><%= invoiceCode %></strong></td>
                                <td class="text-center"><%= invoiceDate %></td>
                                <td><%= customerName %></td>
                                <td class="text-right"><%= d.getQuantity() %></td>
                                <td class="text-right"><%= df.format(d.getUnitPrice()) %></td>
                                <td class="text-right"><strong><%= df.format(lineTotal) %></strong></td>
                            </tr>
                            <% } %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="4" style="text-align: right; font-weight: bold; padding: 0.85rem 0.75rem;">TỔNG CỘNG:</td>
                                <td class="text-right" style="font-weight: bold; padding: 0.85rem 0.75rem;"><%= outTotalQuantity %></td>
                                <td></td>
                                <td class="text-right" style="font-weight: bold; font-size: 1rem; color: #1e293b; padding: 0.85rem 0.75rem;"><%= df.format(outTotalRevenue) %> VNĐ</td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            <% } %>

            <div style="margin-top: 1.5rem;">
                <a href="ItemRevenueStatFrm2.jsp?inStartDate=<%= startStr != null ? startStr : "" %>&inEndDate=<%= endStr != null ? endStr : "" %>" class="btn btn-outline" id="subBack">&laquo; Quay lại bảng thống kê</a>
            </div>
        </div>
    </main>

    <footer>
        <p>ShopMan - Báo cáo Thống kê</p>
    </footer>
</body>
</html>
