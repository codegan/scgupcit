<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 27.12.16
  Time: 15:22
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
    <link href="<c:url value="/resources/css/authpage.css" />" rel="stylesheet">

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
            <img class="logo" alt="Brand" src="<c:url value="/resources/img/logo/gerb_chechni.png"/>">
        </a>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span style="margin-top: -5px" class="navbar-brand">Центр информационных технологии<br><h6 style="margin-top: 0px">Чеченской Республики</h6> </span>
        </div>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><b>Войти</b> <span class="caret"></span></a>
                    <ul id="login-dp" class="dropdown-menu">
                        <li>
                            <div class="row">
                                <div class="col-md-12">
                                    <!--Сообщение при ощибке ввода логина или пароля-->
                                    <c:if test="${not empty error}">
                                        ${error}
                                    </c:if>
                                    <form class="form" role="form" method="post" action="j_spring_security_check" id="login-nav" name="form_login">
                                        <div class="form-group">
                                            <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                            <input name="user_login" type="text" class="form-control" id="exampleInputEmail2" placeholder="Логин" required>
                                        </div>
                                        <div class="form-group">
                                            <label class="sr-only" for="exampleInputPassword2">Password</label>
                                            <input name="password_login" type="password" class="form-control" id="exampleInputPassword2" placeholder="Пароль" required>
                                        </div>
                                        <div class="form-group">
                                            <button name="submit" type="submit" class="btn btn-primary btn-block">Войти</button>
                                        </div>
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" name="password_safe">Сохранить пароль
                                            </label>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
</body>
</html>
