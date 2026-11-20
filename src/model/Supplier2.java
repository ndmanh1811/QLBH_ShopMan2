package model;

import java.io.Serializable;

public class Supplier2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private String supplierCode;
    private String name;
    private String address;
    private String phone;
    private String email;
    private String description;

    public Supplier2() {
    }

    public Supplier2(int id, String supplierCode, String name, String address, String phone, String email, String description) {
        this.id = id;
        this.supplierCode = supplierCode;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.email = email;
        this.description = description;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getSupplierCode() { return supplierCode; }
    public void setSupplierCode(String supplierCode) { this.supplierCode = supplierCode; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
