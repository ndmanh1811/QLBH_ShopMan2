package model;

public class ItemRevenueStat2 extends Item2 {
    private static final long serialVersionUID = 2L;
    private int totalQuantitySold;
    private float totalRevenue;

    public ItemRevenueStat2() {
        super();
    }

    public int getTotalQuantitySold() { return totalQuantitySold; }
    public void setTotalQuantitySold(int totalQuantitySold) { this.totalQuantitySold = totalQuantitySold; }

    public float getTotalRevenue() { return totalRevenue; }
    public void setTotalRevenue(float totalRevenue) { this.totalRevenue = totalRevenue; }
}
