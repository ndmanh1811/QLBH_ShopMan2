package model;

public class ItemImportStat2 extends Item2 {
    private static final long serialVersionUID = 2L;
    private int totalQuantityImported;
    private float totalImportAmount;

    public ItemImportStat2() {
        super();
    }

    public int getTotalQuantityImported() { return totalQuantityImported; }
    public void setTotalQuantityImported(int totalQuantityImported) { this.totalQuantityImported = totalQuantityImported; }

    public float getTotalImportAmount() { return totalImportAmount; }
    public void setTotalImportAmount(float totalImportAmount) { this.totalImportAmount = totalImportAmount; }
}
