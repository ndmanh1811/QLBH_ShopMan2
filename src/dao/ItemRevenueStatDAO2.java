package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.ItemRevenueStat2;

public class ItemRevenueStatDAO2 extends DAO2 {
    public ItemRevenueStatDAO2() {
        super();
    }

    /**
     * Lay danh sach thong ke mat hang theo doanh thu giam dan trong khoang thoi gian [startDate, endDate].
     * @param startDate Ngay bat dau
     * @param endDate Ngay ket thuc
     * @return Danh sach ItemRevenueStat2 sap xep giam dan theo totalRevenue
     */
    public List<ItemRevenueStat2> getItemRevenueStat(java.util.Date startDate, java.util.Date endDate) {
        List<ItemRevenueStat2> list = new ArrayList<>();
        if (startDate == null || endDate == null || startDate.after(endDate)) {
            return list;
        }

        String sql = "SELECT i.id, i.itemCode, i.name, i.unit, i.price, i.stockQuantity, i.description, "
                   + "       SUM(d.quantity) AS totalQuantitySold, "
                   + "       SUM(d.quantity * d.unitPrice) AS totalRevenue "
                   + "FROM tblItem2 i "
                   + "JOIN tblInvoiceDetail2 d ON i.id = d.tblItem2id "
                   + "JOIN tblInvoice2 inv ON d.tblInvoice2id = inv.id "
                   + "WHERE inv.createdDate BETWEEN ? AND ? "
                   + "  AND inv.status = 'Hoàn thành' "
                   + "GROUP BY i.id, i.itemCode, i.name, i.unit, i.price, i.stockQuantity, i.description "
                   + "ORDER BY totalRevenue DESC";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setDate(1, new Date(startDate.getTime()));
            ps.setDate(2, new Date(endDate.getTime()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ItemRevenueStat2 item = new ItemRevenueStat2();
                item.setId(rs.getInt("id"));
                item.setItemCode(rs.getString("itemCode"));
                item.setName(rs.getString("name"));
                item.setUnit(rs.getString("unit"));
                item.setPrice(rs.getFloat("price"));
                item.setStockQuantity(rs.getInt("stockQuantity"));
                item.setDescription(rs.getString("description"));
                item.setTotalQuantitySold(rs.getInt("totalQuantitySold"));
                item.setTotalRevenue(rs.getFloat("totalRevenue"));
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
