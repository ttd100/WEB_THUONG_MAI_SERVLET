<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/9/2022
  Time: 8:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Details</title>

    <jsp:include page="../bootstrap/bootstrap.jsp"></jsp:include>

</head>
<body>

<jsp:include page="../bootstrap/header.jsp"></jsp:include>

<h4 class="m-3">
    Cart detail
</h4>

<a href="cart?action=manager">
    <button class="m-3 btn btn-danger ">Back</button>
</a>
<%=((boolean) request.getAttribute("available") ? "<form method='post'>" : "")%>
<p>Created: ${requestScope['cart'].created}</p>
<table class="table table-striped table-hover">
    <c:forEach items="${requestScope['cart'].products}" var="pr">
        <tr>
            <td>
                <img src="${pr.image}" alt="image" width="200" height="200">
            </td>
            <td>${pr.name}</td>
            <td>${pr.price}</td>
            <td>${pr.quantity}</td>
            <td>${pr.stock}</td>
        </tr>
    </c:forEach>
</table>

<%=((boolean) request.getAttribute("available") ? "<button class='btn btn-success m-3'>Confirm</button></form>" : "<button class='btn btn-secondary m-3'>Not available</button>")%>
<a href="cart?action=cancel&id=${requestScope['cart'].id}">
    <button class="btn btn-danger m-3">Cancel</button>
</a>
</body>
</html>
