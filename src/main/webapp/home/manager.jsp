<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/10/2022
  Time: 4:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manager</title>

    <%--bootstrap--%>
    <jsp:include page="/bootstrap/bootstrap.jsp"></jsp:include>
    <%--bootstrap--%>

</head>
<body>

<jsp:include page="../bootstrap/header.jsp"></jsp:include>

<div class="p-3">

    <h4 class="p-2">
        Manager ${sessionScope['userLogin'].name} / ${sessionScope['role']}
    </h4>

    <c:if test="${sessionScope['role'] == 'pm' || sessionScope['role'] == 'admin'}">
        <a href="category">
            <button class="btn btn-primary"><i aria-hidden="true">Category Manager</i></button>
        </a>
        <br><br>
        <a href="product">
            <button class="btn btn-primary"><i aria-hidden="true">Product Manager</i></button>
        </a>
        <br><br>
        <a href="cart?action=manager">
            <button class="btn btn-primary"><i aria-hidden="true">Cart Manager</i></button>
        </a>
        <br><br>
    </c:if>
    <c:if test="${sessionScope['role'] == 'admin'}">
        <a href="user">
            <button class="btn btn-primary"><i aria-hidden="true">User Manager</i></button>
        </a>
    </c:if>
</div>

</body>
</html>
