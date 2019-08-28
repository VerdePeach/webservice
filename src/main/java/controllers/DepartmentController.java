package controllers;

import model.Department;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import services.DepartmentService;
import services.servicesImp.DepartmentServiceImpl;

import java.util.List;

@RestController
public class DepartmentController {

    private static final Logger logger = Logger.getRootLogger();

    private DepartmentService departmentService = new DepartmentServiceImpl();

    @RequestMapping(value = "/departments", method = RequestMethod.GET)
    public ModelAndView getDepartmentView() {
        ModelAndView departmentView = null;
        try {
            departmentView = new ModelAndView("departments");
            departmentView.addObject("departmentList", departmentService.getAllDepartments());
            logger.info("Department modelAndView created and return successfully.");
        } catch (Exception e) {
            logger.error("Department modelAndView was failed to create: " + e +".");
        }
        return departmentView;
    }

    @RequestMapping(value = "/rest/departments", method = RequestMethod.GET)
    public List getDepartments() {
        return departmentService.getAllDepartments();
    }

    @RequestMapping(value = "/addDepartment", method = RequestMethod.POST)
    public List<Department> addDepartment(@RequestBody Department department) {
        try {
            departmentService.createDepartment(department);
            logger.info("New department: " + department.getDepartmentName() +  " created successfully.");
        } catch (Exception e) {
            logger.error("Creation of department: " + department.getDepartmentName() +  " was failed: " + e +".");
        }
        return departmentService.getAllDepartments();
    }

    @RequestMapping(value = "/rest/addDepartment{name}", method = RequestMethod.GET)
    public List addDepartmentRest(@RequestParam String name) {
        Department department = null;
        if (!name.equals("")) {
            department = new Department();
            department.setDepartmentName(name);
            try {
                departmentService.createDepartment(department);
            } catch (Exception e) {
                logger.error("Creation of department: " + department.getDepartmentName() +  " was failed: " + e +".");
            }
        }
        return departmentService.getAllDepartments();
    }

    @RequestMapping(value = "/editDepartment", method = RequestMethod.POST)
    public List<Department> editDepartment(@RequestBody Department department) {
        try {
            departmentService.updateDepartment(department);
            logger.info("Department with ID " + department.getDepartmentId() + " was edited successfully.");
        } catch (Exception e) {
            logger.error("Edition of department with ID: " + department.getDepartmentId() +  " was failed: " + e +".");
        }
        return departmentService.getAllDepartments();
    }

    @RequestMapping(value = "/rest/editDepartment{id}{name}", method = RequestMethod.GET)
    public List editDepartmentRest(@RequestParam int id, @RequestParam String name) {
        Department department = null;
        if (!name.equals(null) && id > 0 ) {
            department = new Department();
            department.setDepartmentName(name);
            department.setDepartmentId(id);
            try {
                departmentService.updateDepartment(department);
            } catch (Exception e) {
                logger.error("Edition of department with ID: " + department.getDepartmentId() +  " was failed: " + e +".");
            }
        }
        return departmentService.getAllDepartments();
    }

    @RequestMapping(value = "/deleteDepartment", method = RequestMethod.POST)
    public  List<Department> deleteDepartment(@RequestBody Department department) {
        try {
            departmentService.deleteDepartmentById(department.getDepartmentId());
            logger.info("Department with ID " + department.getDepartmentId() + " was deleted successfully.");
        } catch (Exception e) {
            logger.error("Deleting of department with ID: " + department.getDepartmentId() +  " was failed: " + e +".");
        }
        return departmentService.getAllDepartments();
    }

    @RequestMapping(value = "/rest/deleteDepartment{id}", method = RequestMethod.GET)
    public List editDepartmentRest(@RequestParam int id) {
        if (id > 0 ) {
            try {
                departmentService.deleteDepartmentById(id);
                logger.info("Department with ID " + id + " was deleted successfully.");
            } catch (Exception e) {
                logger.error("Deleting of department with ID: " + id +  " was failed: " + e +".");
            }
        }
        return departmentService.getAllDepartments();
    }

    @RequestMapping(value = "/getDepartmentById{id}", method = RequestMethod.GET)
    public ModelAndView getDepartmentById(@RequestParam int id) {
        ModelAndView modelAndView = null;
        try {
            modelAndView = new ModelAndView("departmentById");
            Department department = departmentService.getDepartmentById(id);
            if(department == null){
                throw new Exception("Department did not find");
            }
            modelAndView.addObject("department", department);
            logger.info("ModelAndView was formed for department with ID " + id + " and returned successfully.");
        } catch (Exception e) {
            logger.error("Forming of ModelAndView for department with ID: " + id +  " was failed: " + e +".");
            return getDepartmentView();
        }
        return modelAndView;
    }

    @RequestMapping(value = "/rest/getDepartment{id}", method = RequestMethod.GET)
    public Department getDepartmentRest(@RequestParam int id) {
        return departmentService.getDepartmentById(id);
    }
}
