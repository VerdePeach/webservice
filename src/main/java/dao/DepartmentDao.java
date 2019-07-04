package dao;

import model.Department;

import java.sql.SQLException;
import java.util.List;

public interface DepartmentDao {
    void createDepartment(Department department);
    void editDepartment(Department department);
    void deleteDepartmentById(int department_id);
    Department getDepartmentById(int department_id);
    List getAllDepartments();
}
