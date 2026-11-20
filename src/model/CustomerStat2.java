package model;

public class CustomerStat2 extends Customer2 {
    private static final long serialVersionUID = 2L;
    private int totalInvoices;
    private float totalAmount;

    public CustomerStat2() {
        super();
    }

    public int getTotalInvoices() { return totalInvoices; }
    public void setTotalInvoices(int totalInvoices) { this.totalInvoices = totalInvoices; }

    public float getTotalAmount() { return totalAmount; }
    public void setTotalAmount(float totalAmount) { this.totalAmount = totalAmount; }
}
