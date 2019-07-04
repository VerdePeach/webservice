package daoImpl;

import businessLogic.Util;
import dao.DepartmentDao;
import model.Department;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDaoImpl implements DepartmentDao {
    @Override
    public void createDepartment(Department department) {
        PreparedStatement preparedStatement = null;
        Connection connection = Util.connection();
        try {
            if(department.getDepartmentId() <= 0) {
                preparedStatement = connection.prepareStatement("INSERT INTO departments (department_id, department_name) VALUES (department_seq.nextval, ?)");
                preparedStatement.setString(1, department.getDepartmentName());
            } else {
                preparedStatement = connection.prepareStatement("INSERT INTO departments (department_id, department_name) VALUES (?, ?)");
                preparedStatement.setInt(1, department.getDepartmentId());
                preparedStatement.setString(2, department.getDepartmentName());
            }
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Util.close(preparedStatement, connection);
        }
    }

    @Override
    public void editDepartment(Department department) {
        Statement statement = null;
        Connection connection = Util.connection();
        try {

            if (!department.getDepartmentName().equals("")) {
                statement = connection.createStatement();
                statement.executeUpdate("UPDATE departments SET department_name = '" + department.getDepartmentName() + "' WHERE department_id = " + department.getDepartmentId());
            }
        } catch (SQLException e) {
            e.printStackTrace();
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
        } catch (SQLException e) {
            e.printStackTrace();
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
        } catch (SQLException e) {
            e.printStackTrace();
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
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Util.close(statement, connection);
        }
        return departmentList;
    }
}
