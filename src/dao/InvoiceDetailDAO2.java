package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Customer2;
import model.Invoice2;
import model.InvoiceDetail2;
import model.Item2;

public class InvoiceDetailDAO2 extends DAO2 {
    public InvoiceDetailDAO2() {
        super();
    }

    public List<InvoiceDetail2> getItemTransactionDetails(String itemCode, java.util.Date startDate, java.util.Date endDate) {
        List<InvoiceDetail2> list = new ArrayList<>();
        if (itemCode == null || startDate == null || endDate == null || startDate.after(endDate)) {
            return list;
        }

        String sql = "SELECT d.id, d.quantity, d.unitPrice, inv.invoiceCode, inv.createdDate, "
                   + "       i.name AS itemName, i.unit AS itemUnit, c.customerCode, m.fullName AS customerName "
                   + "FROM tblInvoiceDetail2 d "
                   + "JOIN tblInvoice2 inv ON d.tblInvoice2id = inv.id "
                   + "JOIN tblItem2 i ON d.tblItem2id = i.id "
                   + "JOIN tblCustomer2 c ON inv.tblCustomer2id = c.tblMember2id "
                   + "JOIN tblMember2 m ON c.tblMember2id = m.id "
                   + "WHERE i.itemCode = ? "
                   + "  AND inv.createdDate BETWEEN ? AND ? "
                   + "  AND inv.status = 'Hoàn thành' "
                   + "ORDER BY inv.createdDate ASC";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, itemCode);
            ps.setDate(2, new Date(startDate.getTime()));
            ps.setDate(3, new Date(endDate.getTime()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Customer2 cust = new Customer2();
                cust.setCustomerCode(rs.getString("customerCode"));
                cust.setFullName(rs.getString("customerName"));

                Invoice2 inv = new Invoice2();
                inv.setInvoiceCode(rs.getString("invoiceCode"));
                inv.setCreatedDate(rs.getDate("createdDate"));
                inv.setCustomer(cust);

                Item2 item = new Item2();
                item.setItemCode(itemCode);
                item.setName(rs.getString("itemName"));
                item.setUnit(rs.getString("itemUnit"));
                item.setPrice(rs.getFloat("unitPrice"));

                InvoiceDetail2 detail = new InvoiceDetail2();
                detail.setId(rs.getInt("id"));
                detail.setQuantity(rs.getInt("quantity"));
                detail.setUnitPrice(rs.getFloat("unitPrice"));
                detail.setItem(item);
                detail.setInvoice(inv);

                list.add(detail);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
