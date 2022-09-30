<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<c:set var="path" value="${pageContext.request.contextPath}" />

		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
				crossorigin="anonymous">
			<script src="${path}/js/jquery-3.6.0.min.js"></script>
			<link rel="stylesheet" href="${path}/css/header.css">

			<script>
				$(document).ready(function () {
					$("#logoutchk").click(function (ev) {
						if (!confirm("로그아웃 하시겠습니까?")) {
							ev.preventDefault();
						} else { alert("로그아웃 되었습니다.") }
					});
					$("#deletechk").click(function (ev) {
						if (!confirm("회원탈퇴 하시겠습니까?")) {
							ev.preventDefault();
						} else { alert("회원탈퇴가 완료되었습니다.") }
					});
				});
			</script>
			<title>ConnectUs</title>

			<script>
				$(document).ready(function () {

				});
			</script>
		</head>

		<body>

				<!--Header-->
				<header class="header-box">
					<div class="header-menu-logo-box">
						<span><img src="../../../resources/static/pictures/menu-icon.png"
								class="header-menu-button"></span>
						<span>Connect Us</span>
					</div>
					<div class="header-search-box">
						<div class="input-group header-search-box-inner">
							<input type="text" class="form-control" placeholder="Recipient's username"
								aria-label="Recipient's username" aria-describedby="button-addon2">
							<button class="btn btn-outline-secondary" type="button" id="button-addon2">Button</button>
						</div>
					</div>
					<div class="header-sign-box">
						<% if(session.getAttribute("sessionid") == null) { %>
						<a class="loginBtn" href="../login">로그인</a>
						<% } else { %>
						<a href="/memberupdate" class="mypage">마이페이지 </a>
                <a id="logoutchk" href="/logout" class="mypage">로그아웃</a>
						<% } %>
					</div>
				</header>
				<!--Navbar-->
				<nav class="nav-box">
					<% if(session.getAttribute("sessionid") == null) { %>
						<div class="basic-menu-box">
							<div class="nav-menu-box">
								<span class="menu-icon"><img src="../../../../resources/static/pictures/product.png" alt=""></span>
								<div class="menu-title close"><a href="/">전체 물품</a></div>
							</div>
							<div class="nav-menu-box">
								<span class="menu-icon"><img src="../../../../resources/static/pictures/community.png" alt=""></span>
								<span class="menu-title close"><a href="/">커뮤니티</a></span>
							</div>
							</div>
							<div class="after-login-menu-box">
								<div class="nav-menu-box">
									<span class="menu-icon"><img src="../../../../resources/static/pictures/chat.png" alt=""></span>
									<span class="menu-title close"><a href="">채팅시스템</a></span>
								</div>
							</div>
					<% } else { %>
						<div class="basic-menu-box">
							<div class="nav-menu-box">
								<span class="menu-icon"><img src="../../../../resources/static/pictures/product.png" alt=""></span>
								<div class="menu-title close"><a href="/">전체 물품</a></div>
							</div>
							<div class="nav-menu-box">
								<span class="menu-icon"><img src="../../../../resources/static/pictures/community.png" alt=""></span>
								<span class="menu-title close"><a href="/">커뮤니티</a></span>
							</div>
							</div>
							<div class="after-login-menu-box">
								<div class="nav-menu-box">
									<span class="menu-icon"><img src="../../../../resources/static/pictures/chat.png" alt=""></span>
									<span class="menu-title close"><a href="">채팅시스템</a></span>
								</div>
							</div>
					<% } %>
				</nav>




			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
				crossorigin="anonymous"></script>
		</body>

		</html>