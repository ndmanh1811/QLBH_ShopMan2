package model;

public class SalesStaff2 extends Employee2 {
    private static final long serialVersionUID = 2L;

    public SalesStaff2() {
        super();
        setPosition("Bán hàng");
    }

    public SalesStaff2(String employeeCode) {
        super(employeeCode, "Bán hàng");
    }

    public SalesStaff2(String username, String password, String fullName, String address, String email, String phone, String employeeCode) {
        super(username, password, fullName, address, email, phone, employeeCode, "Bán hàng");
    }

    public SalesStaff2(int id, String username, String password, String fullName, String address, String email, String phone, String employeeCode) {
        super(id, username, password, fullName, address, email, phone, employeeCode, "Bán hàng");
    }
}
