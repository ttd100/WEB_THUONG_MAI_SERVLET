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
    <title>Delete</title>
</head>
<body>

<form method="post">
    <input type="hidden" name="id" value="${requestScope['id']}">
    Are you sure you want to delete ?<br><br>
    <button>Yes</button>
    <br><br>
    <a href="user">
        <button type="button">
            No
        </button>
    </a>
</form>

</body>
</html>
