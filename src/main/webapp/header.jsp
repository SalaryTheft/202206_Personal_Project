<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (session.getAttribute("memId") != null) {
	request.setAttribute("isLoggedIn", "true");
} else {
	request.setAttribute("isLoggedIn", "false");
}
%>
<script src="js/header.js"></script>
<div class="header">
	<div class="logo-area">
		<h3>
			<a href="./index.jsp">Privacy</a>
		</h3>
	</div>
	<div class="menu-area">
		<a href="./index.jsp">홈</a> <a href="./tools.jsp">프라이버시 도구</a> <a
			href="./news.jsp">보안 뉴스</a> <a href="./forum.jsp">포럼</a>
	</div>
	<div class="icon-area">
		<ion-icon name="search-outline" id="search-toggle"></ion-icon>
		<c:if test="${isLoggedIn eq 'true' }">
			<ion-icon name="person-outline" id="profile-btn"></ion-icon>
			<ion-icon name="log-out-outline" id="logout-btn"></ion-icon>
		</c:if>
		<c:if test="${isLoggedIn eq 'false' }">
			<ion-icon name="person-add-outline" id="signup-btn"></ion-icon>
			<ion-icon name="log-in-outline" id="login-btn"></ion-icon>
		</c:if>
		<ion-icon name="menu-outline" id="hamburger-toggle"></ion-icon>
	</div>
</div>
<div class="hamburger-menu">
	<a href="./index.jsp">홈</a> <a href="./tools.jsp">프라이버시 도구</a> <a
		href="./news.jsp">보안 뉴스</a> <a href="./forum.jsp">포럼</a>
</div>
<div class="search">
	<form action="">
		<input type="text" placeholder="통합 검색" id="search-input">
		<button type="submit">
			<ion-icon name="search-outline"></ion-icon>
		</button>
	</form>
</div>

<script>
	$(document).ready(function() {
		$("#login-btn").click(function() {
			location.href = "./login.jsp";
		});
		
		$("#profile-btn").click(function() {
			location.href = "./profile.jsp";
		});
		
		$("#signup-btn").click(function() {
			location.href = "./signup.jsp";
		});
		
		$("#logout-btn").click(function() {
			if (confirm("로그아웃 하시겠습니까?")) {
				location.href = "./action/mem_logout.jsp";
			}
		});
	});
</script>