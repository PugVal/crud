<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>


<head>
    <title>Search result</title>

    <style type="text/css">

        body{
            background: beige;
        }

        h1 {
            margin-top: 10px;
            margin-bottom: 0;
            text-align: center;
        }
        .features-table
        {
            width: 70%;
            margin: 0 auto;
            border-collapse: separate;
            border-spacing: 0;
            border: 0;
            text-shadow: 0 1px 0 #fff;
            color: #2a2a2a;
            background: #fafafa;
            margin-top:20px;
            margin-bottom:20px;
        }
        .features-table td
        {
            height: 50px;
            padding: 0 20px;
            border-bottom: 1px solid #cdcdcd;
            box-shadow: 0 1px 0 white;
            text-align: center;
            vertical-align: middle;
            display: table-cell;
            text-align: center;
            width: 150px;
            border-right: 1px solid white;
        }
        .features-table .param
        {
            font-size: 120%;
            font-weight: bold;
            background: #efefef;
            background: rgba(144,144,144,0.15);
        }
        .features-table tr:last-child td {
            -webkit-border-radius: 0 0 12px 12px;
            border-radius: 0 0 12px 12px;
        }
        .features-table tr:first-child td {
            -webkit-border-radius: 12px 12px 0 0;
            border-radius: 12px 12px 0 0;
        }
    </style>

</head>
<body>
<a href="<c:url value="/books"/>">Back to books list</a>
<br/>
<br/>
<h1>Search results</h1>

<c:if test="${!empty listBooks}">
    <table class="features-table">
        <tr class="param">
            <th>ID</th>
            <th>Title</th>
            <th>Description</th>
            <th>Author</th>
            <th>ISBN</th>
            <th>PrintYear</th>
            <th>ReadAlready</th>
            <th>Edit if book is read</th>
            <th>Edit if book is replaced</th>
            <th>Delete</th>
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
</body>
</html>