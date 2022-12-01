package rikkei.academy.controller;

import rikkei.academy.model.Role;
import rikkei.academy.model.User;
import rikkei.academy.service.user.IUserService;
import rikkei.academy.service.user.UserServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet(value = "/profile")
public class ProfileController extends HttpServlet {
    IUserService userService = new UserServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "";
        switch (action) {
            case "edit":
                showFormEdit(request, response);
                break;
            default:
                showProfile(request, response);
                break;
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("profile/edit-profile.jsp");
        requestDispatcher.forward(request, response);
    }

    private void showProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("profile/profile.jsp");
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if (action == null) action = "";
            switch (action) {
                case "edit":
                    actionEdit(request, response);
                    break;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {

        User userLogin = (User) request.getSession().getAttribute("userLogin");
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String avatar = request.getParameter("avatar");

        userLogin.setName(name);
        userLogin.setUsername(username);
        userLogin.setEmail(email);
        userLogin.setPassword(password);
        userLogin.setAvatar(avatar);
        userService.save(userLogin);

        request.getSession().setAttribute("userLogin", userLogin);

        showProfile(request, response);
    }
}
