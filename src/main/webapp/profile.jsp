<%@page import="com.privacy.service.MemberServiceImpl"%>
<%@page import="com.privacy.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, user-scale=no, initial-scale=0.8">
	<title>Privacy</title>

	<!-- CSS -->
	<link rel="stylesheet" href="css/common.css">
	<link rel="stylesheet" href="css/signup.css">

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
	<script src="./js/profile.js"></script>
</head>
<body>
	<%
	MemberService service = new MemberServiceImpl();
	String memId = (String) session.getAttribute("memId");
	if (service.getMember(memId) == null) {
		request.setAttribute("memNotFound", "true");
	} else {
		request.setAttribute("mem", service.getMember(memId));
	}
	%>
	<c:if test="${memNotFound ne null }">
		<c:redirect url="./login.jsp" />
	</c:if>
	<div class="container">
		<div id="header">
			<!-- Load header.html with jQuery -->
		</div>

		<div class="body">
			<div class="title-area">
				<div class="title">
					<h2>
						<ion-icon name="person-outline"></ion-icon>
						회원정보
					</h2>
					<h3>회원 정보를 수정하거나 탈퇴할 수 있습니다</h3>
				</div>
			</div>
			<div class="tabs-area">
				<ul class="tabs">
					<li class="tab"><a href="#tab_form_edit">회원 정보 수정</a></li>
					<li class="tab"><a href="#tab_form_del">회원 탈퇴</a></li>
				</ul>
			</div>
			<div class="tools-category-area" id="tab_form_edit">
				<h1>회원정보 수정</h1>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<form action="./action/mem_updatepw.jsp" id="updatePw_form" method="post">
						<label>아이디<br> <input type="text" name="memId"
							value="${mem.memId }" readonly>
						</label><br> <label>현재 비밀번호<br> <input type="password"
							name="memPwOld" placeholder="지금 사용 중인 비밀번호">
						</label><br> <label>변경할 비밀번호<br> <input type="password"
							name="memPw" placeholder="새로 사용할 비밀번호">
						</label><br> <label>변경할 비밀번호 확인<br> <input
							type="password" name="memPwConfirm" placeholder="다시 한 번 입력"><br>
						</label> <input type="submit" value="수정">
					</form>
				</div>
			</div>
			<div class="tools-category-area" id="tab_form_del">
				<h1>회원 탈퇴</h1>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<form action="./action/mem_delete.jsp" id="del_form" method="post">
						<label>아이디<br> <input type="text" name="memId"
							value="${mem.memId }" readonly>
						</label><br> <label>비밀번호<br> <input type="password"
							name="memPw" placeholder="지금 사용 중인 비밀번호">
						</label><br> <label> <input type="checkbox" id="agree-chkbox">
							작성한 기존 게시물은 삭제되지 않으며, 회원 정보는 탈퇴 즉시 삭제됨을 이해하고 동의합니다.
						</label><br> <input type="submit" value="회원 탈퇴" class="red">
					</form>
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