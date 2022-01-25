<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>After Camping</title>
<link href="${cpath }/resources/css/payment/style.css" rel="stylesheet">
<link href="${cpath }/resources/css/payment/pay.css" rel="stylesheet">
<link href="${cpath }/resources/css/payment/pay-modal.css" rel="stylesheet">
<link href="${cpath }/resources/css/header.css" rel="stylesheet">
<link href="${cpath }/resources/css/detail/detail.css" rel="stylesheet">
<link href="${cpath }/resources/css/detail/detail-modal.css" rel="stylesheet">
<link href="${cpath }/resources/css/detail/rooms-info.css" rel="stylesheet">
<link href="${cpath }/resources/css/manager/manager.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/main/main.css">
</head>
<body>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="${cpath }/resources/js/manager/function.js"></script>
<script>
	const cpath = '${cpath }'
	let ws
	if ('${not empty login}' == 'true') {
		ws = new SockJS(cpath + '/chat?username=${login.email}')
	}
	ws.onmessage = onMessage
</script>
<header>
	<div class="content">
		<a href="${cpath }">여기어때</a>
		<ul>
			<li><p style="margin: 0"><img src="${cpath }/resources/img/돋보기.png"></p></li>
			<li><a href="${cpath }/login/{nonReservation}" class="a_tag1">예약내역</a></li>
			<li class="li_seemore">
				더보기
				<div class="hidden header_seemore">
					<ul>
						<li><a href="" class="a_tag2">공지사항</a></li>
						<li><a href="" class="a_tag2">약관 및 정책</a></li>
					</ul>
				</div>
			</li>
			<c:if test="${empty login }">
				<li><a href="${cpath }/login/login" class="a_tag1">로그인</a></li>
			</c:if>
			<c:if test="${not empty login }">SSS
				<li><a href="${cpath }/logout" id="socketclose" class="a_tag1">로그아웃</a></li>
			</c:if>
		</ul>
	</div>
</header>
<script>
	const seeMore = document.querySelector('header .li_seemore')
	const headerSeemore = document.querySelector('.header_seemore')
	const socketclose = document.querySelector('#socketclose')
	
	if (socketclose != null) {
		socketclose.onclick = function() {
			ws.close()			
		}
	}
	seeMore.onmouseover = function() {
		headerSeemore.classList.remove('hidden')
	}
	seeMore.onmouseout = function() {
		headerSeemore.classList.add('hidden')
	}
	headerSeemore.onmouseover = function() {
		headerSeemore.classList.remove('hidden')
	}
	headerSeemore.onmouseout = function() {
		headerSeemore.classList.add('hidden')
	}
</script>