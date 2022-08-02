<%@page import="com.privacy.exception.BizNotFoundException"%>
<%@page import="com.privacy.service.BoardServiceImpl"%>
<%@page import="com.privacy.service.BoardService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<jsp:useBean id="bo" class="com.privacy.vo.BoardVO"></jsp:useBean>
	<jsp:setProperty property="*" name="bo" />

	<%
	String memId = (String) session.getAttribute("memId");
	
	BoardService boService = new BoardServiceImpl();
	bo.setBoWriter(boService.getBoard(bo.getBoNo()).getBoWriter()); // 다른 사람 글 수정 방지
	if (bo.getBoWriter().equals(memId)) {
		try {
			boService.updateBoard(bo);
		} catch (BizNotFoundException bnf) {
			request.setAttribute("BizNotFoundException", bnf);
		}
	} else {
		request.setAttribute("NotAuthorized", "");
	}
	%>

	<c:if test="${NotAuthorized ne null }">
		<script>
			alert("로그인 정보가 잘못되었습니다.");
			location.href = "../forum.jsp";
		</script>
	</c:if>
	<c:if test="${BizNotFoundException ne null }">
		<script>
			alert("글이 삭제되었거나 올바르지 않은 글 번호입니다.");
			location.href = "../forum.jsp";
		</script>
	</c:if>
	<c:if test="${NotAuthorized eq null }">
		<script>
			location.href = "../forum_view.jsp?boNo=${bo.boNo }";
		</script>
	</c:if>
</body>
</html>