package model;

public class SupplierStat2 extends Supplier2 {
    private static final long serialVersionUID = 2L;
    private int totalImports;
    private float totalImportValue;

    public SupplierStat2() {
        super();
    }

    public int getTotalImports() { return totalImports; }
    public void setTotalImports(int totalImports) { this.totalImports = totalImports; }

    public float getTotalImportValue() { return totalImportValue; }
    public void setTotalImportValue(float totalImportValue) { this.totalImportValue = totalImportValue; }
}
