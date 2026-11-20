package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import model.Customer2;

public class CustomerDAO2 extends DAO2 {
    public CustomerDAO2() {
        super();
    }

    /**
     * Luu thong tin khach hang vao 2 bang tblMember2 va tblCustomer2 voi Transaction.
     * @param customer Doi tuong Customer2 can luu
     * @return true neu luu thanh cong, false neu that bai
     */
    public boolean saveCustomer(Customer2 customer) {
        boolean success = false;
        String sqlMember = "INSERT INTO tblMember2 (username, password, fullName, address, email, phone) VALUES (?, ?, ?, ?, ?, ?)";
        String sqlCustomer = "INSERT INTO tblCustomer2 (tblMember2id, customerCode) VALUES (?, ?)";

        boolean originalAutoCommit = true;
        try {
            originalAutoCommit = con.getAutoCommit();
            con.setAutoCommit(false);

            PreparedStatement psMember = con.prepareStatement(sqlMember, Statement.RETURN_GENERATED_KEYS);
            psMember.setString(1, customer.getUsername());
            psMember.setString(2, customer.getPassword());
            psMember.setString(3, customer.getFullName());
            psMember.setString(4, customer.getAddress());
            psMember.setString(5, customer.getEmail());
            psMember.setString(6, customer.getPhone());
            psMember.executeUpdate();

            ResultSet rs = psMember.getGeneratedKeys();
            int memberId = 0;
            if (rs.next()) {
                memberId = rs.getInt(1);
                customer.setId(memberId);
            }

            // Sinh ma customerCode neu chua co: KH + 4 chu so
            if (customer.getCustomerCode() == null || customer.getCustomerCode().trim().isEmpty()) {
                customer.setCustomerCode("KH" + String.format("%04d", memberId));
            }

            PreparedStatement psCustomer = con.prepareStatement(sqlCustomer);
            psCustomer.setInt(1, memberId);
            psCustomer.setString(2, customer.getCustomerCode());
            psCustomer.executeUpdate();

            con.commit();
            success = true;
        } catch (Exception e) {
            try {
                con.rollback();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            success = false;
        } finally {
            try {
                con.setAutoCommit(originalAutoCommit);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return success;
    }
}
