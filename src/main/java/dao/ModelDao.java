package dao;

import model.Model;

import java.util.List;

public interface ModelDao {
    void createModel(Model model);
    void editModel(Model model);
    void deleteModelById(int model_id);
    Model getModelById(int model_id);
    List getAllModels();
}
