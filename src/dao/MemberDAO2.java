package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Customer2;
import model.Manager2;
import model.Member2;
import model.SalesStaff2;

public class MemberDAO2 extends DAO2 {
    public MemberDAO2() {
        super();
    }

    /**
     * Kiem tra tinh duy nhat cua username hoac email trong he thong.
     * @param username Ten dang nhap can kiem tra
     * @param email Email can kiem tra
     * @return true neu da ton tai (trung), false neu hop le (chua ton tai)
     */
    public boolean checkExistingMember(String username, String email) {
        boolean existed = false;
        String sql = "SELECT id FROM tblMember2 WHERE username = ? OR email = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                existed = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return existed;
    }

    /**
     * Kiem tra dang nhap va phan quyen tac nhan (Customer / Manager / SalesStaff).
     * @param username Ten dang nhap
     * @param password Mat khau
     * @return Doi tuong Member2 cu the (Manager2, SalesStaff2 hoac Customer2), hoac null neu sai thong tin
     */
    public Member2 checkLogin(String username, String password) {
        if (username == null || password == null ||
            username.contains("'") || username.contains("=") ||
            password.contains("'") || password.contains("=")) {
            return null;
        }
        String sql = "SELECT m.*, c.customerCode, e.employeeCode, e.position "
                   + "FROM tblMember2 m "
                   + "LEFT JOIN tblCustomer2 c ON m.id = c.tblMember2id "
                   + "LEFT JOIN tblEmployee2 e ON m.id = e.tblMember2id "
                   + "WHERE m.username = ? AND m.password = ?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String position = rs.getString("position");
                Member2 member;
                if ("Quản lí".equals(position)) {
                    Manager2 mgr = new Manager2();
                    mgr.setEmployeeCode(rs.getString("employeeCode"));
                    mgr.setPosition(position);
                    member = mgr;
                } else if ("Bán hàng".equals(position)) {
                    SalesStaff2 staff = new SalesStaff2();
                    staff.setEmployeeCode(rs.getString("employeeCode"));
                    staff.setPosition(position);
                    member = staff;
                } else {
                    Customer2 cust = new Customer2();
                    cust.setCustomerCode(rs.getString("customerCode"));
                    member = cust;
                }
                member.setId(rs.getInt("id"));
                member.setUsername(rs.getString("username"));
                member.setFullName(rs.getString("fullName"));
                member.setAddress(rs.getString("address"));
                member.setEmail(rs.getString("email"));
                member.setPhone(rs.getString("phone"));
                return member;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
