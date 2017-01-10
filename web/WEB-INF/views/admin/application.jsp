<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 22.12.16
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Заявки</title>
</head>
<body>
<!--Шапка сайта-->
<%@include file="../includes/headeradmin.jsp"%>
<h1>Список обращений</h1>
<div class="row">
    <div class="col-lg-9">
        <table class="table table-hover">
            <tr>
                <th>Автор</th>
                <th>Категория</th>
                <th>Система</th>
                <th>Текст заявки</th>
            </tr>
            <c:forEach var="emp" items="${list}">
                <tr>
                    <td>${emp.author}</td>
                    <td>${emp.category}</td>
                    <td>${emp.system}</td>
                    <td>${emp.text}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
    <div class="col-lg-3">
        Фильтр
    </div>
</div>
</body>
</html>
