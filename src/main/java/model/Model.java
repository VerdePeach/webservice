package model;

public class Model {
    private int modelId;
    private String modelName;
    private int baseModelId;
    private int productId;
    private float price;
    private float maxSpeed;
    private String fuel;
    private String engine;

    public Model() {
    }

    public Model(int modelId, String modelName, int baseModelId, int productId) {
        this.modelId = modelId;
        this.modelName = modelName;
        this.baseModelId = baseModelId;
        this.productId = productId;
    }

    public int getModelId() {
        return modelId;
    }

    public void setModelId(int modelId) {
        this.modelId = modelId;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public int getBaseModelId() {
        return baseModelId;
    }

    public void setBaseModelId(int baseModelId) {
        this.baseModelId = baseModelId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getMaxSpeed() {
        return maxSpeed;
    }

    public void setMaxSpeed(float maxSpeed) {
        this.maxSpeed = maxSpeed;
    }

    public String getFuel() {
        return fuel;
    }

    public void setFuel(String fuel) {
        this.fuel = fuel;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }
}
