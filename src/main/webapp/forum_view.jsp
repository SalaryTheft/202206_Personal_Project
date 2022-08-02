<%@page import="com.privacy.vo.BoardVO"%>
<%@page import="com.privacy.exception.BizNotFoundException"%>
<%@page import="com.privacy.service.BoardServiceImpl"%>
<%@page import="com.privacy.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		$(document).ready(function() {
			$("#header").load("header.jsp");
			$("#footer").load("footer.jsp");
		});
	</script>
	<script src="./js/forum_view.js"></script>
</head>

<body id="body">
	<%
	try {
		int boNo = Integer.parseInt(request.getParameter("boNo"));
		BoardService boService = new BoardServiceImpl();
		try {
			BoardVO bo = boService.getBoard(boNo);
			request.setAttribute("bo", bo);
		} catch (BizNotFoundException bnf) {
			request.setAttribute("BizNotFoundException", bnf);
		}
		request.setAttribute("memId", session.getAttribute("memId"));
	} catch (NumberFormatException e) {
		request.setAttribute("NumberFormatException", e);
	}
	%>
	<c:if test="${NumberFormatException ne null || BizNotFoundException ne null }">
		<script>
			alert("삭제되었거나 잘못된 게시글입니다.");
			history.go(-1);
		</script>
	</c:if>
	
	<script>
		function delBoard() {
			if (confirm("정말로 삭제하시겠습니까?")) {
				location.href = "./action/board_delete.jsp?boNo=${bo.boNo}";
			}
		}
	</script>
	
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
					<li class="tab selected"><a href="./forum.jsp">목록</a></li>
					<c:if test="${bo.boWriter eq memId }">
						<li class="tab"><a href="./forum_editor.jsp?boNo=${bo.boNo }">수정</a></li>
						<li class="tab pink"><a href="javascript:delBoard()">삭제</a></li>
					</c:if>
					<c:if test="${bo.boWriter ne memId }">
						<li class="tab"><a style="opacity: 0.5">수정</a></li>
						<li class="tab pink"><a style="opacity: 0.5">삭제</a></li>
					</c:if>
					
				</ul>
			</div>
			<div class="category-area" id="article-title">
				<h1>${bo.boTitle }</h1>
				<p>${bo.boCategory } | ${bo.boWriter } | ${bo.boRegDate }${bo.boModDate ne null ? ' (수정됨)' : '' }</p>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<div id="board-content">
						<p>${bo.boContent }</p>
					</div>
				</div>
			</div>
			<div class="category-area">
				<h2>댓글</h2>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">댓글 기능은 준비 중입니다.</div>
			</div>
		</div>
		<hr>
		<div id="footer">
			<!-- Load footer.html with jQuery -->
		</div>
	</div>
</body>

</html>