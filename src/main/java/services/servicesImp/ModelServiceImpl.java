package services.servicesImp;

import dao.ModelDao;
import daoImpl.ModelDaoImpl;
import model.Model;
import services.ModelService;

import java.util.List;

public class ModelServiceImpl implements ModelService {

    private ModelDao modelDao = new ModelDaoImpl();

    @Override
    public void createModel(Model model) {
        modelDao.createModel(model);
    }

    @Override
    public void updateModel(Model model) {
        modelDao.editModel(model);
    }

    @Override
    public void deleteModelById(int model_id) {
        modelDao.deleteModelById(model_id);
    }

    @Override
    public Model getModelById(int model_id) {
        return modelDao.getModelById(model_id);
    }

    @Override
    public List getAllModels() {
        return modelDao.getAllModels();
    }
}
