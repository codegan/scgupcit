<%--
  Created by IntelliJ IDEA.
  User: zaur
  Date: 22.12.16
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Заявки</title>
</head>
<body>
<!--Шапка сайта-->
<%@include file="../includes/headeradmin.jsp"%>
<h1>Employees List</h1>
<table border="2" width="70%" cellpadding="2">
    <tr><th>Id</th><th>Name</th><th>Salary</th><th>Designation</th><th>Edit</th><th>Delete</th></tr>
    <c:forEach var="emp" items="${all}">
        <tr>
            <td>${emp.id}</td>
            <td>${emp.author}</td>
            <td>${emp.category}</td>
            <td>${emp.system}</td>
            <td>${emp.text}</td>
            <td><a href="editemp/${emp.id}">Edit</a></td>
            <td><a href="deleteemp/${emp.id}">Delete</a></td>
        </tr>
    </c:forEach>
</table>
<br/>
<a href="empform">Add New Employee</a>
</body>
</html>
