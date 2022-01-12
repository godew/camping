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
	
	.headerArea {
		display: inline-block;
	    top: 0;
	    left: 0;
	    width: auto;
	    height: 32px;
	    padding: 0 36px 0 12px;
	    border: 1px solid rgba(0,0,0,0.04);
	    border-radius: 4px;
	    background: rgba(0,0,0,0.04) url(//image.goodchoice.kr/images/web_v3/ico_arr_down_2.png) right 10px top 8px no-repeat !important;
	    background-size: 18px auto !important;
	    font-size: 18px;
	    font-weight: bold;
	    line-height: 32px;
	    color: #fff;
	}
	
</style>
</head>
<body>
<div class="header">
	<section>
		<div class="headerList">
			<div><a><img class="headerLogo"src="${cpath }/resources/img/logo.png"></a></div>
			<div class="clickList">
				<div><a href="">예약 내역</a></div>
				<div><a href="">더보기</a></div>
				<div><a href="">로그인</a></div>
			</div>
		</div>
		<div class="headerName">	
			<div class="headerCamping">캠핑</div>
			<div class="headerArea">경기/인천권 전체</div>
		</div>
	</section>
</div>


</body>
</html>