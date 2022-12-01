package rikkei.academy.controller;

import rikkei.academy.model.Category;
import rikkei.academy.service.category.CategoryServiceIMPL;
import rikkei.academy.service.category.ICategoryService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(value = "/category")
public class CategoryController extends HttpServlet {
    private final ICategoryService categoryService = new CategoryServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            req.setCharacterEncoding("UTF-8");
            String action = req.getParameter("action");
            if(action==null){
                action="";
            }
            switch (action){
                case "create":
                    showFormCreate(req,resp);
                    break;
                case "edit":
                    showFormEdit(req, resp);
                    break;
                case "delete":
                    showFormDelete(req, resp);
                    break;
                default:
                    showListCategory(req, resp);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            req.setCharacterEncoding("UTF-8");
            String action = req.getParameter("action");
            if(action==null){
                action="";
            }
            switch (action){
                case "create":
                    actionCreate(req, resp);
                    break;
                case "edit":
                    actionEdit(req, resp);
                    break;
                case "delete":
                    actionDelete(req, resp);
                    break;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void showListCategory(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        List<Category> categoryList = categoryService.findAll();
        req.setAttribute("categoryList", categoryList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("category/list.jsp");
        dispatcher.forward(req, resp);
    }

    public void showFormCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("category/create.jsp");
        dispatcher.forward(req, resp);
    }

    public void actionCreate(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        String name = req.getParameter("name");
        Category category = new Category(name);
        categoryService.save(category);
        req.setAttribute("message", "create success");
        RequestDispatcher dispatcher = req.getRequestDispatcher("category/create.jsp");
        dispatcher.forward(req, resp);
    }

    public void showFormDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("category/delete.jsp");
        dispatcher.forward(req, resp);
    }

    public void actionDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(req.getParameter("id"));
        categoryService.deleteById(id);
        req.setAttribute("message", "delete category success");
        RequestDispatcher dispatcher = req.getRequestDispatcher("category/delete.jsp");
        dispatcher.forward(req, resp);
    }

    public void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryService.findById(id);
        request.setAttribute("category", category);
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/edit.jsp");
        dispatcher.forward(request, response);
    }

    public void actionEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Category category = categoryService.findById(id);
        String name = request.getParameter("name");
        category.setCategoryName(name);
        categoryService.save(category);
        request.setAttribute("message", "edit category success");
        RequestDispatcher dispatcher = request.getRequestDispatcher("category/edit.jsp");
        dispatcher.forward(request, response);
    }
}
