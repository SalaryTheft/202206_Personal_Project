<%@page import="com.privacy.exception.BizNotFoundException"%>
<%@page import="com.privacy.exception.BizPasswordNotMatchedException"%>
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
		service.deleteMember(mem);
	} catch (BizPasswordNotMatchedException bpn) {
		request.setAttribute("BizPasswordNotMatchedException", bpn);
	} catch (BizNotFoundException bnf) {
		request.setAttribute("BizNotFoundException", bnf);
	}
	%>
	<c:if test="${BizPasswordNotMatchedException ne null }">
		<script>
			alert("비밀번호가 올바르지 않습니다.");
			location.href = "../profile.jsp";
		</script>
	</c:if>
	<c:if test="${BizNotFoundException ne null }">
		<script>
			alert("존재하지 않는 회원입니다.");
			location.href = "../profile.jsp";
		</script>
	</c:if>
	<c:if
		test="${BizPasswordNotMatchedException eq null and BizNotFoundException eq null }">
		<%
		session.removeAttribute("memId");
		%>
		<script>
			alert("탈퇴가 완료되었습니다. 이용해주셔서 감사합니다.");
			location.href = "../index.jsp";
		</script>
	</c:if>
	
</body>
</html>