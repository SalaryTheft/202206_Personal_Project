<%@page import="com.privacy.vo.BoardVO"%>
<%@page import="com.privacy.service.BoardServiceImpl"%>
<%@page import="com.privacy.service.BoardService"%>
<%@page import="com.privacy.service.MemberServiceImpl"%>
<%@page import="com.privacy.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scale=no, initial-scale=0.8">
    <title>Privacy</title>

    <!-- CSS -->
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/forum.css">

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
    <script src="./js/forum_editor.js"></script>
</head>

<body id="body">
	<%
	MemberService service = new MemberServiceImpl();
	String memId = (String) session.getAttribute("memId");
	if (service.getMember(memId) == null) {
		request.setAttribute("memNotFound", "true");
	} else {
		request.setAttribute("mem", service.getMember(memId));
	}
	
	try {
		int boNo = Integer.parseInt(request.getParameter("boNo"));
		BoardService boService = new BoardServiceImpl();
		BoardVO bo = boService.getBoard(boNo);
		request.setAttribute("bo", bo);
		request.setAttribute("action", "board_update.jsp");
	} catch (NumberFormatException e){
		request.setAttribute("action", "board_insert.jsp");
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
                        <ion-icon name="chatbubbles-outline"></ion-icon> ??????
                    </h2>
                    <h3>???????????? ????????? ????????? ??????</h3>
                </div>
            </div>
            <div class="tabs-area">
                <ul class="tabs">
                    <li class="tab selected">
                        <a href="javascript:history.back()">??????</a>
                    </li>
                    <li class="tab pink">
                        <a href="" id="btn_submit">??????</a>
                    </li>
                </ul>
            </div>
            <form id="board_form" action="./action/${action }" method="post">
                <div class="category-area" id="article_title">
                	<input type="hidden" name="boNo" value="${bo.boNo }">
                	<input type="hidden" name="boWriter" value="${mem.memId }">
                    <input type="text" name="boTitle" id="editor_title" placeholder="????????? ???????????????" value="${bo.boTitle }" required>
                    <br>
                    <select name="boCategory" id="editor_category">
                        <option value="??????" ${bo.boCategory eq '??????' ? 'selected' : '' }>??????</option>
                        <option value="??????" ${bo.boCategory eq '??????' ? 'selected' : '' }>??????</option>
                        <option value="??????" ${bo.boCategory eq '??????' ? 'selected' : '' }>??????</option>
                    </select>
                    <p id="editor_writer_viewonly"> | ${mem.memId }(???)??? ?????? ???</p>
                </div>
                <div class="wide-card-area">
                    <div class="wide-card">
                        <textarea name="boContent" id="editor_content"
                            placeholder="??? ?????? ??? ?????? ?????? ??????????????????">${bo.boContent }</textarea>
                    </div>
                </div>
            </form>
            <div class="tools-category-area" id="tab_password">
                <h2>????????????</h2>
                <p>????????? ??????, ??????, ?????????, ?????? ??? ??????, ????????? ?????? ????????? ????????? ??? ????????????.</p>
            </div>
        </div>
        <hr>
        <div id="footer">
            <!-- Load footer.html with jQuery -->
        </div>
    </div>
</body>

</html>