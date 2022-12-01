package rikkei.academy.service.category;

import rikkei.academy.config.ConnectMySQL;
import rikkei.academy.model.Category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CategoryServiceIMPL implements ICategoryService {
    private Connection connection = ConnectMySQL.getConnection();
    private static final String CREATE_CATEGORY = "INSERT INTO category(name) values (?);";
    private static final String LIST_CATEGORY = "SELECT * FROM category";
    private static final String CATEGORY_BY_ID = "SELECT * FROM category WHERE id=?;";
    private static final String UPDATE_CATEGORY = "UPDATE category SET name=? where id=?;";
    private static final String DELETE_CATEGORY = "DELETE FROM category WHERE id=?";
    private static final String SEARCH_BY_NAME = "SELECT *FROM category where name like ?";

    @Override
    public List<Category> findAll() {
        List<Category> categoryList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(LIST_CATEGORY);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                Category category = new Category(id, name);
                categoryList.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }

    @Override
    public void save(Category category) {
        try {
            if (findById(category.getCategoryId()) == null) {
                PreparedStatement ps = connection.prepareStatement(CREATE_CATEGORY);
                ps.setString(1, category.getCategoryName());
                ps.executeUpdate();
            } else {
                PreparedStatement ps = connection.prepareStatement(UPDATE_CATEGORY);
                ps.setString(1, category.getCategoryName());
                ps.setInt(2, category.getCategoryId());
                ps.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Category findById(int id) {
        Category category = null;
        try {
            PreparedStatement ps = connection.prepareStatement(CATEGORY_BY_ID);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                category = new Category(id, name);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return category;
    }

    @Override
    public void deleteById(int id) {
        try {
            PreparedStatement ps = connection.prepareStatement(DELETE_CATEGORY);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Category> findByName(String nameSearch) {
        List<Category> categoryList = new ArrayList<>();
        try {
            PreparedStatement ps = connection.prepareStatement(SEARCH_BY_NAME);
            ps.setString(1, '%' + nameSearch + '%');
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                Category category = new Category(id, name);
                categoryList.add(category);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return categoryList;
    }
}
