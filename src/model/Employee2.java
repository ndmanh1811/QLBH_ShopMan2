package model;

public class Employee2 extends Member2 {
    private static final long serialVersionUID = 2L;
    private String employeeCode;
    private String position;

    public Employee2() {
        super();
    }

    public Employee2(String employeeCode, String position) {
        this.employeeCode = employeeCode;
        this.position = position;
    }

    public Employee2(String username, String password, String fullName, String address, String email, String phone, String employeeCode, String position) {
        super(username, password, fullName, address, email, phone);
        this.employeeCode = employeeCode;
        this.position = position;
    }

    public Employee2(int id, String username, String password, String fullName, String address, String email, String phone, String employeeCode, String position) {
        super(id, username, password, fullName, address, email, phone);
        this.employeeCode = employeeCode;
        this.position = position;
    }

    public String getEmployeeCode() { return employeeCode; }
    public void setEmployeeCode(String employeeCode) { this.employeeCode = employeeCode; }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }
}
