<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/6/2022
  Time: 6:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List User</title>

    <jsp:include page="../bootstrap/bootstrap.jsp"></jsp:include>
</head>
<body>

<jsp:include page="../bootstrap/header.jsp"></jsp:include>

<div>
    <a href="manage" type="button" class="btn btn-danger m-3">Back</a>
</div>
<table class="table table-striped table-hover text-center">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>username</th>
        <th>email</th>
        <th>password</th>
        <th>avatar</th>
        <th>role</th>
        <th>edit</th>
        <th>delete</th>
    </tr>
    <c:forEach items="${requestScope['list']}" var="user">
        <tr align="center">
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>${user.password}</td>
            <td>
                <img src="${user.avatar}" alt="avatar" width="40" height="40">
            </td>
            <td>${user.role.name}</td>
            <td>
                <a href="user?action=edit&id=${user.id}">Edit</a>
            </td>
            <td>
                <a href="user?action=delete&id=${user.id}">Delete</a>
            </td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
