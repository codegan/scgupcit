<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 22.12.16
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Заявки</title>
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/css/bootstrap-select.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/bootstrap-select.min.js"></script>

    <!-- (Optional) Latest compiled and minified JavaScript translation files -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.1/js/i18n/defaults-*.min.js"></script>

</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span class="navbar-brand">Ситуационный центр<span style="padding-left: 4px" class="glyphicon glyphicon-ok-circle"/> </span>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="<c:url value="/user/application"/>">Заявки </a></li>
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



<div class="row">
<div class="col-lg-9">
    <span class="visible-lg"></span>
</div>
<div class="col-lg-3">

    <!-- Button trigger modal -->
    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
        Создать заявку
    </button>

    <!-- Modal -->
    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Новая заявка</h4>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="form-group">
                            <select class="selectpicker" title="Категория проблемы..." data-width="200px">
                                <option>Сетевые неполадки</option>
                                <option>Настройка АРМ</option>
                                <option>Консультация</option>
                                <option>Переустановка АРМ</option>
                                <option>Установка нового рабочего места</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <select class="selectpicker" title="Выберите систему..." data-width="200px">
                                <option>СМЭВ ЛПР</option>
                                <option>РГУ</option>
                                <option>ГАСУ ЧР</option>
                                <option>CЭДО ЧР</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="recipient-name" class="control-label">Тема:</label>
                            <input type="text" class="form-control" id="recipient-name" placeholder="Введите тему заявки...">
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="control-label">Текст заявки:</label>
                            <textarea rows="20" class="form-control" id="message-text" placeholder="Введите текст заявки..."></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                            <button type="button" class="btn btn-primary">Отправить</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
</div>
</div>




</body>
</html>
