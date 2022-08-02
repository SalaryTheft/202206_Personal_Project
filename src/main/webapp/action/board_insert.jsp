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
	request.setCharacterEncoding("utf-8");

	String memId = (String) session.getAttribute("memId");

	BoardService boService = new BoardServiceImpl();
	if (bo.getBoWriter().equals(memId)) {
		boService.insertBoard(bo);
	} else {
		request.setAttribute("NotAuthorized", "");
	}
	%>

	<c:if test="${NotAuthorized ne null }">
		<%
		session.removeAttribute("memId");
		%>
		<script>
			alert("로그인 정보가 잘못되었습니다.");
			location.href = "../forum.jsp";
		</script>
	</c:if>
	<c:if test="${NotAuthorized eq null }">
		<script>
			location.href = "../forum.jsp";
		</script>
	</c:if>

</body>
</html>