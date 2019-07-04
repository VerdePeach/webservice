package services;

import model.Model;

import java.util.List;

public interface ModelService {
    void createModel(Model model);
    void updateModel(Model model);
    void deleteModelById(int model_id);
    Model getModelById(int model_id);
    List getAllModels();
}
