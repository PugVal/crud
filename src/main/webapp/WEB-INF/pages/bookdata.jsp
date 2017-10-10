<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page session="false" %>

<html>



<head>
    <title>BookData</title>

    <style type="text/css">

        body{
            background: beige;
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
            color:black;
        }


    </style>

</head>
<body>
<h1>Book Details</h1>

<table class="tg">
    <tr>
        <th width="80">ID</th>
        <th width="120">Title</th>
        <th width="120">Description</th>
        <th width="120">Author</th>
        <th width="120">ISBN</th>
        <th width="120">PrintYear</th>
        <th width="120">ReadAlready</th>
    </tr>
    <tr>
        <td>${book.id}</td>
        <td>${book.title}</td>
        <td>${book.description}</td>
        <td>${book.author}</td>
        <td>${book.isbn}</td>
        <td>${book.printYear}</td>
        <td>${book.readAlready}</td>

    </tr>
</table>
</body>
</html>