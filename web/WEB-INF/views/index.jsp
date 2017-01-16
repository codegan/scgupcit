<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 22.12.16
  Time: 9:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Центр информационных технологии ЧР</title>
</head>
<body>
<%@include file="includes/headerauth.jsp"%>
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
                <div class="active item">
                    <img src="http://gupcit.ru/img/content/header%202.jpg" alt="...">
                    <div class="carousel-caption">
                        <h3>Гуп</h3>
                        <p>Центр информационных технологии</p>
                    </div>
                </div>
                <!-- Слайд №2 -->
                <div class="item">
                    <img src="http://gupcit.ru/img/content/header%202.jpg" alt="...">
                    <div class="carousel-caption">
                        <h3>Гуп</h3>
                        <p>Центр информационных технологии</p>
                    </div>
                </div>
                <!-- Слайд №3 -->
                <div class="item">
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
        <div class="semiopacity">
            <h2>Добро пожаловать!</h2><br>
            Ситуационный центр предназначен для повышения
            эфективности процессов электронного взаимодействия, а также
            повышения качества взаимодействия и совершенствования
            механизмов контроля и мониторинга процессов
            межведомственного обмена</br> в Чеченской Республики.
        </div>
    </div>
</div>

</body>
</html>
