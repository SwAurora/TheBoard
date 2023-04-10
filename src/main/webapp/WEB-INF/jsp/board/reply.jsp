<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en`">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
</head>
<body>
<h1>댓글</h1>
<table class="table w-50">
    <tr>
        <th></th>
        <th>작성자</th>
        <th>내용</th>
        <th>작성일자</th>
    </tr>
    <c:forEach var="reply" items="${replyList}">
        <tr class="depth${reply.level}">
            <td></td>
            <td>${reply.name}</td>
            <td>${reply.content}</td>
            <td>${reply.regdate}</td>
        </tr>
    </c:forEach>
</table>
<script>
    $(document).ready(function () {
        let depth2 = $('.depth2 td:first-child');
        depth2.text("↪");
        let depth3 = $('.depth3 td:first-child');
        depth3.text("↪↪");
    })
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>