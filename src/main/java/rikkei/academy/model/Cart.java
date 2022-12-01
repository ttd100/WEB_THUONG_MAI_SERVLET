package rikkei.academy.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Cart {

    private int id;

    private User user;

    private CartStatus status;

    private Date created;

    private Date changed;

    private List<Product> products = new ArrayList<>();

    public Cart() {
    }

    public Cart(int id, User user, CartStatus status) {
        this.id = id;
        this.user = user;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(String created) {
        try {
            this.created = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(created);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public Date getChanged() {
        return changed;
    }

    public void setChanged(String changed) {
        try {
            this.changed = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(changed);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public CartStatus getStatus() {
        return status;
    }

    public void setStatus(CartStatus status) {
        this.status = status;
    }

    public float getTotal() {
        float total = 0;

        for (Product p : products) {
            total += p.getPrice() * p.getQuantity();
        }

        return total;
    }
}
