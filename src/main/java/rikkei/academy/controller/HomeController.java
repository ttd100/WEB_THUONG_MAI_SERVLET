package rikkei.academy.controller;

import rikkei.academy.model.Product;
import rikkei.academy.service.product.IProductService;
import rikkei.academy.service.product.ProductServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    IProductService productService = new ProductServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("home/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String search = request.getParameter("search");
        List<Product> productList = productService.findByCategoryAndByName(search.trim());
        request.setAttribute("productList", productList);
        request.getRequestDispatcher("home/home.jsp").forward(request, response);

    }
}
