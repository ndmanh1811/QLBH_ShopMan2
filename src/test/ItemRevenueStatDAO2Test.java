package test;

import dao.ItemRevenueStatDAO2;
import model.ItemRevenueStat2;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class ItemRevenueStatDAO2Test {
    private ItemRevenueStatDAO2 statDAO;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Before
    public void setUp() {
        statDAO = new ItemRevenueStatDAO2();
    }

    @Test
    public void testGetItemRevenueStat_Chuan() throws Exception {
        Date startDate = sdf.parse("2026-10-01");
        Date endDate = sdf.parse("2026-10-31");

        List<ItemRevenueStat2> list = statDAO.getItemRevenueStat(startDate, endDate);
        Assert.assertNotNull("Ket qua thong ke khong duoc null", list);
        Assert.assertEquals("Phai co dung 5 mat hang co doanh thu theo Wireframe Hinh 5.3", 5, list.size());

        // Kiem tra sap xep giam dan theo doanh thu
        for (int i = 0; i < list.size() - 1; i++) {
            Assert.assertTrue("Doanh thu phai sap xep giam dan",
                list.get(i).getTotalRevenue() >= list.get(i + 1).getTotalRevenue());
        }

        // Mat hang dung dau doanh thu cao nhat phai la MH01 (Sua chua Vinamilk)
        ItemRevenueStat2 top1 = list.get(0);
        Assert.assertEquals("MH01", top1.getItemCode());
        Assert.assertEquals("Sữa chua Vinamilk", top1.getName());
        Assert.assertEquals(250, top1.getTotalQuantitySold());
        Assert.assertEquals(2000000.0f, top1.getTotalRevenue(), 0.01f);

        // Tong doanh thu phai la 8.040.000 VND
        float grandTotal = 0;
        for (ItemRevenueStat2 item : list) {
            grandTotal += item.getTotalRevenue();
        }
        Assert.assertEquals(8040000.0f, grandTotal, 0.01f);
    }

    @Test
    public void testGetItemRevenueStat_KhongCoGiaoDich() throws Exception {
        Date startDate = sdf.parse("2025-01-01");
        Date endDate = sdf.parse("2025-01-31");

        List<ItemRevenueStat2> list = statDAO.getItemRevenueStat(startDate, endDate);
        Assert.assertNotNull("Ket qua khong duoc null", list);
        Assert.assertEquals("Khoang thoi gian khong co giao dich phai tra ve danh sach rong", 0, list.size());
    }

    @Test
    public void testGetItemRevenueStat_NgayBatDauLonHonNgayKetThuc() throws Exception {
        Date startDate = sdf.parse("2026-10-31");
        Date endDate = sdf.parse("2026-10-01");

        List<ItemRevenueStat2> list = statDAO.getItemRevenueStat(startDate, endDate);
        Assert.assertNotNull("Ket qua khong duoc null", list);
        Assert.assertEquals("Khoang thoi gian nguoc phai tra ve danh sach rong", 0, list.size());
    }
}
