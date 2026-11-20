package model;

public class Customer2 extends Member2 {
    private static final long serialVersionUID = 2L;
    private String customerCode;

    public Customer2() {
        super();
    }

    public Customer2(String username, String password, String fullName, String address, String email, String phone, String customerCode) {
        super(username, password, fullName, address, email, phone);
        this.customerCode = customerCode;
    }

    public String getCustomerCode() { return customerCode; }
    public void setCustomerCode(String customerCode) { this.customerCode = customerCode; }
}
