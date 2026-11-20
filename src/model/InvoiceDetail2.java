package model;

import java.io.Serializable;

public class InvoiceDetail2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private int quantity;
    private float unitPrice;
    private Item2 item;
    private Invoice2 invoice;

    public InvoiceDetail2() {
    }

    public InvoiceDetail2(int id, int quantity, float unitPrice, Item2 item) {
        this.id = id;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.item = item;
    }

    public InvoiceDetail2(int id, int quantity, float unitPrice, Item2 item, Invoice2 invoice) {
        this.id = id;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.item = item;
        this.invoice = invoice;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public float getUnitPrice() { return unitPrice; }
    public void setUnitPrice(float unitPrice) { this.unitPrice = unitPrice; }

    public Item2 getItem() { return item; }
    public void setItem(Item2 item) { this.item = item; }

    public Invoice2 getInvoice() { return invoice; }
    public void setInvoice(Invoice2 invoice) { this.invoice = invoice; }
}
