<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>Privacy</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/signup.css">

    <!-- ION-ICON -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="./js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#header").load("header.jsp");
            $("#footer").load("footer.jsp");
        });
    </script>
    <script src="./js/reset_pw.js"></script>
</head>

<body>
    <div class="container">
        <div id="header">
            <!-- Load header.html with jQuery -->
        </div>

        <div class="body">
            <div class="title-area">
                <div class="title">
                    <h2>
                        <ion-icon name="person-outline"></ion-icon> 비밀번호 재설정
                    </h2>
                    <h3>비밀번호를 초기화할 수 있습니다</h3>
                </div>
            </div>
            <div class="tabs-area">
                <ul class="tabs">
                    <li class="tab">
                        <a href="#tab_form_edit">보안 질문 확인</a>
                    </li>
                </ul>
            </div>
            <div class="tools-category-area" id="tab_form_edit">
                <h1>보안 질문 확인</h1>
            </div>
            <div class="wide-card-area">
                <div class="wide-card">
                    <form action="./action/mem_resetpw.jsp" id="register_form" method="post">
                        <label>아이디<br>
                            <input type="text" name="memId" placeholder="회원 아이디">
                        </label><br>
                        <label>보안 질문<br>
                            <select name="memSq" id="memSq">
                                <option value="">-- 선택하세요 --</option>
                                <option value="q1">가장 좋아하는 음식은?</option>
                                <option value="q2">가장 좋아하는 색상은?</option>
                                <option value="q3">내가 가장 아끼는 보물 1호는?</option>
                            </select>
                        </label><br>
                        <label>보안 질문 정답<br>
                            <input type="text" name="memSa" placeholder="회원 가입 시 등록한 답변">
                        </label><br>
                        <label>변경할 비밀번호<br>
                            <input type="password" name="memPw" placeholder="새로 사용할 비밀번호">
                        </label><br>
                        <label>변경할 비밀번호 확인<br>
                            <input type="password" name="memPwConfirm" placeholder="다시 한 번 입력"><br>
                        </label>
                        <p>아이디에 대한 보안 질문과 정답이 모두 일치 시에만 비밀 번호가 수정됩니다.</p>
                        <input type="submit" value="수정">
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