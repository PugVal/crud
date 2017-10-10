<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<style type="text/css">
    .text {
        text-align: center;
        width: 250px;
        height: 250px;
        position: absolute;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        margin: auto;
        font-size: 200%;
            }
    body{
        background: beige;
    }

    a:hover{
        color:red;
        text-decoration:underline;
        font-weight:bold;
    }

</style>
<head>
    <title>BOOKS</title>
</head>
<body>
<div class="text">
<h3> BOOKS PRESENTED </h3>

    <br/>
<a href="<c:url value="/books"/>" title="Показать список имеющихся книг" target="_blank">Books list</a>
</div>
<br/>
</body>
</html>