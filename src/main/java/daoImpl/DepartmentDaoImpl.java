package daoImpl;

import businessLogic.Util;
import dao.DepartmentDao;
import model.Department;
import org.apache.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDaoImpl implements DepartmentDao {

    private static final Logger logger = Logger.getRootLogger();

    @Override
    public void createDepartment(Department department) {
        PreparedStatement preparedStatement = null;
        Connection connection = Util.connection();
        try {
            preparedStatement = connection.prepareStatement("INSERT INTO departments (department_id, department_name) VALUES (department_seq.nextval, ?)");
            preparedStatement.setString(1, department.getDepartmentName());
            preparedStatement.executeUpdate();
            logger.info("Department was created successfully.");
        } catch (SQLException e) {
            logger.error("Department creating was failed.", e);
        } finally {
            Util.close(preparedStatement, connection);
        }
    }

    @Override
    public void editDepartment(Department department) {
        Statement statement = null;
        Connection connection = Util.connection();
        try {
            statement = connection.createStatement();
            statement.executeUpdate("UPDATE departments SET department_name = '" + department.getDepartmentName() + "' WHERE department_id = " + department.getDepartmentId());
            logger.info("Department was edited successfully.");
        } catch (SQLException e) {
            logger.error("Department editing was failed.", e);
        } finally {
            Util.close(statement, connection);
        }
    }

    @Override
    public void deleteDepartmentById(int department_id) {
        Statement statement = null;
        Connection connection = Util.connection();
        try {
            statement = connection.createStatement();
            statement.executeUpdate("DELETE FROM departments WHERE department_id = " + department_id);
            logger.info("Department was deleted successfully.");
        } catch (SQLException e) {
            logger.error("Department deleting was failed.", e);
        } finally {
            Util.close(statement, connection);
        }
    }

    @Override
    public Department getDepartmentById(int department_id) {
        Statement statement = null;
        Connection connection = Util.connection();
        Department department = new Department();
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM departments WHERE department_id = " + department_id);
            resultSet.next();
            department.setDepartmentId(resultSet.getInt("department_id"));
            department.setDepartmentName(resultSet.getString("department_name"));
            logger.info("Department with id: " + department_id + " was found successfully.");
        } catch (SQLException e) {
            department = null;
            logger.error("Department with id: " + department_id + " was not found.");
        } finally {
            Util.close(statement, connection);
        }
        return department;
    }

    @Override
    public List getAllDepartments() {
        Statement statement = null;
        Connection connection = Util.connection();
        ArrayList<Department> departmentList = new ArrayList<>();
        try {
            statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM departments");
            while (resultSet.next()) {
                Department department = new Department();
                department.setDepartmentId(resultSet.getInt("department_id"));
                department.setDepartmentName(resultSet.getString("department_name"));
                departmentList.add(department);
            }
            logger.info("All departments were got successfully.");
        } catch (SQLException e) {
            logger.error("Departments were not got", e);
        } finally {
            Util.close(statement, connection);
        }
        return departmentList;
    }
}
