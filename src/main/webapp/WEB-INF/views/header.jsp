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
</head>
<body>
<script>
	const cpath = '${cpath }'
</script>
<header>
	<div class="content">
		<a href="${cpath }">여기어때</a>
		<ul>
			<li><p style="margin: 0"><img src="${cpath }/resources/img/돋보기.png"></p></li>
			<li><a href="" class="a_tag1">예약내역</a></li>
			<li class="li_seemore">
				더보기
				<div class="hidden header_seemore">
					<ul>
						<li><a href="" class="a_tag2">공지사항</a></li>
						<li><a href="" class="a_tag2">약관 및 정책</a></li>
					</ul>
				</div>
			</li>
			<li><a href="${cpath }/login/login" class="a_tag1">로그인</a></li>
		</ul>
	</div>
</header>
<script>
	const seeMore = document.querySelector('header .li_seemore')
	const headerSeemore = document.querySelector('.header_seemore')
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

