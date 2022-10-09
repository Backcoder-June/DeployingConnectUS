<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
	<script src="${path}/js/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="${path}/css/header.css">
	
	
	<script>
	
	$(function (){
		$("#submitbtn").on("click",function(e){
		e.preventDefault();
		let sessionId = '<%=session.getAttribute("sessionid")%>';
		<%-- let title = '<%=request.getParameter("title")%>';
		let created = '<%=request.getParameter("createdAt")%>';
		let list = [];
		
		alert(sessionId + "," + title);
		$.ajax({
			type : "POST",
			url : "/notice/selectproductnotice", 
			dataTye : "json",
			data : {'memberid': sessionId, 'title' : title},
			success : function(res) {
			list = res;
			$.each(list, function(i, item){
				$("submitresult").append(item.title);
			
				$("#noticeinfo").append("<li></li>");
				$("#noticeinfo").append(
						"<span class='test2'>" + item.sessionid + "</span>"
						+ "<span class='test2'>" + item.title + "</span>")
			
			/* error:function(request,status,error){
				
				} */
			})				
		}
	}) // ajax end --%> 
	$.ajax({
		url : "/product/" + $("#boardId").val() + "/ajax" ,
		dataType :"json",
		success : function(response){
		 /* alert(sessionId + "님 " + response.title + "ㅅ 상품 "); */
		 //예약하기 버튼을 누르지않았다면 그 값은 Null값으로
		 
		 /* if $("#submitbtn" == null){ */
			 $("#submitbtn").on("click", function (e){
				if(sessionId == ""){
					e.preventDefault();
					else{
						
					}
				}
				 
			 });
			 
			/*  $("#submitresult")response.preventDefault(); */
			 
		 }
		}
		});
		
	})
})
	
	</script>
	

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
			<span><img src="../../../pictures/menu-icon.png" class="header-menu-button"></span>
			<span class="header-menu-title">Connect Us</span>
		</div>
		<div class="header-search-box">
			<div class="input-group header-search-box-inner">
				<input class="header-search-input" type="text" class="form-control">
				<button class="btn btn-outline-secondary header-search-button" type="button"
					id="button-addon2">Button</button>
			</div>
		</div>
		<div class="header-sign-box">
			<% if(session.getAttribute("sessionid")==null) { %>
				<a class="loginBtn" href="../login">로그인</a>
				<% } else { %>

				<div class="test"  id="noticeimage" position : relative; "><img src="pictures/notice.png" width="50"></img>
        			<div class="test2" id="noticeinfo" style="width : 100px; height:500px; background-color: white; margin-top : 50px; position : absolute;  ">
          
            		<span id="submitresult"> ${sessionid}님 ,${oneProduct.title} 예약에 성공하셨습니다. </span><br>
            								
        			</div>
    			</div>

			
					

					<a href="/mypage" class="mypage">마이페이지 </a>
					<a id="logoutchk" href="/logout" class="mypage">로그아웃</a>
					<% } %>
		</div>
	</header>
	<!--Navbar-->
	<nav class="nav-box">
		<% if(session.getAttribute("sessionid")==null) { %>
			<div class="basic-menu-box">
				<div class="nav-menu-box mb-3">
					<span class="menu-icon"><a href="http://localhost:8090/allproduct"><img
								src="${path}/pictures/home.png" alt=""></a></span>
					<div class="menu-title close"><a href="http://localhost:8090/allproduct">전체 물품</a></div>
				</div>
				<div class="nav-menu-box mb-3">
					<span class="menu-icon"><a href="http://localhost:8090/neighbor"><img
								src="${path}/pictures/neighbor.png" alt=""></a></span>
					<div class="menu-title close"><a href="http://localhost:8090/neighbor">내 이웃</a></div>
				</div>

				<div class="header-sign-box">
					<% if(session.getAttribute("sessionid")==null) { %>
						<a class="loginBtn" href="../login">로그인</a>
						<% } else { %>
							<a href="/mypage" class="mypage">마이페이지 </a>
							<a id="logoutchk" href="/logout" class="mypage">로그아웃</a>
							<% } %>

				<div class="nav-menu-box mb-3">
					<span class="menu-icon"><a href="http://localhost:8090/boardstart"><img
								src="${path}/pictures/community.png" alt=""></a></span>
					<span class="menu-title close"><a href="http://localhost:8090/boardstart">커뮤니티</a></span>
				</div>
			</div>
			<div class="nav-menu-box">
				<span class="menu-icon"><a href="http://localhost:8090/mypage"><img src="${path}/pictures/mypage.png"
							alt=""></a></span>
				<span class="menu-title close"><a href="http://localhost:8090/mypage">마이페이지</a></span>
			</div>
			<!-- 서브메뉴타이틀 -->
			<div class="nav-sub-menu-box mb-3">
				<span class="menu-title menu-title-sub close"><a href="http://localhost:8090/chatList">채팅리스트</a></span>
			</div>

			<% } else { %>
				<div class="basic-menu-box">
					<div class="nav-menu-box mb-3">
						<span class="menu-icon"><a href="http://localhost:8090/allproduct"><img
									src="${path}/pictures/home.png" alt=""></a></span>
						<div class="menu-title close"><a href="http://localhost:8090/allproduct">전체 물품</a></div>
					</div>
					<div class="nav-menu-box mb-3">
						<span class="menu-icon"><a href="http://localhost:8090/neighbor"><img
									src="${path}/pictures/neighbor.png" alt=""></a></span>
						<div class="menu-title close"><a href="http://localhost:8090/neighbor">내 이웃</a></div>
					</div>
					<div class="nav-menu-box mb-3">
						<span class="menu-icon"><a href="http://localhost:8090/boardstart"><img
									src="${path}/pictures/community.png" alt=""></a></span>
						<span class="menu-title close"><a href="http://localhost:8090/boardstart">커뮤니티</a></span>
					</div>
				</div>
				<div class="nav-menu-box">
					<span class="menu-icon"><a href="http://localhost:8090/mypage"><img src="${path}/pictures/mypage.png"
								alt=""></a></span>
					<span class="menu-title close"><a href="http://localhost:8090/mypage">마이페이지</a></span>
				</div>
				<!-- 서브메뉴타이틀 -->
				<div class="nav-sub-menu-box mb-3">
					<span class="menu-title menu-title-sub close"><a href="http://localhost:8090/chatList">채팅리스트</a></span>
				</div>
				<% } %>
	</nav>

	<script>
		// 메뉴 타이틀 생성
		let menu = document.querySelector('.header-menu-button');
		let menuTitle = document.querySelectorAll('.menu-title');

		menu.addEventListener('click', function () {
			for (let i = 0; i < menuTitle.length; i++) {
				menuTitle[i].classList.toggle('close');
			}
		})
	</script>
	
	 <script>
	 //알람버튼 클릭했을때 자동으로 on/off하게 하는 기능
        document.querySelector('.test').addEventListener('click', function(){
            document.querySelector('.test2').classList.toggle('close');
        })

    </script>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
		crossorigin="anonymous"></script>
</body>

</html>