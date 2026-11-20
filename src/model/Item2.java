package model;

import java.io.Serializable;

public class Item2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private String itemCode;
    private String name;
    private String unit;
    private float price;
    private int stockQuantity;
    private String description;

    public Item2() {
    }

    public Item2(int id, String itemCode, String name, String unit, float price, int stockQuantity, String description) {
        this.id = id;
        this.itemCode = itemCode;
        this.name = name;
        this.unit = unit;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.description = description;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getItemCode() { return itemCode; }
    public void setItemCode(String itemCode) { this.itemCode = itemCode; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getUnit() { return unit; }
    public void setUnit(String unit) { this.unit = unit; }

    public float getPrice() { return price; }
    public void setPrice(float price) { this.price = price; }

    public int getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(int stockQuantity) { this.stockQuantity = stockQuantity; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
