<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.filterBody{
		margin: 0;
	}
	.header{
/* 		width: 1400px; */
		height: 220px;
		background-color: #F7323F;
		border: none;
		margin-bottom: 20px;
		height: 25vh;
		width: 100vw;
	}
	
	.headerList{
 		display: flex; 
		justify-content: space-between;
	}
	
	.clickList {
		text-decoration: none;
	}
	
	.headerLogo {
		margin-top: 30px;
	}
	
	
	.clickList > div > a {
		text-decoration: none;
		width: 100px;
		height: 18px;
		color: #FFFFFFCC;
		font-size: 18px;
		text-align: center;
		margin-top: 30px;
	}
	
	.clickList > div {
		width: 100px;
	}
	
	.clickList > div > a:nth-child(1){
/* 		margin-right: 30px; */
	}
	
	.clickList > div {
		display: flex;
	}
	
	.headerList > .clickList {
		display: flex;
	}
	
/* 	.aa{ */
/* 		position: fixed; */
/* 	} */
	
</style>
</head>
<body class="filterBody">
<div class="header">
	<section class="headerList">
		<div class="headerLogo"><a><img src="">logo</a></div>
		<div class="clickList">
			<div><a href="">예약 내역</a></div>
			<div><a href="">더보기</a></div>
			<div><a href="">로그인</a></div>
		</div>
	</section>
</div>


</body>
</html>