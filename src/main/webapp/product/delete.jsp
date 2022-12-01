<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 6/10/2022
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Form delete Product</h1>
<a href="/product">back menu</a>
<c:if test='${requestScope["message"] != null}'>
    <span style="color: blue" class="message">${requestScope["message"]}</span>
</c:if>
<form method="post">
    <label>Name</label><br>
    <input type="text" name="name" value="${requestScope["product"].getName()}" ><br>
    <label>category</label><br>
    <input type="text" name="idCategory" value="${requestScope["product"].category.categoryId}" ><br>
    <label>price</label><br>
    <input type="text" name="price" value="${requestScope["product"].getPrice()}" ><br>
    <label>image</label><br>
    <input type="text" name="image" value="${requestScope["product"].getImage()}" ><br>
    <label>quantity</label><br>
    <input type="text" name="qty" value="${requestScope["product"].getQuantity()}" ><br>
    <p>ARE YOU SURE DELETE</p>
    <button>YES</button>
</form>
<a href="/"><button>NO back menu</button></a>
</body>
</html>
