<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/9/2022
  Time: 2:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>History</title>

    <jsp:include page="../bootstrap/bootstrap.jsp"></jsp:include>

    <style>
        .custom {
            color: thistle;
        }

        .custom:hover {
            color: black;
            cursor: pointer;
        }
    </style>

</head>
<body>

<jsp:include page="../bootstrap/header.jsp"></jsp:include>

<div>
    <h4 class="p-2">
        <span class="custom" style="color: black;" onclick="displayWaiting()" id="waiting-text">Waiting</span>
        <span class="custom" onclick="displayHistory()" id="history-text">History</span>
        <span class="custom" onclick="displayCancelled()" id="cancelled-text">Cancelled</span>
    </h4>

</div>
<div id="waiting">
    <table class="table table-striped table-hover">
        <tr>
            <th>ID</th>
            <th>Created</th>
            <th>Total</th>
            <th>Retrieve</th>
        </tr>
        <c:forEach items="${requestScope['orderedCarts']}" var="cart">
            <tr>
                <td>${cart.id}</td>
                <td>${cart.created}</td>
                <td>${cart.getTotal()}</td>
                <td>
                    <a href="cart?action=remove-cart&id=${cart.id}">
                        <button class="btn btn-danger">Retrieve</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<div style="display: none" id="history">
    <table class="table table-striped table-hover">
        <tr>
            <th>ID</th>
            <th>Time confirmed</th>
            <th>Total</th>
        </tr>
        <c:forEach items="${requestScope['confirmedCarts']}" var="cart">
            <tr>
                <td>${cart.id}</td>
                <td>${cart.changed}</td>
                <td>${cart.getTotal()}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<div style="display: none" id="cancelled">
    <table class="table table-striped table-hover">
        <tr>
            <th>ID</th>
            <th>Time confirmed</th>
            <th>Total</th>
        </tr>
        <c:forEach items="${requestScope['cancelledCarts']}" var="cart">
            <tr>
                <td>${cart.id}</td>
                <td>${cart.changed}</td>
                <td>${cart.getTotal()}</td>
            </tr>
        </c:forEach>
    </table>
</div>

<script>
    let waiting = document.getElementById("waiting");
    let history = document.getElementById("history");
    let cancelled = document.getElementById("cancelled");

    let waitingT = document.getElementById("waiting-text");
    let historyT = document.getElementById("history-text");
    let cancelledT = document.getElementById("cancelled-text");

    let displayWaiting = () => {
        waiting.style.display = "";
        waitingT.style.color = "black";
        historyT.style.color = "thistle";
        cancelledT.style.color = "thistle";
        history.style.display = "none";
        cancelled.style.display = "none";
    }

    let displayHistory = () => {
        waiting.style.display = "none";
        history.style.display = "";
        waitingT.style.color = "thistle";
        historyT.style.color = "black";
        cancelledT.style.color = "thistle";
        cancelled.style.display = "none";
    }

    let displayCancelled = () => {
        waiting.style.display = "none";
        history.style.display = "none";
        cancelled.style.display = "";
        waitingT.style.color = "thistle";
        historyT.style.color = "thistle";
        cancelledT.style.color = "black";
    }

</script>

</body>
</html>
