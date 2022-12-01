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
</head>
<body>
<h1>create product</h1>
<a href="/product">back menu</a>
<c:if test='${requestScope["message"] != null}'>
    <span class="message">${requestScope["message"]}</span>
</c:if>
<form action="" method="post">
    <label>product name</label>
    <input type="text" name="name"><br>
    <label>id category</label>
    <input type="text" name="idCategory"><br>
    <label>price</label>
    <input type="text" name="price"><br>
    <label>image</label>
    <input type="text" name="image"><br>
    <label>quantity</label>
    <input type="text" name="qty"><br>
    <button type="submit">creat product</button>
</form>
</body>
</html>
