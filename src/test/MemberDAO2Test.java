package test;

import dao.MemberDAO2;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

public class MemberDAO2Test {
    private MemberDAO2 memberDAO;

    @Before
    public void setUp() {
        memberDAO = new MemberDAO2();
    }

    @Test
    public void testCheckExistingMember_TrungUsername() {
        // Truong hop username da ton tai trong CSDL ('nguyenvanan')
        boolean existed = memberDAO.checkExistingMember("nguyenvanan", "email_hoan_toan_moi_999@gmail.com");
        Assert.assertTrue("Phai phat hien username da ton tai", existed);
    }

    @Test
    public void testCheckExistingMember_TrungEmail() {
        // Truong hop email da ton tai trong CSDL ('an.nguyen@gmail.com')
        boolean existed = memberDAO.checkExistingMember("user_hoan_toan_moi_999", "an.nguyen@gmail.com");
        Assert.assertTrue("Phai phat hien email da ton tai", existed);
    }

    @Test
    public void testCheckExistingMember_ChuaTonTai() {
        // Truong hop ca username va email deu chua ton tai trong CSDL
        boolean existed = memberDAO.checkExistingMember("user_chua_ton_tai_12345", "email_chua_ton_tai_12345@gmail.com");
        Assert.assertFalse("Chua ton tai thi phai tra ve false", existed);
    }
}
