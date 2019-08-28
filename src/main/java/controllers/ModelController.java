package controllers;

import model.Department;
import model.Model;
import model.Product;
import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import services.ModelService;
import services.ProductService;
import services.servicesImp.ModelServiceImpl;
import services.servicesImp.ProductServiceImpl;

import java.util.List;


@RestController
public class ModelController {

    private static final Logger logger = Logger.getRootLogger();
    private ModelService modelService = new ModelServiceImpl();

    @RequestMapping(value = "/models", method = RequestMethod.GET)
    public ModelAndView getModels() {
        ModelAndView modelAndView = null;
        try {
            modelAndView = new ModelAndView("models");
            modelAndView.addObject("modelList", modelService.getAllModels());
            modelAndView.addObject("productList", new ProductServiceImpl().getAllProducts());
            logger.info("Model modelAndView created and return successfully.");
        } catch (Exception e) {
            logger.error("Model modelAndView was failed to create: " + e +".");
        }
        return modelAndView;
    }

    @RequestMapping(value = "/addModel", method = RequestMethod.POST)
    public List<Model> addModel(@RequestBody Model model) {
        try {
            modelService.createModel(model);
            logger.info("New model: " + model.getModelName() +  " created successfully.");
        } catch (Exception e) {
            logger.error("Creation of model: " + model.getModelName() +  " was failed: " + e +".");
        }
        return modelService.getAllModels();
    }

    @RequestMapping(value = "/editModel", method = RequestMethod.POST)
    public List<Model> editModel(@RequestBody Model model) {
        try {
            modelService.updateModel(model);
            logger.info("Model with ID " + model.getModelId() + " was edited successfully.");
        } catch (Exception e) {
            logger.error("Edition of model with ID: " + model.getModelId() +  " was failed: " + e +".");
        }
        return modelService.getAllModels();
    }

    @RequestMapping(value = "/deleteModel", method = RequestMethod.POST)
    public List<Model> deleteModel(@RequestBody Model model) {
        try {
            modelService.deleteModelById(model.getModelId());
            logger.info("Model with ID " + model.getModelId() + " was deleted successfully.");
        } catch (Exception e) {
            logger.error("Deleting of model with ID: " + model.getModelId() +  " was failed: " + e +".");
        }

        return modelService.getAllModels();
    }

    @RequestMapping(value = "/getModelById", method = RequestMethod.GET)
    public ModelAndView getModelById(@RequestParam int id) {
        ModelAndView modelAndView = null;
        try {
            modelAndView = new ModelAndView("modelById");
            modelAndView.addObject("model", modelService.getModelById(id));
            logger.info("ModelAndView was formed for model with ID " + id + " and returned successfully.");
        } catch (Exception e) {
            logger.error("Forming of ModelAndView for model with ID: " + id +  " was failed: " + e +".");
        }
        return modelAndView;
    }

    @RestController
    @RequestMapping("/rest")
    private class RestModelController {

        @RequestMapping(value = "/models", method = RequestMethod.GET)
        public List getModelsRest() {
            return  modelService.getAllModels();
        }

        @RequestMapping(value = "/addModel{name}{baseModelId}{productId}{price}{maxSpeed}{fuel}{engine}", method = RequestMethod.GET)
        public List<Model> addModelRest(@RequestParam String name, @RequestParam int baseModelId, @RequestParam int productId,
                                    @RequestParam float price, @RequestParam float maxSpeed, @RequestParam String fuel,
                                    @RequestParam String engine) {
            if (!name.equals(null) && baseModelId > 0 && productId > 0) {
                Model model = new Model();
                model.setModelName(name);
                model.setBaseModelId(baseModelId);
                model.setProductId(productId);
                model.setPrice(price);
                model.setMaxSpeed(maxSpeed);
                model.setFuel(fuel);
                model.setEngine(engine);
                try {
                    modelService.createModel(model);
                } catch (Exception e) {
                    logger.error("Creation of model: " + model.getModelName() +  " was failed: " + e +".");
                }
            }
            return modelService.getAllModels();
        }

        @RequestMapping(value = "/editModel{id}{name}{baseModelId}{productId}{price}{maxSpeed}{fuel}{engine}", method = RequestMethod.GET)
        public List<Model> editModelRest(@RequestParam int id, @RequestParam String name, @RequestParam int baseModelId, @RequestParam int productId,
                                    @RequestParam float price, @RequestParam float maxSpeed, @RequestParam String fuel,
                                    @RequestParam String engine) {
            if (!name.equals(null) && baseModelId > 0 && productId > 0) {
                Model model = new Model();
                model.setModelId(id);
                model.setModelName(name);
                model.setBaseModelId(baseModelId);
                model.setProductId(productId);
                model.setPrice(price);
                model.setMaxSpeed(maxSpeed);
                model.setFuel(fuel);
                model.setEngine(engine);
                try {
                    modelService.updateModel(model);
                } catch (Exception e) {
                    logger.error("Creation of model: " + model.getModelName() +  " was failed: " + e +".");
                }
            }
            return modelService.getAllModels();
        }

        @RequestMapping(value = "/deleteModel{id}", method = RequestMethod.GET)
        public List deleteModelRest(@RequestParam int id) {
            try {
                modelService.deleteModelById(id);
                logger.info("Model with ID " + id + " was deleted successfully.");
            } catch (Exception e) {
                logger.error("Deleting of model with ID: " + id +  " was failed: " + e +".");
            }
            return  modelService.getAllModels();
        }

        @RequestMapping(value = "/getModel{id}", method = RequestMethod.GET)
        public Model getModelRest(@RequestParam int id) {
            return  modelService.getModelById(id);
        }
    }
}
