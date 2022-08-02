<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, user-scale=no, initial-scale=0.8">
<title>Privacy</title>

<!-- CSS -->
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/tools.css">

<!-- ION-ICON -->
<script type="module"
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule
	src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

<!-- JS/JQUERY -->
<script src="./js/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/echarts@5.3.0/dist/echarts.min.js"></script>
<script>
	$(document).ready(function() {
		$("#header").load("header.jsp");
		$("#footer").load("footer.jsp");
	});
</script>
<script src="./js/crimestats.js"></script>
<style>
#stats_table {
	width: 100%; height auto;
	text-align: center;
}

#stats_table {
	border-collapse: collapse;
	text-align: center;
	table-layout: fixed;
}

#stats_table>thead>tr {
	height: 50px;
	border-bottom: 2px solid rgba(0, 0, 0, 0.3);
}

#stats_table>tbody>tr {
	border-bottom: 2px solid rgba(0, 0, 0, 0.1);
}

#stats_table>tbody>tr>td {
	padding: 5px 0 5px 0;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

@media ( prefers-color-scheme : dark) {
	#stats_table>thead>tr {
		border-bottom: 2px solid rgba(255, 255, 255, 0.3);
	}
	#stats_table>tbody>tr {
		border-bottom: 2px solid rgba(255, 255, 255, 0.1);
	}
}
</style>
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
						<ion-icon name="bar-chart-outline"></ion-icon>
						사이버 범죄 통계
					</h2>
					<h3>경찰청 제공, 2020</h3>
				</div>
			</div>
			<div class="tabs-area">
				<ul class="tabs">
					<li class="tab"><a href="#tab_chart">차트</a></li>
					<li class="tab"><a href="#tab_stats">표</a></li>
					<li class="tab"><a href="#tab_map">지도</a></li>
				</ul>
			</div>
			<div class="tools-category-area" id="tab_chart">
				<h1>차트</h1>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<div id="echart" style="width: 100%; height: 500px;">
						<!-- 차트 -->
					</div>
				</div>
			</div>
			<div class="tools-category-area" id="tab_stats">
				<h1>표</h1>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<!-- 차트 -->
					<table id="stats_table">
						<thead>
							<tr>
								<th>년도</th>
								<th>계정도용</th>
								<th>단순침입</th>
								<th>자료유출</th>
								<th>자료훼손</th>
								<th>합계</th>
							</tr>
						</thead>
						<tbody>
							<!-- 							<tr>
								<td>2020</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
								<td>0</td>
							</tr> -->
						</tbody>
					</table>
				</div>
			</div>
			<div class="tools-category-area" id="tab_map">
				<h1>지도</h1>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<!-- * 카카오맵 - 지도퍼가기 -->
					<!-- 1. 지도 노드 -->
					<div id="daumRoughmapContainer1656644856893"
						class="root_daum_roughmap root_daum_roughmap_landing" style="width: 100%"></div>

					<!--
	2. 설치 스크립트
	* 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
-->
					<script charset="UTF-8" class="daum_roughmap_loader_script"
						src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

					<!-- 3. 실행 스크립트 -->
					<script charset="UTF-8">
						new daum.roughmap.Lander({
							"timestamp" : "1656644856893",
							"key" : "2at6u",
							//"mapWidth" : "640",
							"mapHeight" : "360"
						}).render();
					</script>
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