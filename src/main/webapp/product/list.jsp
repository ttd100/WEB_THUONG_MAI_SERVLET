<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/10/2022
  Time: 8:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

    <jsp:include page="../bootstrap/bootstrap.jsp"></jsp:include>

</head>
<body>

<jsp:include page="../bootstrap/header.jsp"></jsp:include>

<a href="product?action=create" type="button" class="btn btn-success m-3">create product</a>
<form method="post">
    <div class="d-flex align-items-center">
        <input type="text" name="search" placeholder="Search Product and By Name" style="height: 37px" class="ms-3 rounded">
        <button type="submit" class="btn btn-secondary mx-3">Search</button>
        <a href="manage" type="button" class="btn btn-danger">Back</a>
    </div>

</form>
<table class="table table-striped table-hover text-center">
    <tr>
        <th>id</th>
        <th>name</th>
        <th>category</th>
        <th>price</th>
        <th>image</th>
        <th>quantity</th>
        <th>edit</th>
        <th>delete</th>
    </tr>
    <c:forEach var="pr" items='${requestScope["productList"]}'>
        <tr>
            <td>${pr.id}</td>
            <td><a href="product?action=detail&id=${pr.id}">${pr.name}</a></td>
            <td>${pr.category.categoryName}</td>
            <td>${pr.price}</td>
            <td><img width="80" height="80" src="${pr.image}" alt=""></td>
            <td>${pr.quantity}</td>
            <td><a href="product?action=edit&id=${pr.id}" type="button" class="btn btn-success">Edit</a></td>
            <td><a href="product?action=delete&id=${pr.id}" type="button" class="btn btn-danger">Delete</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
