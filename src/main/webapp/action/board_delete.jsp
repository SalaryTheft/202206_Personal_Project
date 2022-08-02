<%@page import="com.privacy.vo.BoardVO"%>
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
<%-- 	<jsp:useBean id="bo" class="com.privacy.vo.BoardVO"></jsp:useBean>
	<jsp:setProperty property="*" name="bo" /> --%>

	<%
	String memId = (String) session.getAttribute("memId");
	BoardService boService = new BoardServiceImpl();
	int boNo = Integer.parseInt(request.getParameter("boNo"));
	BoardVO bo = boService.getBoard(boNo);
	if (bo != null) {
		if (bo.getBoWriter().equals(memId)) {
			try {
				boService.deleteBoard(bo);
			} catch (BizNotFoundException bnf) {
				request.setAttribute("BizNotFoundException", bnf);
			}
		} else {
			request.setAttribute("NotAuthorized", "");
		}
	} else {
		request.setAttribute("BizNotFoundException", "true");
	}

	%>

	<c:if test="${NotAuthorized ne null }">
		<script>
			alert("삭제할 권한이 없습니다.");
			location.href = "../forum.jsp";
		</script>
	</c:if>
	<c:if test="${BizNotFoundException ne null }">
		<script>
			alert("글이 이미 삭제되었거나 올바르지 않은 글 번호입니다.");
			location.href = "../forum.jsp";
		</script>
	</c:if>
	<c:if test="${NotAuthorized eq null }">
		<script>
			alert("글이 정상적으로 삭제되었습니다.");
			location.href = "../forum.jsp";
		</script>
	</c:if>
</body>
</html>