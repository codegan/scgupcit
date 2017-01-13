<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 22.12.16
  Time: 14:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Заявки</title>
</head>
<body>
<!--Шапка сайта-->
<%@include file="../includes/header.jsp"%>
<!-- основная сетка-->
<div class="row">
<div class="col-lg-9">
    <span class="visible-lg"></span>
    <table class="table table-hover">
        <thead>
        <tr>
            <td>ИД</td>
            <th>Категория</th>
            <th>Система</th>
            <th>Текст заявки</th>
        </tr>
        </thead>

        <c:forEach var="emp" items="${app}">
            <tr>
                <td>${emp.id}</td>
                <td>${emp.category}</td>
                <td>${emp.system}</td>
                <td>${emp.text}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<div class="col-lg-3">

    <!-- Кнопка для появления модального окна для отправки услуг -->
    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal">
        Создать заявку
    </button>

    <!--Модальное окно для создания новой услуги-->
    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Новая заявка</h4>
                </div>
                <div class="modal-body">

                    <form:form action="/scgupcit/user/application/add" commandName="setApp">
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
                            <label for="message-text" class="control-label">Текст заявки:</label>
                            <textarea name="text" rows="20" class="form-control" id="message-text" placeholder="Введите текст заявки..."></textarea>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                            <button type="submit" class="btn btn-primary">Отправить</button>
                        </div>
                    </form:form>
                </div>

            </div>
        </div>
    </div>
</div>
</div>
</div>
</body>
</html>
