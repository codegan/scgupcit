<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 22.12.16
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Заявки</title>
</head>
<body>
<!--Шапка сайта-->
<%@include file="../includes/headeradmin.jsp"%>

<div class="row" style="padding: 5px;">
    <div class="col-lg-9">
        <div class="panel panel-info">
            <div class="panel-heading">Весь список заявок</div>
            <div class="panel-body">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ИД</th>
                        <th>ФИО</th>
                        <th>Телефон</th>
                        <th>Организация</th>
                        <th>Категория</th>
                        <th>Система</th>
                        <th>Текст заявки</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="emp" items="${list}">
                        <tr>
                            <td>${emp.id}</td>
                            <td>${emp.fio}</td>
                            <td>${emp.phone}</td>
                            <td>${emp.organizations}</td>
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
    </div>
    <div class="col-lg-3">
        <div class="panel panel-info">
            <div class="panel-heading">Статистика</div>
            <div class="panel-body">
               Общее колличество заявок: <form:out value="${stat}"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>
