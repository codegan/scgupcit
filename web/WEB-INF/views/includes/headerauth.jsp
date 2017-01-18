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
    <link href="<c:url value="/resources/css/authmodal.css" />" rel="stylesheet">
    <link rel="stylesheet" href="http://bootstraptema.ru/plugins/font-awesome/4-4-0/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css">

    <script src="<c:url value="/resources/js/authmodal.js"/>" type="text/javascript"></script>
    <script type="text/javascript" src="<c:url value="/resources/js/jquery-1.11.3.min.js"/> "></script>
    <script type="text/javascript" src="http://bootstraptema.ru/plugins/2015/b-v3-3-6/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/bootstrap-select.min.js"></script>
</head>
<body>
<div class="container">
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

                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
    </div>
</nav>
<!-- основная сетка-->
<div class="row">
    <div class="col-lg-9">
        <!-- Карусель -->
        <div id="myCarousel" class="carousel slide" data-interval="3000" data-ride="carousel">
            <!-- Индикаторы для карусели -->
            <ol class="carousel-indicators">
                <!-- Перейти к 0 слайду карусели с помощью соответствующего индекса data-slide-to="0" -->
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <!-- Перейти к 1 слайду карусели с помощью соответствующего индекса data-slide-to="1" -->
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <!-- Перейти к 2 слайду карусели с помощью соответствующего индекса data-slide-to="2" -->
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
            <!-- Слайды карусели -->
            <div class="carousel-inner">
                <!-- Слайды создаются с помощью контейнера с классом item, внутри которого помещается содержимое слайда -->
                <div class="active item" style="height: 290px">
                    <img src="http://gupcit.ru/img/content/header%202.jpg" alt="...">
                </div>
                <!-- Слайд №2 -->
                <div class="item" style="height: 290px">
                    <img style="height: auto" src="<c:url value="/resources/img/черхигов.jpg"/> " alt="...">
                </div>
                <!-- Слайд №3 -->
                <div class="item" style="height: 290px">
                    <img src="http://gupcit.ru/img/content/header%202.jpg" alt="...">
                    <div class="carousel-caption">
                        <h3>Гуп</h3>
                        <p>Центр информационных технологии</p>
                    </div>
                </div>
            </div>
            <!-- Навигация для карусели -->
            <!-- Кнопка, осуществляющая переход на предыдущий слайд с помощью атрибута data-slide="prev" -->
            <a class="carousel-control left" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
            </a>
            <!-- Кнопка, осуществляющая переход на следующий слайд с помощью атрибута data-slide="next" -->
            <a class="carousel-control right" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
            </a>
        </div>
    </div>
        <div class="col-lg-3">
            <div>
                <div class="thumbnail" style="height: 290px">
                    <div class="caption">
                        <!--<h3>Ситуационный центр</h3>
                        <p>Предназначен для повышения
                            эфективности процессов электронного взаимодействия, а также
                            повышения качества взаимодействия и совершенствования
                            механизмов контроля и мониторинга процессов
                            межведомственного обмена в Чеченской Республики.</p>
                         -->
                    <div class="image"></div>
                        <p><a class="btn btn-primary" data-toggle="modal" href="javascript:void(0)" onclick="openLoginModal();">Вход</a><a class="btn btn-primary" data-toggle="modal" href="javascript:void(0)" onclick="openRegisterModal();">Регистрация</a></p>
                    </div>
                </div>
            </div>
        </div>
</div>
<!--Модальное окно с формой авторизации и регистрации-->
<div class="modal fade login" id="loginModal">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">Вход</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="error"></div>
                        <div class="form loginBox">
                            <form class="form" role="form" method="post" action="j_spring_security_check" id="login-nav" name="form_login">
                                <input id="login" class="form-control" type="text" placeholder="Email" name="user_login">
                                <input id="password" class="form-control" type="password" placeholder="Password" name="password_login">
                                <input class="btn btn-default btn-login" type="submit" name="submit" value="Вход">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="content registerBox" style="display:none;">
                        <div class="form">
                            <form method="" html="{:multipart=>true}" data-remote="true" action="" accept-charset="UTF-8">
                                <input id="login" class="form-control" type="text" placeholder="Логин" name="login">
                                <input id="password" class="form-control" type="password" placeholder="Пароль" name="password">
                                <input id="password_confirmation" class="form-control" type="password" placeholder="Повторите пароль" name="password_confirmation">
                                <input class="btn btn-default btn-register" type="button" value="Создать аккаунт" name="commit">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="forgot login-footer">
 <span>У вас нет аккаунта?
 <a href="javascript: showRegisterForm();">Зарегистрируйтесь</a>
 </span>
                </div>
                <div class="forgot register-footer" style="display:none">
                    <span>У Вас есть аккаунт?</span>
                    <a href="javascript: showLoginForm();">Войдите</a>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
