<%@page import="com.privacy.exception.BizNotFoundException" %>
<%@page import="com.privacy.exception.BizPasswordNotMatchedException" %>
<%@page import="com.privacy.vo.MemberVO" %>
<%@page import="com.privacy.exception.BizDuplicateKeyException" %>
<%@page import="com.privacy.exception.BizNotEffectedException" %>
<%@page import="com.privacy.service.MemberServiceImpl" %>
<%@page import="com.privacy.service.MemberService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%request.setCharacterEncoding("utf-8");%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
</head>
<body>
<jsp:useBean id="mem" class="com.privacy.vo.MemberVO"></jsp:useBean>
<jsp:setProperty property="*" name="mem"/>
<%
    MemberService service = new MemberServiceImpl();
    try {
        service.authMember(mem);
    } catch (BizNotFoundException bnf) {
        request.setAttribute("BizNotFoundException", bnf);
    } catch (BizPasswordNotMatchedException bpn) {
        request.setAttribute("BizPasswordNotMatchedException", bpn);
    }

    String save_id = request.getParameter("save_id");
    Cookie save_id_cookie = new Cookie("save_id", mem.getMemId());
    save_id_cookie.setPath("/");
    if (save_id != null) {
        save_id_cookie.setMaxAge(60 * 60 * 24 * 7);
    } else {
        save_id_cookie.setMaxAge(0);
    }
    response.addCookie(save_id_cookie);
%>
<c:if test="${BizNotFoundException ne null }">
    <script>
        alert("아이디 혹은 비밀번호가 일치하지 않습니다(A).");
        location.href = "../login.jsp";
    </script>
</c:if>
<c:if test="${BizPasswordNotMatchedException ne null }">
    <script>
        alert("아이디 혹은 비밀번호가 일치하지 않습니다(B).");
        location.href = "../login.jsp";
    </script>
</c:if>
<c:if test="${BizNotFoundException eq null and BizPasswordNotMatchedException eq null }">
    <%
        // 세션 로그인
        session.setAttribute("memId", mem.getMemId());
    %>
    <script>
        location.href = "../index.jsp";
    </script>
</c:if>
</body>
</html>