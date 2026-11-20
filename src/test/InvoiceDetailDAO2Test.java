package test;

import dao.InvoiceDetailDAO2;
import model.InvoiceDetail2;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class InvoiceDetailDAO2Test {
    private InvoiceDetailDAO2 detailDAO;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    @Before
    public void setUp() {
        detailDAO = new InvoiceDetailDAO2();
    }

    @Test
    public void testGetItemTransactionDetails_Chuan() throws Exception {
        Date startDate = sdf.parse("2026-10-01");
        Date endDate = sdf.parse("2026-10-31");

        List<InvoiceDetail2> list = detailDAO.getItemTransactionDetails("MH01", startDate, endDate);
        Assert.assertNotNull("Danh sach chi tiet giao dich khong duoc null", list);
        Assert.assertEquals("Mat hang MH01 phai co dung 3 lan giao dich hoan thanh theo Wireframe Hinh 5.3", 3, list.size());

        // Kiem tra lan giao dich dau tien: HD01 ngay 2026-10-05
        InvoiceDetail2 firstTrans = list.get(0);
        Assert.assertEquals("HD01", firstTrans.getInvoice().getInvoiceCode());
        Assert.assertEquals("KH001", firstTrans.getInvoice().getCustomer().getCustomerCode());
        Assert.assertEquals("Nguyễn Văn An", firstTrans.getInvoice().getCustomer().getFullName());
        Assert.assertEquals(50, firstTrans.getQuantity());
        Assert.assertEquals(8000.0f, firstTrans.getUnitPrice(), 0.01f);
        Assert.assertEquals("Sữa chua Vinamilk", firstTrans.getItem().getName());

        // Kiem tra tong so luong ban = 250 va tong doanh thu = 2.000.000 VND
        int totalQty = 0;
        float totalRev = 0;
        for (InvoiceDetail2 d : list) {
            totalQty += d.getQuantity();
            totalRev += d.getQuantity() * d.getUnitPrice();
        }
        Assert.assertEquals(250, totalQty);
        Assert.assertEquals(2000000.0f, totalRev, 0.01f);

        // Kiem tra thu tu thoi gian tang dan
        for (int i = 0; i < list.size() - 1; i++) {
            Date d1 = list.get(i).getInvoice().getCreatedDate();
            Date d2 = list.get(i + 1).getInvoice().getCreatedDate();
            Assert.assertTrue("Thu tu giao dich phai tang dan theo thoi gian", !d1.after(d2));
        }
    }

    @Test
    public void testGetItemTransactionDetails_KhongCoGiaoDich() throws Exception {
        Date startDate = sdf.parse("2025-01-01");
        Date endDate = sdf.parse("2025-01-31");

        List<InvoiceDetail2> list = detailDAO.getItemTransactionDetails("MH01", startDate, endDate);
        Assert.assertNotNull("Ket qua khong duoc null", list);
        Assert.assertEquals("Khong co giao dich phai tra ve rong", 0, list.size());
    }

    @Test
    public void testGetItemTransactionDetails_MaMatHangKhongTonTai() throws Exception {
        Date startDate = sdf.parse("2026-10-01");
        Date endDate = sdf.parse("2026-10-31");

        List<InvoiceDetail2> list = detailDAO.getItemTransactionDetails("MH999_UNKNOWN", startDate, endDate);
        Assert.assertNotNull("Ket qua khong duoc null", list);
        Assert.assertEquals("Ma mat hang khong ton tai phai tra ve rong", 0, list.size());
    }
}
