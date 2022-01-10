<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<style>
/* div, nav, b, span, body, ul, li{ */
/* border: 1px solid black; */
/* } */


	a{
		color: inherit;
		text-decoration: none;
		cursor: pointer;
	}
	button{
	cursor: pointer;
	}
	li{
		list-style: none;
	}
	h2{
	font-size: 36px;
	}
	header{
	background-color: #F7323F;
	color: #FFFFFF;
	margin: 0;
	box-sizing: border-box; 
	height: 210px;
	}
	header > div{
	display: flex;
	justify-content: space-between;
	position: sticky;
	top: 0;
	}
	.topmenu{
	display: flex;
	}
	#searchBtn{
	width: 30px;
	height: 30px;
	border: none;
	background-color: #F7323F;
	}
	.content{
	display: flex;
	padding: 54px 0 50px;
	margin: 0 67px;
	height: 1010px;
	}
	.hidden{
	display: none;
	}
	.userInfo{
	display: block;
	width: 724px;
	margin: 0 31px 0 0;
	}
	.leftmenu > nav{
	width: 238px;
	height: 238px;
	padding-left: 31px;
	}
	.leftmenu nav ul li{
	margin-bottom: 26px;
	color: #0000008F;
	font-size: 18px;
	}
	.BTN{
	
	}
	#renameBTN{
	width: 300px;
	height: 42px;
	background-color: #FFFFFF;
	border-radius: 4px;
	border: solid 1px #ccc;
	justify-content: flex-start;
	}
	.userInfo > div{
	display: block;
	}
	.username{
	
	}
	.username b{
	margin: 0 0 15px;
	font-size: 16px;
	width: 28%;
	}
	.username span{
	color: #0000008F;
	}
</style>
</head>
<body>
	<header>
	<div>
		<a href="${cpath }/">logo</a>
		<nav>
			<ul class="topmenu">
				<li><button id="searchBtn" type="button"><img src="https://image.goodchoice.kr/images/web_v3/ico_srch_2.png" width="30px;"></button></li>
				<li><a href="">내주변</a></li>
				<li><a href="">예약내역</a></li>
				<li><a href="">더보기</a></li>
			</ul>
		</nav>
	</div>
	<h2>내정보</h2>
	</header>

	
