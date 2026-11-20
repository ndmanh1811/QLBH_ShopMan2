package model;

public class Manager2 extends Employee2 {
    private static final long serialVersionUID = 2L;

    public Manager2() {
        super();
        setPosition("Quản lí");
    }

    public Manager2(String employeeCode) {
        super(employeeCode, "Quản lí");
    }

    public Manager2(String username, String password, String fullName, String address, String email, String phone, String employeeCode) {
        super(username, password, fullName, address, email, phone, employeeCode, "Quản lí");
    }

    public Manager2(int id, String username, String password, String fullName, String address, String email, String phone, String employeeCode) {
        super(id, username, password, fullName, address, email, phone, employeeCode, "Quản lí");
    }
}
