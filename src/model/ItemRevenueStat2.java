package model;

public class ItemRevenueStat2 extends Item2 {
    private static final long serialVersionUID = 2L;
    private int totalQuantitySold;
    private float totalRevenue;

    public ItemRevenueStat2() {
        super();
    }

    public ItemRevenueStat2(int id, String itemCode, String name, String unit, float price, int stockQuantity, String description, int totalQuantitySold, float totalRevenue) {
        super(id, itemCode, name, unit, price, stockQuantity, description);
        this.totalQuantitySold = totalQuantitySold;
        this.totalRevenue = totalRevenue;
    }

    public int getTotalQuantitySold() { return totalQuantitySold; }
    public void setTotalQuantitySold(int totalQuantitySold) { this.totalQuantitySold = totalQuantitySold; }

    public float getTotalRevenue() { return totalRevenue; }
    public void setTotalRevenue(float totalRevenue) { this.totalRevenue = totalRevenue; }
}
