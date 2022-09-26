<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<link rel="stylesheet" href="${path}/css/community.css">
<link rel="stylesheet" href="${path}/public/goods.css">
<link rel="stylesheet" type="text/css" href="${path}/css/writing.css">    
<script src="${path}/js/jquery-3.6.0.min.js" ></script>
<script src="${path}/js/navbar.js"></script>

<script>
$(document).ready(function(){
let sessionId = '${sessionScope.sessionid}';
let productseq = '${oneBoard.id}';
let userId = '${oneBoard.userId}';
	

// 세션과 일치할 시, 수정 삭제 버튼 생성 
	$("#update").append(
	(sessionId == userId ? "<button id='updateBTN' type='submit' value='수정'>수정하기</button>" : "")
	); 
	$("#delete").append( 
	(sessionId == userId ? "<button id='deleteBTN' type='submit' value='삭제'>삭제하기</button>" : "")
	);
	
// 세션 아이디 없으면 예약 막기 	
	$("#reserve").on("click", function(e){
		if(sessionId==""){e.preventDefault();
		alert("로그인이 필요합니다.");
		}
	}); // onclick 예약
	
	
	
	
	
	$("#deleteBTN").on("click", function(e) {
		 if(!confirm("게시물을 삭제하시겠습니까?")){
				e.preventDefault();
			} else{alert("게시물 삭제가 완료되었습니다.")}
	}); // onclick 삭제 
	
	
	

	// 찜 
	$("#zzimSpan").on("click", function(e){
		
		if(sessionId==""){
		alert("로그인이 필요합니다.");
		return false;
		
		}
		
		
	     $.ajax({
	            type : "POST",  
	            url : "/product/zzim",
	            dataType : "json",   
	            data : {'productseq' : productseq, 'memberid' : sessionId },

	            success : function(resp) {
	            if(resp.result == 0){
                	alert("찜!");
                	$("#zzimSpan").html("<img src='http://localhost:8090/pictures/zzim.png' width=50 height=50 style='cursor:pointer'>")
                }
                else if (resp.result == 1){
                 alert("찜 취소!");
             	$("#zzimSpan").html("<img src='http://localhost:8090/pictures/nozzim.png' width=50 height=50 style='cursor:pointer'>")
                }
	            
	            
	            
	            if(resp.result2 == 0){
	            	var result2 = "<img src='http://localhost:8090/pictures/nozzim.png' width=50 height=50 style='cursor:pointer'>"; 
	            }
	            else if(resp.result2 == 1){
	            	var result2 = "<img src='http://localhost:8090/pictures/zzim.png' width=50 height=50 style='cursor:pointer'>";
	            }

	            $("#zzimSpan").html(result2);
	            
		     } 
	     }); // ajax 
	}); // onclick
	
	
	
	
	
	
	

});   // onload
</script>

</head>
<body>
<!-- <jsp:include page="/WEB-INF/views/header.jsp" /> -->

<div class="container-box">
    <div class="main-container">
        <custom-navbar></custom-navbar>



<a href="http://localhost:8090/allproduct">물품리스트</a>
<h1> ConnectUS 상세 품목</h1>


<fmt:parseDate value="${oneBoard.createdAt}" var="uploadDate" pattern="yyyy-MM-dd"/>

<c:set var="current" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${current}" pattern="yyyy-MM-dd" var="currentForm"/>
<fmt:parseDate value="${currentForm}" var="now" pattern="yyyy-MM-dd" />

<fmt:parseNumber value = "${ (now.time - uploadDate.time)/(1000*60*60*24)}" integerOnly="true" var="dateDiff"></fmt:parseNumber>
<c:set var="dateDiffShow" value="${dateDiff}일전" />

<c:if test="${dateDiffShow == '0일전'}"> 
<c:set var="dateDiffShow" value="오늘" />
</c:if>


<c:if test="${oneBoard.zzim == '0'}"> 
<c:set var="zzim" value="<img src='http://localhost:8090/pictures/nozzim.png' width=50 height=50 style='cursor:pointer'>" />
</c:if>

<c:if test="${oneBoard.zzim == '1'}"> 
<c:set var="zzim" value="<img src='http://localhost:8090/pictures/zzim.png' width=50 height=50 style='cursor:pointer'>" />
</c:if>



<Br>



<!-- <c:if test="${!empty oneBoard.img1}" >
<img alt="상품이미지가 없습니다." width=500 height=300 src="http://localhost:8090/upload/${oneBoard.img1}">
</c:if>
<c:if test="${!empty oneBoard.img2}" >
<img alt="상품이미지가 없습니다." width=500 height=300 src="http://localhost:8090/upload/${oneBoard.img2}">
</c:if>
<c:if test="${!empty oneBoard.img3}" >
<img alt="상품이미지가 없습니다." width=500 height=300 src="http://localhost:8090/upload/${oneBoard.img3}">
</c:if>
<c:if test="${!empty oneBoard.img4}" >
<img alt="상품이미지가 없습니다." width=500 height=300 src="http://localhost:8090/upload/${oneBoard.img4}">
</c:if>
<c:if test="${!empty oneBoard.img5}" >
<img alt="상품이미지가 없습니다." width=500 height=300 src="http://localhost:8090/upload/${oneBoard.img5}">
</c:if>
<c:if test="${!empty oneBoard.img6}" >
<img alt="상품이미지가 없습니다." width=500 height=300 src="http://localhost:8090/upload/${oneBoard.img6}">
</c:if> -->

