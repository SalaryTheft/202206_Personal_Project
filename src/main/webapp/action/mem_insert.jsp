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
	<jsp:useBean id="mem" class="com.privacy.vo.MemberVO"></jsp:useBean>
	<jsp:setProperty property="*" name="mem" />
	<%
	MemberService service = new MemberServiceImpl();
	try {
		service.insertMember(mem);
	} catch (BizNotEffectedException bne) {
		request.setAttribute("BizNotEffectedException", bne);
	} catch (BizDuplicateKeyException bdk) {
		request.setAttribute("BizDuplicateKeyException", bdk);
	}
	%>
	<c:if test="${BizNotEffectedException ne null }">
		<script>
			alert("회원가입에 실패했습니다. 다시 시도해주세요.");
			location.href = "../signup.jsp";
		</script>
	</c:if>
	<c:if test="${BizDuplicateKeyException ne null }">
		<script>
			alert("이미 사용 중인 아이디입니다. 다른 아이디를 사용해주세요.");
			location.href = "../signup.jsp";
		</script>
	</c:if>
	<c:if
		test="${BizNotEffectedException eq null and BizDuplicateKeyException eq null }">
		<script>
			alert("회원가입되었습니다. 로그인 페이지로 이동합니다.");
			location.href = "../login.jsp";
		</script>
	</c:if>
</body>
</html>