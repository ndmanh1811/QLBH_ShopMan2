package model;

import java.io.Serializable;

public class ImportReceiptDetail2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private int quantity;
    private float importPrice;
    private Item2 item;
    private ImportReceipt2 importReceipt;

    public ImportReceiptDetail2() {
    }

    public ImportReceiptDetail2(int id, int quantity, float importPrice, Item2 item) {
        this.id = id;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.item = item;
    }

    public ImportReceiptDetail2(int id, int quantity, float importPrice, Item2 item, ImportReceipt2 importReceipt) {
        this.id = id;
        this.quantity = quantity;
        this.importPrice = importPrice;
        this.item = item;
        this.importReceipt = importReceipt;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }

    public float getImportPrice() { return importPrice; }
    public void setImportPrice(float importPrice) { this.importPrice = importPrice; }

    public Item2 getItem() { return item; }
    public void setItem(Item2 item) { this.item = item; }

    public ImportReceipt2 getImportReceipt() { return importReceipt; }
    public void setImportReceipt(ImportReceipt2 importReceipt) { this.importReceipt = importReceipt; }
}
