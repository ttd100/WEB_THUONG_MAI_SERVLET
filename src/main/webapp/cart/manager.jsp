<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/9/2022
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart Manager</title>

    <jsp:include page="../bootstrap/bootstrap.jsp"></jsp:include>
</head>
<body>

<jsp:include page="../bootstrap/header.jsp"></jsp:include>


<a href="manage">
    <button class="btn btn-danger m-3">Back</button>
</a>
<h4 class="m-3">
Cart List
</h4>
<table border="1" class="table table-striped table-hover">
    <tr>
        <th>
            ID
        </th>
        <th>
            User Name
        </th>
        <th>
            Total
        </th>
        <th>
            Detail
        </th>
    </tr>
    <c:forEach items="${requestScope['cartList']}" var="cart">
        <tr>
            <td>${cart.id}</td>
            <td>${cart.user.name}</td>
            <td>${cart.getTotal()}</td>
            <td><a href="cart?action=detail&id=${cart.id}">
                <button class="btn btn-success">Detail</button>
            </a></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>
