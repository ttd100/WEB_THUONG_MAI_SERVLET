<%@ page import="rikkei.academy.model.User" %>
<%@ page import="rikkei.academy.service.user.UserServiceIMPL" %>
<%@ page import="java.sql.SQLException" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--implementation group: 'javax.servlet', name: 'jstl', version: '1.2'--%>
<%--implementation group: 'mysql', name: 'mysql-connector-java', version: '8.0.30'--%>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>

<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
</head>
<body>

<%
    Cookie cookie = null;
    Cookie[] cookies = request.getCookies();
    if(cookies != null) {
        for (Cookie c : cookies) {
            if (c.getName().equals("id")) {
                cookie = c;
            }
        }
    }

    if (cookie != null) {
        int id = Integer.parseInt(cookie.getValue());
        try {
            User user = new UserServiceIMPL().findById(id);
            request.getSession().setAttribute("userLogin", user);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    response.sendRedirect("home");
%>

</body>
</html>