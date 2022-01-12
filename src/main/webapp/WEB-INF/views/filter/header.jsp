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
	
	body{
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
	
	.headerList {
		width: 55%;
		min-width: 930px; 
		box-sizing: border-box;
		margin: 0 auto;	
	}
	
	.headerName {
		width: 55%;
		min-width: 930px; 
		box-sizing: border-box;
		margin: 0 auto;	
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
	
	.headerCamping {
		color: white;
	}
	
	.headerName {
		display: block;
	}
	
</style>
</head>
<body>
<div class="header">
	<section>
		<div class="headerList">
			<div class="headerLogo"><a><img src="${cpath }/resources/img/logo.png"></a></div>
			<div class="clickList">
				<div><a href="">예약 내역</a></div>
				<div><a href="">더보기</a></div>
				<div><a href="">로그인</a></div>
			</div>
		</div>
		<div class="headerName">	
			<h2 class="headerCamping">캠핑</h2>
			<div>dd</div>
		</div>
	</section>
</div>


</body>
</html>