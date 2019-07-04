package daoImpl;

import businessLogic.Util;
import dao.ProductDao;
import model.Product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDaoImpl implements ProductDao {
    @Override
    public void createProduct(Product product) {
        PreparedStatement preparedStatement = null;
        Connection connection = Util.connection();
        try {
            if(product.getProductId() <= 0) {
                preparedStatement = connection.prepareStatement("INSERT INTO products (product_id, product_name, department_id) VALUES (product_seq.nextval, ?, ?)");
                preparedStatement.setString(1, product.getProductName());
                preparedStatement.setInt(2, product.getDepartmentId());
            } else {
                preparedStatement = connection.prepareStatement("INSERT INTO products (product_id, product_name, department_id) VALUES (?, ?, ?)");
                preparedStatement.setInt(1, product.getProductId());
                preparedStatement.setString(2, product.getProductName());
                preparedStatement.setInt(3, product.getDepartmentId());
            }
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Util.close(preparedStatement, connection);
        }
    }

    @Override
    public void editProduct(Product product) {
        Statement statement = null;
        Connection connection = Util.connection();
        try {

            if (!product.getProductName().equals("")) {
                statement = connection.createStatement();
                statement.executeUpdate("UPDATE products SET product_name = '" + product.getProductName() + "' WHERE product_id = " + product.getProductId());
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
        } catch (SQLException e) {
            e.printStackTrace();
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
        } catch (SQLException e) {
            e.printStackTrace();
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
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Util.close(statement, connection);

        }
        return productList;
    }


}
