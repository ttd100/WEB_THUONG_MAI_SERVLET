package rikkei.academy.service.product;

import rikkei.academy.model.Category;
import rikkei.academy.model.Product;

import java.util.List;

public interface IProductService {
    List<Product> findAll();
    void save(Product product);
    Product findById(int id);
    void delete(int id);
    List<Product> findByCategoryAndByName(String category);
}
