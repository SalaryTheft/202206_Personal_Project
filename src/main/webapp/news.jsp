<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>Privacy</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/news.css">

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
    <script src="./js/news.js"></script>
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
                    <ion-icon name="newspaper-outline"></ion-icon>
                    보안 뉴스
                </h2>
                <h3>국내 최대 보안 언론</h3>
            </div>
        </div>
        <div class="tabs-area">
            <ul class="tabs">
                <li class="tab">
                    <a href="#tab_headline">헤드라인</a>
                </li>
                <li class="tab">
                    <a href="#tab_all">전체기사</a>
                </li>
                <li class="tab">
                    <a href="https://www.boannews.com/media/list.asp?mkind=1" target="_blank">보안 ⧉</a>
                </li>
                <li class="tab">
                    <a href="https://www.boannews.com/media/list.asp?mkind=2" target="_blank">IT ⧉</a>
                </li>
                <li class="tab">
                    <a href="https://www.boannews.com/media/list.asp?mkind=4" target="_blank">안전 ⧉</a>
                </li>
                <li class="tab">
                    <a href="https://www.boannews.com/securityworld/" target="_blank">보안세상 ⧉</a>
                </li>
            </ul>
        </div>
        <div class="category-area" id="tab_headline">
            <h1>헤드라인</h1>
        </div>
        <div class="wide-card-area">
            <div class="wide-card" id="ajax-news-headline">
                <a>뉴스를 불러오는 중입니다...</a>
            </div>
        </div>
        <div class="tools-category-area" id="tab_all">
            <h1>전체기사</h1>
        </div>
        <div class="wide-card-area">
            <div class="wide-card">
                <table id="news-table">
                    <colgroup>
                        <col width="70%">
                    </colgroup>
                    <thead>
                    <tr>
                        <th>제목</th>
                        <th>날짜</th>
                        <th class="writer">기자</th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- <tr>
                        <td><a href="">국가인재원, 반도체 등 첨단 미래 과학기술 특강 개최</a></td>
                        <td>2022년 06월 24일 09:19</td>
                        <td>박미영 기자</td>
                    </tr> -->
                    </tbody>
                </table>
                <div class="news-more">
                    <a href="https://www.boannews.com/media/t_list.asp">더 많은 뉴스 보기 ⧉</a>
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