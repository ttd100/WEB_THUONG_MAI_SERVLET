<%--
  Created by IntelliJ IDEA.
  User: Hung
  Date: 10/7/2022
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
</head>
<body>
<h1>form profile</h1>
<a href="home">Back</a>
<table>
    <tr>
        <td>id</td>
        <td>${sessionScope['userLogin'].id}</td>
    </tr>
    <tr>
        <td>name:</td>
        <td>${sessionScope['userLogin'].name}</td>
    </tr>
    <tr>
        <td>email:</td>
        <td>${sessionScope['userLogin'].email}</td>
    </tr>
    <tr>
        <td>avatar:</td>
        <td><img style="width: 200px ; height: 200px"  src="${sessionScope['userLogin'].avatar}"></td>
    </tr>
    <a href="profile?action=edit">Edit</a>
</table>
</body>
</html>
