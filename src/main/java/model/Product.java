package model;

public class Product {
    private int productId;
    private String productName;
    private int departmentId;

    public Product() {
    }

    public Product(int productId, String productName, int departmentId) {
        this.productId = productId;
        this.productName = productName;
        this.departmentId = departmentId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(int departmentId) {
        this.departmentId = departmentId;
    }
}