<div class="goods-container-content-box">
    <div class="goods-detail-container">
     <div class="goods-detail-img">
        <!-- 이미지 넣는곳 -->
     </div>
     <div  class="goods-detail-title">
         <span class="detail-title-num">${oneBoard.id}</span>
         <span class="detail-title-title">${oneBoard.title}</span>
         <span class="detail-title-hour">${dateDiffShow} (${oneBoard.createdAt})</span>
         <span class="detail-title-location">${oneBoard.boardRegion}</span>
         <span class="detail-title-owner">${oneBoard.userId}</span>
     </div>
     <div  class="goods-detail-content">
         <textarea name="" id="" cols="30" rows="10">${oneBoard.contents}</textarea>
         <div class="goods-detail-chatbutton">
             <div>💬</div>
             <div id="zzimtd"><span id="zzimSpan">${zzim}</span></div>
         </div>
     </div>
     <div  class="goods-detail-button-box">
        <form action="http://localhost:8090/product/${oneBoard.id}/reservationinput" method="post">
            <input type="hidden" value="${oneBoard.userId}" name="userId">
            <button id="reserve"  type="submit" value="예약하기">예약하기</button>
            </form>
         <form id="update" action="http://localhost:8090/product/${oneBoard.id}/update" >
        </form>
        <form id="delete" action="http://localhost:8090/product/${oneBoard.id}/delete" method="post">
        </form>
     </div>
    </div>               
 </div>

	<!-- <table>
				<thead>
				  <tr>
				    <th>번호</th>			
				    <th>물건</th>
				    <th>내용</th>
				    <th>동네</th>
				    <th>빌려주는분</th>
				    <th>올린날짜</th>
				    <th>찜</th>
				  </tr>
				</thead>				
<tbody>
 <tr>
<th>${oneBoard.id}</th>
<td>${oneBoard.title}</td>
<td>${oneBoard.contents}</td>
<td>${oneBoard.boardRegion}</td>
<td>${oneBoard.userId}</td>
<td>${dateDiffShow} (${oneBoard.createdAt})</td>
<td id="zzimtd"><span id="zzimSpan">${zzim}</span></td>


</tr>
</tbody>

</table> -->





<div id="zzimdiv">

</div>

<br>
<br>

<form action="http://localhost:8090/product/${oneBoard.id}/reservationinput" method="post">
<input type="hidden" value="${oneBoard.userId}" name="userId">
<button id="reserve"  type="submit" value="예약하기"></button>
</form>

<br>

<form id="update" action="http://localhost:8090/product/${oneBoard.id}/update" >
</form>
<Br>

<form id="delete" action="http://localhost:8090/product/${oneBoard.id}/delete" method="post">
</form>
<br>



<br>
<h4>신청된 Connects</h4>
<table border=5>
<tr>
<th>번호</th>
<th>커넥트 시작</th>
<th>커넥트 종료</th>
<th>희망 비용</th>
<th>렌터</th>
</tr>
<c:forEach items="${reservationList}" var="reserv">
<tr>
<th>${reserv.id}</th>
<th>${reserv.startRental}</th>
<th>${reserv.endRental}</th>
<th>${reserv.price}원</th>
<th>${reserv.buyerId}</th>
</tr>
</c:forEach>
</table>




<br>
<br>

<a href="http://localhost:8090/">홈으로</a>

</div>

</div>


<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
        crossorigin="anonymous"></script>
</body>
</html>



















<!-- 원본 -->





















<!-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/css/writing.css">    
<script src="js/jquery-3.6.0.min.js" ></script>
<script>
$(document).ready(function(){
	let sessionId = '${sessionScope.sessionid}';
	let boardlength = '${boardlength}'; 
	
	$("#register").on("click", function(e){
		if(sessionId==""){e.preventDefault();
		alert("로그인이 필요합니다.");
		}
	}); // 물품등록 onclick 

	
	// 찜 
	
	for (var i = 0; i < boardlength; i++) {
		let eachBoardId = $("#boardid"+i).html();
		let intBoardId = parseInt(eachBoardId);
			
		
	$("#zzimSpan"+i).on("click", function(e){
		
		if(sessionId==""){
		alert("로그인이 필요합니다.");
		return false; 
		}
		
		
	     $.ajax({
	            type : "POST",  
	            url : "/product/zzim",
	            dataType : "json",   
	            data : {'productseq' : intBoardId, 'memberid' : sessionId },

	            success : function(resp) {
	            if(resp.result == 0){
                	alert("찜!");
                	$("#zzimSpan"+i).html("<img src='http://localhost:8090/pictures/zzim.png' width=50 height=50 style='cursor:pointer'>")
                }
                else if (resp.result == 1){
                 alert("찜 취소!");
             	$("#zzimSpan"+i).html("<img src='http://localhost:8090/pictures/nozzim.png' width=50 height=50 style='cursor:pointer'>")
                }
	            
	            
	            
	            if(resp.result2 == 0){
	            	var result2 = "<img src='http://localhost:8090/pictures/nozzim.png' width=50 height=50 style='cursor:pointer'>"; 
	            }
	            else if(resp.result2 == 1){
	            	var result2 = "<img src='http://localhost:8090/pictures/zzim.png' width=50 height=50 style='cursor:pointer'>";
	            }

	            $("#zzimSpan"+i).html(result2);
	            
	            location.reload();
	            
		     } 
	     }); // ajax 
	}); // 찜 onclick
	
	
	} // for 
	
	

});
</script>

