package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;

public class ImportReceipt2 implements Serializable {
    private static final long serialVersionUID = 2L;
    private int id;
    private String receiptCode;
    private Date importDate;
    private Manager2 manager;
    private Supplier2 supplier;
    private List<ImportReceiptDetail2> listImportReceiptDetail = new ArrayList<>();

    public ImportReceipt2() {
    }

    public ImportReceipt2(int id, String receiptCode, Date importDate, Manager2 manager, Supplier2 supplier) {
        this.id = id;
        this.receiptCode = receiptCode;
        this.importDate = importDate;
        this.manager = manager;
        this.supplier = supplier;
    }

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getReceiptCode() { return receiptCode; }
    public void setReceiptCode(String receiptCode) { this.receiptCode = receiptCode; }

    public Date getImportDate() { return importDate; }
    public void setImportDate(Date importDate) { this.importDate = importDate; }

    public Manager2 getManager() { return manager; }
    public void setManager(Manager2 manager) { this.manager = manager; }

    public Supplier2 getSupplier() { return supplier; }
    public void setSupplier(Supplier2 supplier) { this.supplier = supplier; }

    public List<ImportReceiptDetail2> getListImportReceiptDetail() { return listImportReceiptDetail; }
    public void setListImportReceiptDetail(List<ImportReceiptDetail2> listImportReceiptDetail) { this.listImportReceiptDetail = listImportReceiptDetail; }
}
