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
<div class="row" style="padding: 5px;">
<div class="col-lg-9">
    <span class="visible-lg"></span>
    <div class="panel panel-info">
        <div class="panel-heading">Отправленные заявки</div>
        <div class="panel-body">
    <table class="table table-hover">
        <thead>
            <tr>
                <th>ИД</th>
                <th>Категория</th>
                <th>Система</th>
                <th>Текст заявки</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="emp" items="${app}">
                <tr>
                    <td>${emp.id}</td>
                    <td>${emp.category_name}</td>
                    <td>${emp.system_name}</td>
                    <td>${emp.text}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
            </div>
        </div>
</div>
<div class="col-lg-3">
    <div class="panel panel-info">
        <div class="panel-heading">Сортировка</div>
        <div class="panel-body">
            В разработке
        </div>
    </div>
    <!-- Кнопка для появления модального окна для отправки услуг -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        Создать заявку
    </button>

    <!--Модальное окно для создания новой услуги-->
    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content" style="background-color: rgba(221, 221, 221, 0.91);">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Новая заявка</h4>
                </div>
                <div class="modal-body">

                    <form:form action="/scgupcit/user/application/add" commandName="setApp">
                        <div class="form-group">
                            <form:select cssClass="selectpicker" title="Категория проблемы..." path="category_id" size="200px">
                                <form:options items="${categ}" itemValue="id" itemLabel="name" />
                            </form:select>
                        </div>
                        <div class="form-group">
                            <div class="form-group">
                                <form:select cssClass="selectpicker" title="Выберите систему..." path="system_id" size="200px">
                                    <form:options items="${syst}" itemValue="id" itemLabel="name" />
                                </form:select>
                            </div>
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
