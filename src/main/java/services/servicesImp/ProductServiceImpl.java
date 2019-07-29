package services.servicesImp;

import dao.ProductDao;
import daoImpl.ProductDaoImpl;
import model.Product;
import services.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {

    private ProductDao productDao = new ProductDaoImpl();

    @Override
    public void createProduct(Product product) {
        productDao.createProduct(product);
    }

    @Override
    public void updateProduct(Product product) {
        productDao.editProduct(product);
    }

    @Override
    public void deleteProductById(int product_id) {
        productDao.deleteProductById(product_id);
    }

    @Override
    public Product getProductById(int product_id) {
        return productDao.getProductById(product_id);
    }

    @Override
    public List getAllProducts() {
        return productDao.getAllProducts();
    }
}
