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
    <title>Edit</title>
</head>
<body>

<form method="post">
    <p>Id:</p>
    <input type="text" name="id" value="${requestScope['userEdit'].id}" disabled>
    <p>Name:</p>
    <input type="text" name="name" value="${requestScope['userEdit'].name}">
    <p>Username:</p>
    <input type="text" name="username" value="${requestScope['userEdit'].username}">
    <p>Email:</p>
    <input type="text" name="email" value="${requestScope['userEdit'].email}">
    <p>Password:</p>
    <input type="text" name="password" value="${requestScope['userEdit'].password}">
    <p>Role:</p>
    <input type="hidden" name="id_role" value="${requestScope['userEdit'].role.id}">
    <input type="text" name="role" value="${requestScope['userEdit'].role.name}" disabled>
    <br><br>
    <button>Submit</button>
</form>

</body>
</html>
