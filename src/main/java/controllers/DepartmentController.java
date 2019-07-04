package controllers;

import model.Department;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import services.DepartmentService;
import services.servicesImp.DepartmentServiceImpl;

import java.util.ArrayList;
import java.util.List;

@RestController
public class DepartmentController {

    private static DepartmentService departmentService = new DepartmentServiceImpl();
/*
    @RequestMapping(value = "/get", method = RequestMethod.GET)
    public ModelAndView getStartPage() {
        return new ModelAndView("index");
    }
*/

    @RequestMapping(value = "/getAllDepartments", method = RequestMethod.GET)
    public List<Department> getAllDepartments() {
        return departmentService.getAllDepartments();
    }

    @RequestMapping(value = "/getDepartmentById{id}", method = RequestMethod.GET)
    public Department getDepartmentById(@RequestParam int id) {
        return departmentService.getDepartmentById(id);
    }

    @RequestMapping(value = "/updateDepartment{id}{depname}", method = RequestMethod.GET) //RequestMethod.PUT
    public Department updateDepartment(@RequestParam int id, @RequestParam String depname) {
        departmentService.updateDepartment(new Department(id, depname));
        return getDepartmentById(id);
    }

    @RequestMapping(value = "/deleteDepartmentById{id}", method = RequestMethod.GET) //RequestMethod.DELETE
    public boolean deleteDepartmentById(@RequestParam int id) {
        departmentService.deleteDepartmentById(id);
        Department department = departmentService.getDepartmentById(id);
        return (department != null) ? true : false;
    }

    @RequestMapping(value = "/createDepartment{id}{depname}", method = RequestMethod.GET) //RequestMethod.POST
    public boolean createDepartment(@RequestParam int id, @RequestParam String depname) {
        departmentService.createDepartment(new Department(id, depname));
        Department department = departmentService.getDepartmentById(id);
        return (department != null) ? true : false;
    }
}
