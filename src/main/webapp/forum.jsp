<%@page import="com.privacy.vo.BoardVO" %>
<%@page import="java.util.List" %>
<%@page import="com.privacy.service.BoardServiceImpl" %>
<%@page import="com.privacy.service.BoardService" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>Privacy</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/forum.css">

    <!-- ION-ICON -->
    <script type="module"
            src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule
            src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="./js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#header").load("header.jsp");
            $("#footer").load("footer.jsp");
        });
    </script>
</head>
<body>
<jsp:useBean id="searchVO" class="com.privacy.vo.SearchVO"></jsp:useBean>
<jsp:setProperty property="*" name="searchVO"/>
<%
    BoardService boService = new BoardServiceImpl();
    List<BoardVO> boList = boService.getBoardList(searchVO);
    request.setAttribute("boList", boList);
%>
<div class="container">
    <div id="header">
        <!-- Load header.html with jQuery -->
    </div>
    <div class="body">
        <div class="title-area">
            <div class="title">
                <h2>
                    <ion-icon name="chatbubbles-outline"></ion-icon>
                    포럼
                </h2>
                <h3>자유롭게 의견을 나누는 공간</h3>
            </div>
        </div>
        <div class="tabs-area">
            <ul class="tabs">
                <li class="tab ${searchVO.category eq null ? 'selected' : ''}"><a href="./forum.jsp?page=1">전체</a></li>
                <li class="tab ${searchVO.category eq '공지' ? 'selected' : ''}"><a href="./forum.jsp?page=1&category=공지">공지사항</a>
                </li>
                <li class="tab ${searchVO.category eq '일반' ? 'selected' : ''}"><a href="./forum.jsp?page=1&category=일반">일반</a>
                </li>
                <li class="tab ${searchVO.category eq '질문' ? 'selected' : ''}"><a href="./forum.jsp?page=1&category=질문">질문</a>
                </li>
                <li class="tab pink"><a href="./forum_editor.jsp">글 작성</a></li>
            </ul>
        </div>
        <div class="category-area" id="tab_headline">
            <h1>전체 게시글</h1>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <table id="board-table">
                    <colgroup>
                        <col width="35px">
                        <col width="*">
                        <col width="120px">
                        <col width="100px">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성일</th>
                        <th>작성자</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${boList }" var="bo">
                        <tr>
                            <td>${bo.boNo }</td>
                            <c:if test="${bo.boDelYn eq 'N' }">
                                <td><a href="./forum_view.jsp?boNo=${bo.boNo }">${bo.boTitle }</a></td>
                            </c:if>
                            <c:if test="${bo.boDelYn eq 'Y' }">
                                <td><a style="color: gray;">삭제된 게시물입니다</a></td>
                            </c:if>
                            <td>${bo.boRegDate }</td>
                            <c:if test="${bo.boDelYn eq 'N' }">
                                <td>${bo.boWriter }</td>
                            </c:if>
                            <c:if test="${bo.boDelYn eq 'Y' }">
                                <td style="color: gray;">-</td>
                            </c:if>
                        </tr>
                    </c:forEach>
                    <!--  -->
                    </tbody>
                </table>

                <!-- 페이징 시작 -->
                <div class="board-paging">
                    <!-- 이전 페이지 버튼  -->
                    <c:if test="${searchVO.page ne 1 }">
                        <a class="prev"
                           href="./forum.jsp?page=${searchVO.page - 1 }${searchVO.category ne null ? '&category='+=searchVO.category : '' }">
                            <ion-icon name="chevron-back-outline"></ion-icon>
                        </a>
                    </c:if>
                    <c:if test="${searchVO.page eq 1 }">
                        <a class="prev" style="opacity: 0.5">
                            <ion-icon name="chevron-back-outline"></ion-icon>
                        </a>
                    </c:if>

                    <c:if test="${searchVO.pageSize eq 4 }">
                        <c:if test="${searchVO.firstPage ne 1 }">
                            <a href="./forum.jsp?page=1${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                               class="page">1</a>
                            <a class="page">...</a>
                        </c:if>
                        <c:forEach begin="${searchVO.firstPage }" end="${searchVO.lastPage }" var="i">
                            <a href="./forum.jsp?page=${i }${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                               class="page" style="${i eq searchVO.page ? 'font-weight: 500' : ''}">${i }</a>
                        </c:forEach>
                        <c:if test="${searchVO.lastPage ne searchVO.totalPages }">
                            <a class="page">...</a>
                            <a href="./forum.jsp?page=${searchVO.totalPages }${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                               class="page">${searchVO.totalPages }</a>
                        </c:if>
                    </c:if>
                    <c:if test="${searchVO.pageSize eq 1 }">
                        <a href="./forum.jsp?page=1${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                           class="page">1</a>
                        <a class="page">...</a>
                        <c:forEach begin="${searchVO.firstPage - 1 }" end="${searchVO.lastPage + 1 }" var="i">
                            <a href="./forum.jsp?page=${i }${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                               class="page" style="${i eq searchVO.page ? 'font-weight: 500' : ''}">${i }</a>
                        </c:forEach>
                        <a class="page">...</a>
                        <a href="./forum.jsp?page=${searchVO.totalPages }${searchVO.category ne null ? '&category='+=searchVO.category : '' }"
                           class="page">${searchVO.totalPages }</a>
                    </c:if>

                    <!-- 다음 페이지 버튼 -->
                    <c:if test="${searchVO.page ne searchVO.totalPages}">
                        <a class="next"
                           href="./forum.jsp?page=${searchVO.page + 1 }${searchVO.category ne null ? '&category='+=searchVO.category : '' }">
                            <ion-icon name="chevron-forward-outline"></ion-icon>
                        </a>
                    </c:if>
                    <c:if test="${searchVO.page eq searchVO.totalPages }">
                        <a class="next" style="opacity: 0.5">
                            <ion-icon name="chevron-forward-outline"></ion-icon>
                        </a>
                    </c:if>
                </div>
                <!-- 페이징 끝 -->

            </div>
        </div>
    </div>
    <hr>
    <div id="footer">
        <!-- Load footer.html with jQuery -->
    </div>
</div>
</body>

</html>