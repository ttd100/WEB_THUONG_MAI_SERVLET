package rikkei.academy.model;

public class Product {

    private int id;
    private String name;
    private Category category;
    private float price;
    private String image;
    private int quantity;
    private int stock;
    private int idCat;

    public int getIdCat() {
        return idCat;
    }

    public void setIdCat(int idCat) {
        this.idCat = idCat;
    }

    public Product() {
    }

    public Product(int id, String name, Category category, float price, String image, int quantity) {
        this.id = id;
        this.name = name;
        this.category = category;
        this.price = price;
        this.image = image;
        this.quantity = quantity;
        this.setIdCat(category.getCategoryId());
    }

    public Product(String name, int category, float price, String image, int qty) {
        this.name = name;
        this.idCat = category;
        this.price = price;
        this.image = image;
        this.quantity = qty;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
        this.setIdCat(category.getCategoryId());
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }


    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", category=" + category +
                ", price=" + price +
                ", image='" + image + '\'' +
                ", quantity=" + quantity +
                ", idCat=" + idCat +
                '}';
    }

}
