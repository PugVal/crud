<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>

<%@ page session="false" %>
<html>


<head>
    <title>Books Page</title>

    <style type="text/css">

        body{
            background: beige;
        }

        h1 {
            text-align: center;
        }

        a:hover{
            color:red;
            text-decoration:underline;
            font-weight:bold;
        }

        .tg {
            border:3px solid black;
            border-collapse: collapse;
            border-spacing: 0;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border:3px solid black;
            background-color:white;
            overflow: hidden;
            word-break: normal;
            color: black;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border:3px solid black;
            background-color:white;
            overflow: hidden;
            word-break: normal;
            color: black;
        }
    </style>

</head>
<body>
<a href="../../index.jsp" title="Вернуться в главное меню">  Back to main menu</a>

<br/>

<h1>Books List</h1>

<c:if test="${!empty listBooks}">
    <table width="100%" class="tg">
        <tr>
            <th width="60">ID</th>
            <th width="200">Title</th>
            <th width="200">Description</th>
            <th width="200">Author</th>
            <th width="80">ISBN</th>
            <th width="120">PrintYear</th>
            <th width="80">ReadAlready</th>
            <th width="90">Edit if book is read</th>
            <th width="90">Edit if book is replaced</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listBooks}" var="book">
            <tr>
                <td>${book.id}</td>
                <td><a href="/bookdata/${book.id}" target="_blank">${book.title}</a></td>
                <td>${book.description}</td>
                <td>${book.author}</td>
                <td>${book.isbn}</td>
                <td>${book.printYear}</td>
                <td>${book.readAlready}</td>

                <td><a href="<c:url value='/read/${book.id}'/>">Edit if read</a></td>
                <td><a href="<c:url value='/replaced/${book.id}'/>">Edit if replaced</a></td>
                <td><a href="<c:url value='/remove/${book.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
</c:if>


<div style="align-content: center">
    <ul class="paging">
        <c:if test="${page > 1}">
            <a href="<c:url value="/books"><c:param name="page" value="${page - 1}"/>${page - 1}</c:url>"title="Открыть предыдущую страницу">Previous</a>
        </c:if>

        <spring:message text="${page}"/>

        <c:if test="${!empty listBooks}">
            <a href="<c:url value="/books"><c:param name="page" value="${page + 1}"/>${page + 1}</c:url>"title="Открыть следующую страницу"> Next</a>
        </c:if>

    </ul>
</div>

<br/>
<c:url var="searchbook" value="/searchresults"/>
<form:form action="${searchbook}" commandName="searchedbook">
    <table width="23%">
        <tr>
            <td><spring:message text="Title"/> <form:input path="title"/> </td>
            <td><input class="but" type="submit" name="action" value="<spring:message text="Search"/>"/></td>

        </tr>
    </table>
</form:form>

<form>
    <a class="but" href="/addbook" title="Добавить новую книгу">Add Book</a>
</form>

<br/>

</body>
</html>