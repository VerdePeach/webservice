package services.servicesImp;

import dao.DepartmentDao;
import daoImpl.DepartmentDaoImpl;
import model.Department;
import services.DepartmentService;

import java.util.List;

public class DepartmentServiceImpl implements DepartmentService {

    private DepartmentDao departmentDao = new DepartmentDaoImpl();

    @Override
    public void createDepartment(Department department) {
        departmentDao.createDepartment(department);
    }

    @Override
    public void updateDepartment(Department department) {
        departmentDao.editDepartment(department);
    }

    @Override
    public void deleteDepartmentById(int department_id) {
        departmentDao.deleteDepartmentById(department_id);
    }

    @Override
    public Department getDepartmentById(int department_id) {
        return departmentDao.getDepartmentById(department_id);
    }

    @Override
    public List getAllDepartments() {
        return departmentDao.getAllDepartments();
    }
}
