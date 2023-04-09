<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
    <style>
        #sel {
            width: 100px;
        }

        #sel2 {
            width: 100px;
        }

        #searchInput {
            width: 300px;
        }
    </style>
</head>
<body>
<%
    int tcnt; // 총 게시물
    int row; // 한페이지에 보여줄 게시물 수
    int totalPage; // 총 페이지 수
    int nowPage; // 현재 페이지
    int pagePerBlock = 5; // 페이지네이션 보여줄 블럭 갯수 (1~5)
    int nowBlock; // 현재 블럭
    int pageStart; // 현재 블럭 시작 페이지
    int pageEnd; // 현재 블럭 마지막 페이지

    nowPage = (int) request.getAttribute("nowPage");
    row = (int) request.getAttribute("row");
    tcnt = (int) request.getAttribute("tcnt");
    totalPage = (int) Math.ceil((double) tcnt / row);
    nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
    pageStart = (nowBlock - 1) * pagePerBlock + 1;
    pageEnd = Math.min((pageStart + (pagePerBlock - 1)), totalPage);

    String searchType = (String) request.getAttribute("searchType");
    String search = (String) request.getAttribute("search");
%>
<h1>게시판</h1>
<form action="/board" method="get" id="form1">
    <label for="sel">페이지</label>
    <select class="form-select mb-3" aria-label="Default select" name="row" id="sel">
        <option value="10" selected>10</option>
        <option value="50">50</option>
        <option value="100">100</option>
    </select>
    <input type="hidden" name="searchType" value="<%=searchType%>">
    <input type="hidden" name="search" value="<%=search%>">
</form>
<table class="table text-center">
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일시</th>
    </tr>
    <c:forEach var="board" items="${boardList}">
        <tr>
            <td>${board.b_no}</td>
            <td>${board.title}</td>
            <td>${board.writer}</td>
            <td>${board.regdate}</td>
        </tr>
    </c:forEach>
</table>
<form action="/board" method="get" id="form2" class="d-flex justify-content-center mb-3">
    <select name="searchType" class="form-select" aria-label="Default select" id="sel2">
        <option value="1" selected>전체</option>
        <option value="2">제목</option>
        <option value="3">내용</option>
        <option value="4">작성자</option>
    </select>
    <label for="searchInput"></label><input type="text" class="form-control" id="searchInput" name="search" placeholder="검색어를 입력해주세요." required>
    <button type="submit" class="btn btn-secondary">검색</button>
    <input type="hidden" name="row" value="<%=row%>">
</form>
<%

    if(!searchType.equals("") && !search.equals("")) {
%>
<script>
    document.getElementById('sel2').value = '<%=searchType%>';
    document.getElementById('searchInput').value = '<%=search%>';
</script>
<%
    }
%>
<nav aria-level="Page Navigation" class="d-flex justify-content-center">
    <ul class="pagination">
        <%
            if(nowPage == 1) {
        %>
        <li class="page-item disabled">
            <a class="page-link" href="/board?row=<%=row%>&page=<%=nowPage - 1%>&searchType=<%=searchType%>&search=<%=search%>">PREV</a>
        </li>
        <%
        } else {
        %>
        <li class="page-item">
            <a class="page-link" href="/board?row=<%=row%>&page=<%=nowPage - 1%>&searchType=<%=searchType%>&search=<%=search%>">PREV</a>
        </li>
        <%
            }
            for(; pageStart <= pageEnd; pageStart++) {
                if(pageStart == nowPage) {
        %>
        <li class="page-item">
            <a class="page-link active"
               href="/board?row=<%=row%>&page=<%=pageStart%>&searchType=<%=searchType%>&search=<%=search%>"><%=pageStart%>
            </a>
        </li>
        <%
        } else {
        %>
        <li class="page-item">
            <a class="page-link"
               href="/board?row=<%=row%>&page=<%=pageStart%>&searchType=<%=searchType%>&search=<%=search%>"><%=pageStart%>
            </a>
        </li>
        <%
                }
            }
            if(nowPage >= totalPage) {
        %>
        <li class="page-item disabled">
            <a class="page-link" href="/board?row=<%=row%>&page=<%=nowPage + 1%>&searchType=<%=searchType%>&search=<%=search%>">NEXT</a>
        </li>
        <%
        } else {
        %>
        <li class="page-item">
            <a class="page-link" href="/board?row=<%=row%>&page=<%=nowPage + 1%>&searchType=<%=searchType%>&search=<%=search%>">NEXT</a>
        </li>
        <%
            }
        %>
    </ul>
</nav>
<script>
    let sel = document.getElementById('sel');
    sel.value = <%=row%>;

    let form1 = document.getElementById('form1');
    sel.addEventListener('change', function () {
        form1.submit();
    });
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe"
        crossorigin="anonymous"></script>
</body>
</html>