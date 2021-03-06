<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="rootPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta charset="UTF-8">
<title>책나라 관리자 화면</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- jquery를 사용해서 만든 3rd party library -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.contextMenu.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-contextmenu/2.7.1/jquery.ui.position.js"></script>

<link href="${rootPath}/css/list.css?ver=1" rel="stylesheet">
<style>

	body, html{
		height: 100%;
	}
	
	
	section{
		display: flex;
		flex-flow: column;
		height: 100px;
	}
	
	#admin-title{
		height: 700px;
		background-color: blue;
		color:white;
		text-align:center;
	}
	
	article{
		flex:1;
	}
	
	#admin-body{
		display: flex;
		padding:0;
		border: 1px solid blue;
		
	}
	
	#admin-body aside{
		flex-basis: 1;
		background-color: green;
		color: white;
		padding:0;
		
	}
	
	#admin-body ul{
		width: 300px;
		padding: 0px;
		text-align:center;
	}
	
	#admin-body a{
		color:white;
		text-decoration:none;
		display: block;
		padding: 5% 5%;
		font-size: 20px;
	}
	#admin-body li{
		list-style: none;
		width: 300px;
	}
	
	#admin-body a:hover{
		background-color:#ddd;
		color: black;
	}
</style>
</head>
<body>
<section>
	<article id="admin-title">
		<h3>책나라 관리자</h3>
	</article>
	<article id="admin-body">
		<aside>
			<ul>
				<!-- 판매관리를 누르면 rootpath에 연결되어서 각 관리의 목록이 뜨게 된다. -->
				<li><a href="${rootPath}/">도서 대여</a></li>
				<li><a href="${rootPath}/admin/user">회원 관리</a></li>
				<li><a href="${rootPath}/admin/book">도서 관리</a></li> 
				<li><a href="">대여 관리</a></li>
				
			</ul>
		</aside>
		<!-- function태그에 body라는 변수에 문자열이 user라는 단어로 시작되는지 물어보는것. User*와 같음 
		 	user를 include하고.. 뭐 또 user를 include하고..;;
		 body라는 값에 booklist라는 문자열이 들어있으면.. 
		-->
	<article>
		<c:choose>
			<c:when test="${ fn:startsWith(BODY,'USER') }">
			<c:if test="${BODY=='USER_LIST'}">
			<h3>회원정보 관리</h3>
			<div>
			<%@include file="/WEB-INF/views/admin_body/admin_user_write.jspf" %>
			</div>
			<div>
			<%@include file="/WEB-INF/views/admin_body/admin_user_list.jspf" %>
			</div>
			</c:if>
			</c:when>
			
			<c:when test="${BODY == 'BOOK_LIST'}">
			<h3>도서정보관리</h3>
			<div>
			<%@include file="/WEB-INF/views/admin_body/admin_book_write.jspf" %>
			</div>
			<div>
			<%@include file="/WEB-INF/views/admin_body/admin_book_list.jspf" %>
			</div>
			</c:when>
		<c:otherwise>
			<h3>아직 구현되지 않은 기능입니다.</h3>
		</c:otherwise>
		</c:choose>
	
	</article>
	</article>
</section>
</body>
</html>