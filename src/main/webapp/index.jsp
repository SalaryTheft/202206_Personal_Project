<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>Privacy</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/home.css">

    <!-- ION-ICON -->
    <script type="module"
            src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule
            src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- JS/JQUERY -->
    <script src="js/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
            $("#header").load("header.jsp");
            $("#footer").load("footer.jsp");
        });
    </script>
    <script src="js/home.js"></script>
</head>

<body>
<div class="container">
    <div id="header">
        <!-- Load header.html with jQuery -->
    </div>

    <div class="body">
        <div class="title-area">
            <div class="title">
                <p class="today-day" id="today-day">31</p> <!-- JS로 유동적으로 변경됨 -->
                <h2>
                    <ion-icon name="calendar-clear-outline"></ion-icon>
                    <div style="display: inline-block" id="today-full-date"></div>
                </h2>
                <h2>오늘 당신의 개인정보는 안녕하십니까?</h2>
            </div>
        </div>
        <div class="content-cards">
            <div class="big-card-area">
                <div class="big-card" id="headline_card">
                    <div class="text-area">
                        <h3>
                            <ion-icon name="newspaper-outline"></ion-icon>
                            보안 뉴스
                        </h3>
                        <h2 id="headline_title">저작권 위반 메일 사칭해 LockBit 랜섬웨어 유포중</h2>
                        <p id="headline_subtitle">
                            저작권법 위반 내용으로 사칭한 피싱 메일 통해 LockBit 랜섬웨어 다시 유포<br> 안랩 ASEC
                            분석팀 “실제 작가의 이름이 포함돼 깜빡 속을 가능성 높아 주의 필요”
                        </p>
                    </div>
                    <div class="img" id="headline_image">
                        <!-- 이미지 -->
                    </div>
                </div>
            </div>
            <div class="small-card-area">
                <div class="small-card">
                    <div class="text-area">
                        <h3>
                            <ion-icon name="browsers-outline"></ion-icon>
                            브라우저
                        </h3>
                        <h2>Firefox</h2>
                        <p>비영리 재단법인인 모질라 재단에서 개발하고 배포하는 브라우저</p>
                    </div>
                </div>
                <div class="small-card">
                    <div class="text-area">
                        <h3>
                            <ion-icon name="eye-off-outline"></ion-icon>
                            광고 및 트래커 차단
                        </h3>
                        <h2>uBlock Origin</h2>
                        <p>여러 브라우저를 지원하는 광고 및 트래커 차단 오픈 소스 확장 프로그램</p>
                    </div>
                </div>
                <div class="small-card">
                    <div class="text-area">
                        <h3>
                            <ion-icon name="server-outline"></ion-icon>
                            DNS 서버
                        </h3>
                        <h2>AdGuard DNS</h2>
                        <p>DNS-over-TLS 및 DNS-over-HTTPS 지원</p>
                    </div>
                </div>
            </div>
            <div class="small-card-area">
                <div class="small-card">
                    <div class="text-area">
                        <h3>
                            <ion-icon name="glasses-outline"></ion-icon>
                            VPN 서비스
                        </h3>
                        <h2>ProtonVPN</h2>
                        <p>강력한 개인정보 보호법을 가진 스위스 기업에서 운영, 무료 요금제 제공</p>
                    </div>
                </div>
                <div class="small-card">
                    <div class="text-area">
                        <h3>
                            <ion-icon name="document-lock-outline"></ion-icon>
                            디스크 암호화
                        </h3>
                        <h2>VeraCrypt</h2>
                        <p>운영체제를 포함한 디스크 전체를 간단히 암호화</p>
                    </div>
                </div>
                <div class="small-card">
                    <div class="text-area">
                        <h3>
                            <ion-icon name="cloud-upload-outline"></ion-icon>
                            클라우드 저장소
                        </h3>
                        <h2>NextCloud</h2>
                        <p>직접 호스팅하여 사용 가능한 클라우드 저장소 서비스</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <div class="text-area">
                    <h1>사이버 범죄 통계</h1>
                    <a class="shortcut-button" href="./crimestats.jsp">자세히 알아보기
                        <ion-icon
                                name="arrow-forward-outline"></ion-icon>
                    </a>
                </div>
            </div>
        </div>
        <div class="more">
            <div class="more-card-area">
                <div class="more-card">
                    <h2>
                        프라이버시와<br>익명성의 차이점
                    </h2>
                    <a class="shortcut-button"
                       href="https://proton.me/blog/anonymity-vs-privacy">바로가기
                        <ion-icon
                                name="arrow-forward-outline"></ion-icon>
                    </a>
                </div>
            </div>
            <div class="more-card-area">
                <div class="more-card">
                    <h2>개인정보 보호수칙</h2>
                    <a class="shortcut-button"
                       href="https://www.privacy.go.kr/nns/prg/man/manInfo.do">바로가기
                        <ion-icon
                                name="arrow-forward-outline"></ion-icon>
                    </a>
                </div>
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