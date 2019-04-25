<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="rootPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<title>책나라 도서관</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> <!-- jquery google cdn -->
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link href="${rootPath}/css/list.css?ver=2" rel="stylesheet">
<style>
	* {
	box-sizing: border-box;
}
body {
	display: flex;
	margin:0 10px 0;
	padding-top: 60px;
}
#main-nav {
	position: fixed;
	top:0;
	left:0;
	width:99%;
	
	display: flex;
	
	background-color: white;
	box-shadow: 5px 10px 8px rgba(88,88,88,0.8);
	border-radius: 5px;
	transition: top 0.3s ease-in-out;
}
#main-nav a {
	flex : 0 1 auto;
	display: block;
	color:blue;
	
	text-align: center;
	font-size: 15px;
	text-decoration: none;
	
	padding: 1rem;
}
#main-nav a:nth-child(1) {
	background-color: blue;
	font-weight: bold;
	font-style: italic;
	color:white;
}
#main-nav a:nth-child(2) {
	margin-left : auto;
}
#main-nav a:hover {
	background-color: #ddd;
	color:black;
}
#main-container {
	display: flex;
	flex-flow: row;
	flex-wrap: nowrap;
	
	width:100%;
	
	padding: 15px 15px 2000px;
	border:1px solid blue;
}
.body-box {
	border:1px solid red;
	flex : 1 1 auto;
	overflow: auto;
	padding:10px;
	margin: 16px 8px 16px 16px;
}

</style>
<script>
	$(function(){
		
		var preScroll = $(window).scrollTop() // 현재 윈도우의 전체 높이를 갖는 값
		$(window).scroll(function(){
			
			let currScroll = $(window).scrollTop()
			/* 스크롤을 뭐시기 하는거.... 스크롤하면 nav bar가 사라짐.
			   현재 최상위의 높이값을 가지고 있다가 만약 스크롤을 해서 스크롤 값이 변화가 있으면 top을 -60px로 만들어서 위의
			   메인바를 감추어라.*/
			if(preScroll > currScroll) {
				// main-nav 다시 보이기
				$("#main-nav").css("top","0");
			}else{
				// main-nav 위로 감추기
				$("#main-nav").css("top","-60px")
			}
			
			preScroll = currScroll
			
		})
		
		
	})
</script>
</head>
<body>
<nav id="main-nav">
	<a href="#">책나라 도서관</a>
	<a href="#">로그인</a>
	<a href="${rootPath}/admin/">관리자</a>
	<a href="${rootPath}/user/s_list/마피아">임시</a>
</nav>
<section id="main-container">
	<article id="user" class="body-box"><p>회원 정보
		<%@ include file="/WEB-INF/views/rent_body/user/user_body.jspf" %>	
	</article>
	<article id="rent" class="body-box"><p>대여 정보
		<%@ include file="/WEB-INF/views/rent_body/rent/rent_body.jspf" %>
	</article>
	<article id="book" class="body-box"><p>도서 정보
		<%@ include file="/WEB-INF/views/rent_body/book/book_body.jspf"%>
	</article>
</section>
</body>
</html>