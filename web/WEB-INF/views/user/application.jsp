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
    <div class="col-lg-10">
        <span class="visible-lg"></span>
        <div class="panel panel-info">
            <div class="panel-heading">Отправленные заявки</div>
            <div class="panel-body">
                <table id="table" class="table table-hover">
                    <thead>
                        <tr>
                            <th>ИД</th>
                            <th>Категория</th>
                            <th>Система</th>
                            <th>Текст заявки</th>
                            <th>Дата создания</th>
                            <th>Дата завершения</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="emp" items="${app}">
                        <tr>
                            <td>${emp.id}</td>
                            <td>${emp.category_name}</td>
                            <td>${emp.system_name}</td>
                            <td>${emp.text}</td>
                            <td>${emp.start_date}</td>
                            <c:if test="${!empty emp.end_date}">
                                <td>${emp.end_date}</td>
                            </c:if>
                            <c:if test="${empty emp.end_date}">
                                <td class="warning">В работе</td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="panel-footer">
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
</body>
</html>
