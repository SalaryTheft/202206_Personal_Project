<%@page import="com.privacy.exception.BizNotFoundException"%>
<%@page import="com.privacy.exception.BizPasswordNotMatchedException"%>
<%@page import="com.privacy.vo.MemberVO"%>
<%@page import="com.privacy.exception.BizDuplicateKeyException"%>
<%@page import="com.privacy.exception.BizNotEffectedException"%>
<%@page import="com.privacy.service.MemberServiceImpl"%>
<%@page import="com.privacy.service.MemberService"%>
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
	<%
	session.removeAttribute("memId");
	%>
	<script>
		location.href = "../index.jsp";
		//history.go(-1);
	</script>
</body>
</html>