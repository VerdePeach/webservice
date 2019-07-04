package daoImpl;

import businessLogic.Util;
import dao.ModelDao;
import model.Department;
import model.Model;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ModelDaoImpl implements ModelDao {
    @Override
    public void createModel(Model model) {
        PreparedStatement preparedStatement = null;
        Connection connection = Util.connection();
        try {
            if(model.getModelId() <= 0) {
                preparedStatement = connection.prepareStatement("INSERT INTO models (model_id, model_name, base_model_id, product_id, price, max_speed, fuel, engine) VALUES (models_seq.nextval, ?, ?, ?, ?, ?, ?, ?)");
                preparedStatement.setString(1, model.getModelName());
                preparedStatement.setInt(2, model.getBaseModelId());
                preparedStatement.setInt(3, model.getProductId());
                preparedStatement.setFloat(4, model.getPrice());
                preparedStatement.setFloat(5, model.getMaxSpeed());
                preparedStatement.setString(6, model.getFuel());
                preparedStatement.setString(7, model.getEngine());
            } else {
                preparedStatement = connection.prepareStatement("INSERT INTO models (model_id, model_name, base_model_id, product_id, price, max_speed, fuel, engine) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
                preparedStatement.setInt(1, model.getModelId());
                preparedStatement.setString(2, model.getModelName());
                preparedStatement.setInt(3, model.getBaseModelId());
                preparedStatement.setInt(4, model.getProductId());
                preparedStatement.setFloat(5, model.getPrice());
                preparedStatement.setFloat(6, model.getMaxSpeed());
                preparedStatement.setString(7, model.getFuel());
                preparedStatement.setString(8, model.getEngine());
            }
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Util.close(preparedStatement, connection);
        }
    }

    @Override
    public void editModel(Model model) {
        PreparedStatement preparedStatement = null;
        Connection connection = Util.connection();
        try {
            if (!model.getModelName().equals("") && model.getBaseModelId() > 0 && model.getProductId() > 0 && model.getMaxSpeed() > 0) {
                preparedStatement = connection.prepareStatement("UPDATE models SET model_name = ?, base_model_id = ?, product_id = ?, price = ?, max_speed = ?, fuel = ?, engine = ? WHERE model_id = " + model.getModelId());
                preparedStatement.setString(1, model.getModelName());
                preparedStatement.setInt(2, model.getBaseModelId());
                preparedStatement.setInt(3, model.getProductId());
                preparedStatement.setFloat(4, model.getPrice());
                preparedStatement.setFloat(5, model.getMaxSpeed());
                preparedStatement.setString(6, model.getFuel());
                preparedStatement.setString(7, model.getEngine());
                preparedStatement.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Util.close(preparedStatement, connection);
        }
    }

    @Override
    public void deleteModelById(int model_id) {
        Statement statement = null;
        Connection connection = Util.connection();
        try {
            statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM models WHERE model_id = " + model_id);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Util.close(statement, connection);
        }
    }

    @Override
    public Model getModelById(int model_id) {
        Statement statement = null;
        Connection connection = Util.connection();
        Model model = new Model();
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM models WHERE model_id = " + model_id);
            resultSet.next();
            setModel(resultSet, model);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Util.close(statement, connection);
        }
        return model;
    }

    @Override
    public List getAllModels() {
        Statement statement = null;
        Connection connection = Util.connection();
        ArrayList<Model> modelList = new ArrayList<>();
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM models");
            while (resultSet.next()) {
                Model model = new Model();
                setModel(resultSet, model);
                modelList.add(model);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Util.close(statement, connection);
        }
        return modelList;
    }

    private void setModel(ResultSet resultSet, Model model) throws SQLException {
        model.setModelId(resultSet.getInt("model_id"));
        model.setModelName(resultSet.getString("model_name"));
        model.setBaseModelId(resultSet.getInt("base_model_id"));
        model.setProductId(resultSet.getInt("product_id"));
        model.setPrice(resultSet.getFloat("price"));
        model.setMaxSpeed(resultSet.getFloat("max_speed"));
        model.setFuel(resultSet.getString("fuel"));
        model.setEngine(resultSet.getString("engine"));
    }
}
