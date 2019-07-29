package daoImpl;

import businessLogic.Util;
import dao.ProductDao;
import model.Product;
import org.apache.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao {

    private static final Logger logger = Logger.getRootLogger();

    @Override
    public void createProduct(Product product) {
        PreparedStatement preparedStatement = null;
        Connection connection = Util.connection();
        try {
            preparedStatement = connection.prepareStatement("INSERT INTO products (product_id, product_name, department_id) VALUES (product_seq.nextval, ?, ?)");
            preparedStatement.setString(1, product.getProductName());
            preparedStatement.setInt(2, product.getDepartmentId());
            preparedStatement.executeUpdate();
            logger.info("Product was created successfully.");
        } catch (SQLException e) {
            logger.error("Product creating was failed.", e);
        } finally {
            Util.close(preparedStatement, connection);
        }
    }

    @Override
    public void editProduct(Product product) {
        PreparedStatement statement = null;
        Connection connection = Util.connection();
        try {
            statement = connection.prepareStatement("UPDATE products SET product_name = ?, department_id = ? WHERE product_id = ?");
            statement.setString(1,product.getProductName());
            statement.setInt(2,product.getDepartmentId());
            statement.setInt(3,product.getProductId());
            statement.executeUpdate();
            logger.info("Product was edited successfully.");
        } catch (SQLException e) {
            logger.error("Product editing was failed.", e);
        } finally {
            Util.close(statement, connection);
        }
    }

    @Override
    public void deleteProductById(int product_id) {
        Statement statement = null;
        Connection connection = Util.connection();
        try {
            statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM products WHERE product_id = " + product_id);
            logger.info("Product was deleted successfully.");
        } catch (SQLException e) {
            logger.error("Product deleting was failed.", e);
        } finally {
            Util.close(statement, connection);
        }
    }

    @Override
    public Product getProductById(int product_id) {
        Statement statement = null;
        Connection connection = Util.connection();
        Product product = new Product();
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM products WHERE product_id = " + product_id);
            resultSet.next();
            product.setProductId(resultSet.getInt("product_id"));
            product.setProductName(resultSet.getString("product_name"));
            product.setDepartmentId(resultSet.getInt("department_id"));
            logger.info("Product with id: " + product_id + " was found successfully.");
        } catch (SQLException e) {
            logger.error("Product with id: " + product_id + " was not found.");
        } finally {
            Util.close(statement, connection);
        }
        return product;
    }

    @Override
    public List getAllProducts() {
        Statement statement = null;
        Connection connection = Util.connection();
        ArrayList<Product> productList = new ArrayList<>();
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM products");
            while (resultSet.next()) {
                Product product = new Product();
                product.setProductId(resultSet.getInt("product_id"));
                product.setProductName(resultSet.getString("product_name"));
                product.setDepartmentId(resultSet.getInt("department_id"));
                productList.add(product);
            }
            logger.info("All products were got successfully.");
        } catch (SQLException e) {
            logger.error("Products were not got", e);
        } finally {
            Util.close(statement, connection);
        }
        return productList;
    }
}
