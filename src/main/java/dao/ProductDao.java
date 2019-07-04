package dao;

import model.Product;
import java.util.List;

public interface ProductDao {
    void createProduct(Product product);
    void editProduct(Product product);
    void deleteProductById(int product_id);
    Product getProductById(int product_id);
    List getAllProducts();
}
