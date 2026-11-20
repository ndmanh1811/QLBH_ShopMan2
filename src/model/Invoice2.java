package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class Invoice2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private String invoiceCode;
    private Date createdDate;
    private String deliveryAddress;
    private float totalAmount;
    private String status;
    private String deliveryStaffName;
    private Customer2 customer;
    private SalesStaff2 salesStaff;
    private List<InvoiceDetail2> listInvoiceDetail = new ArrayList<>();

    public Invoice2() {
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getInvoiceCode() { return invoiceCode; }
    public void setInvoiceCode(String invoiceCode) { this.invoiceCode = invoiceCode; }

    public Date getCreatedDate() { return createdDate; }
    public void setCreatedDate(Date createdDate) { this.createdDate = createdDate; }

    public String getDeliveryAddress() { return deliveryAddress; }
    public void setDeliveryAddress(String deliveryAddress) { this.deliveryAddress = deliveryAddress; }

    public float getTotalAmount() { return totalAmount; }
    public void setTotalAmount(float totalAmount) { this.totalAmount = totalAmount; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getDeliveryStaffName() { return deliveryStaffName; }
    public void setDeliveryStaffName(String deliveryStaffName) { this.deliveryStaffName = deliveryStaffName; }

    public Customer2 getCustomer() { return customer; }
    public void setCustomer(Customer2 customer) { this.customer = customer; }

    public SalesStaff2 getSalesStaff() { return salesStaff; }
    public void setSalesStaff(SalesStaff2 salesStaff) { this.salesStaff = salesStaff; }

    public List<InvoiceDetail2> getListInvoiceDetail() { return listInvoiceDetail; }
    public void setListInvoiceDetail(List<InvoiceDetail2> listInvoiceDetail) { this.listInvoiceDetail = listInvoiceDetail; }
}
