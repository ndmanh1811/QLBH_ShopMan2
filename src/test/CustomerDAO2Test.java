package test;

import dao.CustomerDAO2;
import dao.DAO2;
import model.Customer2;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CustomerDAO2Test {
    private CustomerDAO2 customerDAO;

    @Before
    public void setUp() {
        customerDAO = new CustomerDAO2();
    }

    @Test
    public void testSaveCustomer_ThanhCong() {
        String uniqueSuffix = String.valueOf(System.currentTimeMillis() % 100000);
        String uniqueUser = "test_user_" + uniqueSuffix;
        String uniqueEmail = "test_" + uniqueSuffix + "@gmail.com";

        Customer2 customer = new Customer2(
            uniqueUser,
            "MatKhau@123",
            "Nguyễn Văn Thử Nghiệm",
            "Số 10 Phố Xốm, Hà Đông, Hà Nội",
            uniqueEmail,
            "0987654321",
            null
        );

        try {
            boolean success = customerDAO.saveCustomer(customer);
            Assert.assertTrue("Lưu khách hàng mới phải thành công", success);
            Assert.assertTrue("Id sinh ra phải lớn hơn 0", customer.getId() > 0);
            Assert.assertNotNull("customerCode phải được sinh ra", customer.getCustomerCode());
            Assert.assertTrue("customerCode phải bắt đầu bằng KH", customer.getCustomerCode().startsWith("KH"));

            // Kiểm tra trực tiếp trong CSDL
            PreparedStatement ps = DAO2.con.prepareStatement("SELECT * FROM tblMember2 WHERE username = ?");
            ps.setString(1, uniqueUser);
            ResultSet rs = ps.executeQuery();
            Assert.assertTrue("Phải tìm thấy bản ghi vừa insert trong tblMember2", rs.next());
            Assert.assertEquals("Nguyễn Văn Thử Nghiệm", rs.getString("fullName"));

        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail("Xảy ra ngoại lệ trong testSaveCustomer_ThanhCong: " + e.getMessage());
        } finally {
            // Dọn dẹp dữ liệu test để bảo đảm môi trường CSDL sạch sẽ
            try {
                PreparedStatement psDel = DAO2.con.prepareStatement("DELETE FROM tblMember2 WHERE username LIKE 'test_user_%'");
                psDel.executeUpdate();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }

    @Test
    public void testSaveCustomer_ThatBaiDoTrungUsername() {
        // Username 'nguyenvanan' da ton tai trong CSDL
        Customer2 customer = new Customer2(
            "nguyenvanan",
            "123456",
            "Trùng Tên Đăng Nhập",
            "Hà Nội",
            "email_khac_123@gmail.com",
            "0911222333",
            null
        );

        boolean success = customerDAO.saveCustomer(customer);
        Assert.assertFalse("Luu bi trung username phai that bai va tra ve false", success);
    }
}
