package services;

import model.Product;

import java.util.List;

public interface ProductService {
    void createProduct(Product product);
    void updateProduct(Product product);
    void deleteProductById(int product_id);
    Product getProductById(int product_id);
    List getAllProducts();
}
