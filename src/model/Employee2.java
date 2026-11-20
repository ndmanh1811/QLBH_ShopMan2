package model;

public abstract class Employee2 extends Member2 {
    private static final long serialVersionUID = 2L;
    private String employeeCode;
    private String position;

    public Employee2() {
        super();
    }

    public String getEmployeeCode() { return employeeCode; }
    public void setEmployeeCode(String employeeCode) { this.employeeCode = employeeCode; }

    public String getPosition() { return position; }
    public void setPosition(String position) { this.position = position; }
}
