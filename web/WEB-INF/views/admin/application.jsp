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
                        <c:forEach var="emp" items="${list}">
                            <tr>
                                <td>${emp.id}</td>
                                <td>${emp.fio}</td>
                                <td>${emp.phone}</td>
                                <td>${emp.organizations}</td>
                                <td>${emp.category_name}</td>
                                <td>${emp.system_name}</td>
                                <td>${emp.text}</td>
                                <td>${emp.start_date}</td>
                                <c:if test="${!empty emp.end_date}">
                                    <td>${emp.end_date}</td>
                                </c:if>
                                <c:if test="${empty emp.end_date}">
                                    <td><a href="<c:url value='/admin/application/edit/${emp.id}' />" class="btn btn-success">Завершить</a></td>
                                </c:if>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
\            </div>
        </div>
        <div id="controls">
            <div id="perpage">
                <select onchange="sorter.size(this.value)">
                    <option value="5">5</option>
                    <option value="10" selected="selected">10</option>
                    <option value="20">20</option>
                    <option value="50">50</option>
                    <option value="100">100</option>
                </select>
                <span>Записи на страницу</span>
            </div>
            <div id="navigation">
                <img src="<c:url value="/resources/img/images/first.gif"/>" width="16" height="16" title="Первая страница" onclick="sorter.move(-1,true)" />
                <img src="<c:url value="/resources/img/images/previous.gif"/>" width="16" height="16" title="Предыдущая страница" onclick="sorter.move(-1)" />
                <img src="<c:url value="/resources/img/images/next.gif"/>" width="16" height="16" title="следующая страница" onclick="sorter.move(1)" />
                <img src="<c:url value="/resources/img/images/last.gif"/>" width="16" height="16" title="последняя страница" onclick="sorter.move(1,true)" />
            </div>
            <div id="text">Страница <span id="currentpage"></span> из <span id="pagelimit"></span></div>
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
               Общее колличество заявок: <form:out value="${stat}"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>
