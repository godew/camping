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

	html, body, div, span, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, abbr, address, cite, code, del, dfn, em, img, ins, kbd, q, samp, small, strong, sub, sup, var, b, i, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, figcaption, figure, footer, header, hgroup, menu, nav, section, summary, time, mark, audio, video {
    margin: 0;
    padding: 0;
    border: 0;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
	}
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
	headerdiv{
	position: fixed;
	display: flex;
	justify-content: space-between;
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
	padding: 137px 0 0;
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
	.renameBTN1, .renameBTN2, .renameBTN3{
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
	.modify > p:nth-child(1){
	width: 374px;
	}
	.modify  p > input{
	width: 350px;
	height: 45px;
	border: solid 1px #ccc;
	border-radius: 4px;
	
	}
	
	
	
</style>
</head>
<body>
<div>
	<header>
	<div class="headerdiv">
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
	</header>
	<h2>내정보</h2>

	
