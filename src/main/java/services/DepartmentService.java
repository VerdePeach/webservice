package services;

import model.Department;
import java.util.List;

public interface DepartmentService {
    void createDepartment(Department department);
    void updateDepartment(Department department);
    void deleteDepartmentById(int department_id);
    Department getDepartmentById(int department_id);
    List getAllDepartments();
}
