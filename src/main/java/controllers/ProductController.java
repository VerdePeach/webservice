package controllers;

import model.Product;
import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import services.ProductService;
import services.servicesImp.DepartmentServiceImpl;
import services.servicesImp.ProductServiceImpl;

import java.util.ArrayList;
import java.util.List;

@RestController
public class ProductController {

    private static final Logger logger = Logger.getRootLogger();
    private ProductService productService = new ProductServiceImpl();

    @RequestMapping(value = "/products", method = RequestMethod.GET)
    public ModelAndView getProductView() {
        ModelAndView productView = null;
        try {
            productView = new ModelAndView("products");
            productView.addObject("productList", productService.getAllProducts());
            productView.addObject("departmentList", new DepartmentServiceImpl().getAllDepartments());
            logger.info("Product modelAndView created and return successfully.");
        } catch (Exception e) {
            logger.error("Product modelAndView was failed to create: " + e +".");
        }
        return productView;
    }

    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
    public List<Product> addProduct(@RequestBody Product product) {
        try {
            productService.createProduct(product);
            logger.info("New product: " + product.getProductName() +  " created successfully.");
        } catch (Exception e) {
            logger.error("Creation of product: " + product.getProductName() +  " was failed: " + e +".");
        }
        return productService.getAllProducts();
    }

    @RequestMapping(value = "/editProduct", method = RequestMethod.POST)
    public List<Product> editProduct(@RequestBody Product product) {
        try {
            productService.updateProduct(product);
            logger.info("Product with ID " + product.getProductId() + " was edited successfully.");
        } catch (Exception e) {
            logger.error("Edition of product with ID: " + product.getProductId() +  " was failed: " + e +".");
        }
       return productService.getAllProducts();
    }

    @RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
    public List<Product> deleteProduct(@RequestBody Product product) {
        try {
            productService.deleteProductById(product.getProductId());
            logger.info("Product with ID " + product.getProductId() + " was deleted successfully.");
        } catch (Exception e) {
            logger.error("Deleting of product with ID: " + product.getProductId() +  " was failed: " + e +".");
        }
        return productService.getAllProducts();
    }

    @RequestMapping(value = "getProductById{id}", method = RequestMethod.GET)
    public ModelAndView getProductById(@RequestParam int id) {
        ModelAndView modelAndView = null;
        try {
            modelAndView = new ModelAndView("productById");
            modelAndView.addObject("product", productService.getProductById(id));
            logger.info("ModelAndView was formed for product with ID " + id + " and returned successfully.");
        } catch (Exception e) {
            logger.error("Forming of ModelAndView for product with ID: " + id +  " was failed: " + e +".");
        }
        return modelAndView;
    }

    @RestController
    @RequestMapping("/rest")
    private class ProductControllerRest {

        @RequestMapping(value = "/products", method = RequestMethod.GET)
        public List getProductsRest() {
            return productService.getAllProducts();
        }

        @RequestMapping(value = "/addProduct{name}{depId}", method = RequestMethod.GET)
        public List addProductRest(@RequestParam String name, @RequestParam int depId) {
            if (!name.equals(null) && depId > 0) {
                Product product = new Product();
                product.setProductName(name);
                product.setDepartmentId(depId);
                try {
                    productService.createProduct(product);
                } catch (Exception e) {
                    logger.error("Creation of product: " + product.getProductName() +  " was failed: " + e +".");
                }
            }
            return productService.getAllProducts();
        }

        @RequestMapping(value = "/editProduct{id}{name}{depId}", method = RequestMethod.GET)
        public List addProductRest(@RequestParam int id, @RequestParam String name, @RequestParam int depId) {
            if (!name.equals(null) && depId > 0) {
                Product product = new Product();
                product.setProductId(id);
                product.setProductName(name);
                product.setDepartmentId(depId);
                try {
                    productService.updateProduct(product);
                } catch (Exception e) {
                    logger.error("Edition of product with ID: " + product.getProductId() +  " was failed: " + e +".");
                }
            }
            return productService.getAllProducts();
        }

        @RequestMapping(value = "/deleteProduct{id}", method = RequestMethod.GET)
        public List addProductRest(@RequestParam int id) {
            if (id > 0) {
                try {
                    productService.deleteProductById(id);
                    logger.info("Product with ID " + id + " was deleted successfully.");
                } catch (Exception e) {
                    logger.error("Deleting of product with ID: " + id +  " was failed: " + e +".");
                }
            }
            return productService.getAllProducts();
        }

        @RequestMapping(value = "/getProduct{id}", method = RequestMethod.GET)
        public Product getProductByIdRest(@RequestParam int id) {
            return productService.getProductById(id);
        }
    }
}
