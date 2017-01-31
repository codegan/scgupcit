<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 22.12.16
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Заявки</title>
</head>
<body>
<!--Шапка сайта-->
<%@include file="../includes/headeradmin.jsp"%>
<c:url value="/admin/application/excel" var="excelController"/>
<c:url value="/admin/application/pdf" var="pdfController"/>

<div class="row" style="padding: 5px;">
    <div class="col-lg-10">
        <div class="panel panel-info">
            <div class="panel-heading">Весь список заявок</div>
            <div class="panel-body">
                <table id="table" class="table table-hover">
                    <thead>
                        <tr>
                            <th>ИД</th>
                            <th>ФИО</th>
                            <th>Телефон</th>
                            <th>Организация</th>
                            <th>Категория</th>
                            <th>Система</th>
                            <th>Текст заявки</th>
                            <th>Дата создания</th>
                            <th>Дата завершения</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="app" items="${list}">
                            <tr>
                                <td>${app.id}</td>
                                <td>${app.fio}</td>
                                <td>${app.phone}</td>
                                <td>${app.organizations}</td>
                                <td>${app.category_name}</td>
                                <td>${app.system_name}</td>
                                <td>${app.text}</td>
                                <td>${app.start_date}</td>
                                <c:if test="${!empty app.end_date}">
                                    <td>${app.end_date}</td>
                                </c:if>
                                <c:if test="${empty app.end_date}">
                                    <td><a href="<c:url value='/admin/application/edit/${app.id}' />" class="btn btn-success">Завершить</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="panel-footer">
                <div id="controls">
                    <div id="perpage">
                        <select style="width: 80px" class="selectpicker form-control" onchange="sorter.size(this.value)">
                            <option value="5">5</option>
                            <option value="10" selected="selected">10</option>
                            <option value="20">20</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                        </select>
                        <span>Записи на страницу</span>
                    </div>
                    <nav>
                        <ul class="pager">
                            <li><a href="#" onclick="sorter.move(-1)">Назад</a></li>
                            <li><a href="#" onclick="sorter.move(-1,true)">Начало</a></li>
                            <li><a href="#" onclick="sorter.move(1,true)">Конец</a></li>
                            <li><a href="#" onclick="sorter.move(1)">Вперед</a></li>
                        </ul>
                    </nav>
                    <div id="text">Страница <span id="currentpage"></span> из <span id="pagelimit"></span></div>
                </div>
            </div>
        </div>
        <script type="text/javascript" src="<c:url value="/resources/js/scriptsorter.js"/>"></script>
        <script type="text/javascript">
            var sorter = new TINY.table.sorter("sorter");
            sorter.head = "head";
            sorter.asc = "asc";
            sorter.desc = "desc";
            sorter.even = "evenrow";
            sorter.odd = "oddrow";
            sorter.evensel = "evenselected";
            sorter.oddsel = "oddselected";
            sorter.paginate = true;
            sorter.currentid = "currentpage";
            sorter.limitid = "pagelimit";
            sorter.init("table",1);
        </script>
    </div>
    <div class="col-lg-2">
        <div class="panel panel-info">
            <div class="panel-heading">Статистика</div>
                <div class="panel-body">
                    Общее колличество заявок: <c:out value="${stat}"/>
                </div>
        </div>
        <div class="panel panel-info">
            <div class="panel-heading">Скачать в виде</div>
            <div class="panel-body">
                <a class="btn btn-default" href="${excelController}">Excel</a>
                <!--<a class="btn btn-default" href="${pdfController}">PDF</a>-->
            </div>
        </div>
    </div>
</div>
</body>
</html>
