<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: THINKPAD
  Date: 10/5/2022
  Time: 8:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:if test='${requestScope["message"]!= null}'>
    <span style="color:blue">${requestScope["message"]}</span>
</c:if>
<form method="post">
    <label>Name</label><br>
    <p value="${requestScope["category"].getCategoryName()}"></p><br>
    <p>ARE YOU SURE DELETE</p>
    <a href="/"></a><button>YES</button>
</form>
<a href="category"><button>NO back menu</button></a>
</body>
</html>