</head>
<body>
<jsp:include page="/WEB-INF/views/header.jsp" />

<h1> ConnectUS 전체 품목 </h1>


<a id="register" href="http://localhost:8090/registerProduct">물품등록</a>
<br>
	검색기능 
			 <form action="searchproduct">
				<select name="item" style="width:80px;height: 30px; text-align: center;">
					<option value="title">제목</option>
					<option value="boardRegion">지역</option>
					<option value="userId">오너이름</option>
					<option value="contents">내용</option>
				</select>
			
			  <input type="text" name="search" style="width: 250px;height: 30px; margin: 5px">
				<input type="submit" value="검색" style="width: 80px;height: 35px;  margin: 5px">
			</form>
<br>




	<table border=5>
		<thead>
			<tr>
				<th>번호</th>			
				<th>물건</th>
				<th>동네</th>
				<th>빌려주는분</th>
				<th>올린날짜</th>
				<th>찜</th>
			</tr>
		</thead>				
	<tbody>
<c:forEach items="${allboard}" var="board" varStatus="vs" >
<fmt:parseDate value="${board.createdAt}" var="uploadDate" pattern="yyyy-MM-dd"/>

<c:set var="current" value="<%=new java.util.Date()%>" />
<fmt:formatDate value="${current}" pattern="yyyy-MM-dd" var="currentForm"/>
<fmt:parseDate value="${currentForm}" var="now" pattern="yyyy-MM-dd" />

<fmt:parseNumber value = "${ (now.time - uploadDate.time)/(1000*60*60*24)}" integerOnly="true" var="dateDiff"></fmt:parseNumber>

<c:set var="dateDiffShow" value="${dateDiff}일전" />

<c:if test="${dateDiffShow == '0일전'}"> 
<c:set var="dateDiffShow" value="오늘" />
</c:if>

<c:if test="${board.zzim == '0'}"> 
<c:set var="zzim" value="<img src='http://localhost:8090/pictures/nozzim.png' width=50 height=50 style='cursor:pointer'>" />
</c:if>

<c:if test="${board.zzim == '1'}"> 
<c:set var="zzim" value="<img src='http://localhost:8090/pictures/zzim.png' width=50 height=50 style='cursor:pointer'>" />
</c:if>


	<tr>
   <th id="boardid${vs.index}">${board.id}</th>
   <th>
   <a href ="/product/${board.id}">${board.title} <br>
   
   <c:if test="${!empty board.img1}">
   <img alt="사진이 없어요" width=200 height=200 src="http://localhost:8090/upload/${board.img1}"> <br>
   </c:if>
   
   <c:if test="${empty board.img1 && !empty board.img2}">
   <img alt="사진이 없어요" width=200 height=200 src="http://localhost:8090/upload/${board.img2}"> <br>
   </c:if>
   
   <c:if test="${empty board.img1 && empty board.img2 && !empty board.img3}">
   <img alt="사진이 없어요" width=200 height=200 src="http://localhost:8090/upload/${board.img3}"> <br>
   </c:if>
   
   <c:if test="${empty board.img1 && empty board.img2 && empty board.img3 && !empty board.img4}">
   <img alt="사진이 없어요" width=200 height=200 src="http://localhost:8090/upload/${board.img4}"> <br>
   </c:if>
   
   <c:if test="${empty board.img1 && empty board.img2 && empty board.img3 && empty board.img4 && !empty board.img5 }">
   <img alt="사진이 없어요" width=200 height=200 src="http://localhost:8090/upload/${board.img5}"> <br>
   </c:if>
   
   <c:if test="${empty board.img1 && empty board.img2 && empty board.img3 && empty board.img4 && empty board.img5 && !empty board.img6}">
   <img alt="사진이 없어요" width=200 height=200 src="http://localhost:8090/upload/${board.img6}"> <br>
   </c:if>
   
   
   
   </a> 
   </th>
   <td>${board.boardRegion}</td>
   <td>${board.userId}</td>
   <td>${dateDiffShow}</td>
   <td><span id="zzimSpan${vs.index}">${zzim}</span> </td>
    </tr>
 
</c:forEach>
</tbody>

</table>
<br>


<br>
<a href="http://localhost:8090/">홈으로</a>







</body>
</html> -->