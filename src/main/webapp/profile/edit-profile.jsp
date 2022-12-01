<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 8/10/2022
  Time: 3:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="profile">Back</a>
<form method="post">
    <p>Name:</p>
    <input type="text" name="name" value="${sessionScope['userLogin'].name}">
    <p>Email:</p>
    <input type="text" name="email" value="${sessionScope['userLogin'].email}">
    <p>Username:</p>
    <input type="text" name="username" value="${sessionScope['userLogin'].username}">
    <p>Password:</p>
    <input type="text" name="password" value="${sessionScope['userLogin'].password}">
    <p>avatar:</p>
    <input type="text" name="avatar" value="${sessionScope['userLogin'].avatar}">
    <button>Summit</button>
</form>
</body>
</html>
