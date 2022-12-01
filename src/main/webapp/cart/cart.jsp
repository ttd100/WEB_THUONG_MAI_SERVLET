<%@ page import="rikkei.academy.model.Product" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/8/2022
  Time: 12:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cart</title>

    <%--bootstrap--%>
    <jsp:include page="/bootstrap/bootstrap.jsp"></jsp:include>
    <%--bootstrap--%>

</head>
<body>

<jsp:include page="../bootstrap/header.jsp"></jsp:include>

<h4 class="p-3">
    Your Cart
</h4>

<table border="1" width="100%" class="table table-striped table-hover">
    <tr>
        <th>Image</th>
        <th>Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Remove</th>
    </tr>
    <c:forEach items="${requestScope['cart'].products}" var="pr">

        <tr>

            <td width="50">
                <img src="${pr.image}" alt="img" width="50" height="50">
            </td>

            <td>${pr.name}</td>

            <td>${pr.price}</td>

            <td>${pr.quantity}</td>

            <td>
                <a href="cart?action=remove&id=${pr.id}">
                    <button class="btn btn-danger">Remove</button>
                </a>
            </td>

        </tr>
    </c:forEach>
    <tr>
        <td colspan="5">
            <h4>
                Total: ${requestScope['cart'].getTotal()}
            </h4>
        </td>
    </tr>
    <tr></tr>
</table>


<a href="cart?action=order">
    <button class="btn btn-success"><i class="bi bi-bag-plus"></i> Order</button>
</a><br><br>
<a href="cart?action=history">
    <button class="btn btn-dark"><i class="bi bi-clock-history"></i> History</button>
</a><br><br>


</body>
</html>
