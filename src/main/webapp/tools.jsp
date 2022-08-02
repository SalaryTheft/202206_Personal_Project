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
<script>
	$(document).ready(function() {
		$("#header").load("header.jsp");
		$("#footer").load("footer.jsp");
	});
</script>
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
						<ion-icon name="hammer-outline"></ion-icon>
						프라이버시 도구
					</h2>
					<h3>내 프라이버시와 개인정보를 지키는 도구</h3>
				</div>
			</div>
			<div class="tabs-area">
				<ul class="tabs">
					<li class="tab"><a href="#tab_browser">웹 브라우저</a></li>
					<li class="tab"><a href="#tab_password">비밀번호 관리자</a></li>
					<li class="tab"><a href="#tab_filecrypt">파일 암호화</a></li>
					<li class="tab"><a href="#tab_os">운영체제</a></li>
					<li class="tab"><a href="#tab_productivity">생산성</a></li>
					<li class="tab"><a href="#tab_im">인스턴트 메신저</a></li>
					<li class="tab"><a href="#tab_cloud">클라우드 저장소</a></li>
					<li class="tab"><a href="#tab_dns">DNS 서버</a></li>
					<li class="tab"><a href="#tab_vpn">VPN 서비스</a></li>
				</ul>
			</div>
			<div class="tools-category-area" id="tab_browser">
				<h1>웹 브라우저</h1>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<h1>Firefox</h1>
					<h3>Reliable, fast and privacy friendly</h3>
					<a>It's recommended to install additional browser addons to
						strengthen Firefox even more. Firefox is able to sync accross all
						your devices on different platforms. Firefox is not the perfect
						out of the box solution but It's definetly worth it to take the
						extra time and setup Firefox properly. <br> <br> Check
						for WebRTC & DNS leaks and learn how to fix them with the
						connection check at mullvad.net. <br> <br> Hardening &
						Tweaking: The default settings of Firefox are not the best choice
						to be a privacy respecting browser. Use Firefox Profilemaker to
						adjust the settings. An alternative is to download the hardened
						Arkenfox's user.js - Place this in your Firefox's user.js
						directory and it will fix everything for you. You can also do it
						manually.
					</a>
				</div>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<h1>Tor</h1>
					<h3>Encrypted out of the box for extra privacy and anonymity</h3>
					<p>Tor Browser is your choice if you need an extra layer of
						anonymity. It's a modified version of Firefox, which comes with
						pre-installed privacy add-ons, encryption, and an advanced proxy.
						It's not recommended to install additional browser addons. Plugins
						or addons may bypass Tor or compromise your privacy.</p>
				</div>
			</div>
			<div class="tools-category-area" id="tab_password">
				<h1>비밀번호 관리자</h1>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<h1>BitWarden</h1>
					<h3>Easy to use, modern, cross platform and convenient</h3>
					<p>Bitwarden is our top choice. You can import your previous
						passwords from other password managers with ease. Free for
						personal use. Available for Desktop, all Browsers, Android and
						iOS.</p>
				</div>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<h1>LessPass</h1>
					<h3>ESecurely generated passwords with no storage or snyc
						needs</h3>
					<p>If you like Bitwarden but don't like syncing or storage of
						passwords then LessPass is your choice. Browsers, mobile phones
						and the command line are supported platforms.</p>
				</div>
			</div>
			<div class="tools-category-area" id="tab_filecrypt">
				<h1>파일 암호화</h1>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<h1>VeraCrypt</h1>
					<h3>On-the-fly Disk Encryption</h3>
					<p>It can create a virtual encrypted disk that works just like
						a regular disk but within a file. It can also encrypt a partition
						or the entire storage device with pre-boot authentication.</p>
				</div>
			</div>
			<div class="wide-card-area">
				<div class="wide-card">
					<h1>Cryptomator</h1>
					<h3>Encrypt Dropbox, Google Drive and other cloud storage</h3>
					<p>Cryptomator encrypts your data quickly and easily.
						Afterwards you upload them protected to a cloud service.</p>
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