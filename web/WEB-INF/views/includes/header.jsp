<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 27.12.16
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/bootstrap-select.min.js"></script>
</head>
<body>
<!--Панель навигации для пользователей-->
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <a class="navbar-brand" href="#" style="margin-top: -10px;">
            <img alt="Brand" src="<c:url value="/resources/img/logo/gerb_chechni.png"/>">
        </a>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span style="margin-top: -5px" class="navbar-brand">Ситуационный центр<br><h6 style="margin-top: 0px">электронного правительства ЧР</h6> </span>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="<c:url value="/user/application"/>">Заявки </a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Инфо<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">СМЭВ-ЛПР ЧР</a></li>
                        <li><a href="#">РГУ</a></li>
                        <li><a href="#">Гос услуги ру</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">СЭДО "Дело"</a></li>
                        <li><a href="#">ГАСУ ЧР</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${user}<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="<c:url value="/j_spring_security_logout"/>">Выход</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
