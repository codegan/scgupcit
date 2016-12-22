<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 22.12.16
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Пользователи</title>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/bootstrap.js" />"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/npm.js" />"></script>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <span class="navbar-brand">Ситуационный центр<span style="padding-left: 4px" class="glyphicon glyphicon-ok-circle"/> </span>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="<c:url value="/admin/application"/>">Заявки </a></li>
                <li class="active"><a href="#">Пользователи</a></li>
                <li><a href="<c:url value="/admin/organizations"/>">Организации</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#">Администратор</a></li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
