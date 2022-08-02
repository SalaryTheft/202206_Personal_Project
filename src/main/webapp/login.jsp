<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>Privacy</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/login.css">

    <!-- ION-ICON -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="js/jquery.min.js"></script>

    <!-- 아이디 기억 기능 구현(쿠키) -->
    <%
        String saved_id = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("save_id")) {
                    saved_id = cookie.getValue();
                    break;
                }
            }
        }
        request.setAttribute("saved_id", saved_id);
    %>
</head>

<body>
<div class="container">
    <div class="login_card">
        <h1><a href="./index.jsp">Privacy</a></h1>
        <form action="./action/mem_login.jsp" method="post" id="login_form">
            <input type="text" name="memId" id="id" class="idpw" placeholder="아이디" value="${saved_id}">
            <input type="password" name="memPw" id="pw" class="idpw" placeholder="비밀번호">
            <label><input type="checkbox" name="save_id" id="save_id" ${saved_id ne null ? 'checked' : ''}>아이디 기억</label><br>
            <a href="./reset_pw.jsp">비밀번호를 잊으셨나요?</a><br><br>
            <input type="submit" value="로그인"><br><br><br>
            <a href="./signup.jsp">회원가입</a> | <a href="./signup.jsp">개인정보 처리방침</a>
        </form>
    </div>
</div>
</body>

</html>