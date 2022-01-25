<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>After Camping</title>
<link href="${cpath }/resources/css/filtercss/filterHeader.css" rel="stylesheet"> 

</head>

<body class="headerBody">
<script>
	const cpath = '${cpath }'
</script>

<div class="filterHeaderWrap">
<header class="filterHeader">
	<div class="content">
		<a href="${cpath }">logo</a>
		<ul>
			<li><img src="${cpath }/resources/img/돋보기.png"></li>
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
			<li><a href="" class="a_tag1">로그인</a></li>
		</ul>
	</div>
</header>
	<div class="underHeader">
		<div class="underHeaderDiv">
			<div class="headerCamping">캠핑</div>
			<div class="headerArea"></div>
			<div class="filterAreaModal areaModalHidden">
				<a><button class="gyeonggi" data-areacode="5001" data-area="경기/인천권 전체">경기/인천권 전체</button></a>
				<a><button class="chungcheong" data-areacode="5003" data-area="충천권 전체">충천권</button></a>
				<a><button class="busan" data-areacode="5004" data-area="경상/부산권 전체">경상/부산권</button></a>
				<a><button class="jeju" data-areacode="5005" data-area="전라/제주권 전체">전라/제주권</button></a>
				<a><button class="gangwon" data-areacode="5002" data-area="강원권 전체">강원권</button></a>
			</div>
		</div>
	</div>
</div>

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

<script>
	const headerBody = document.querySelector('.headerBody')
	const headerArea = document.querySelector('.headerArea')
	const filterAreaModal = document.querySelector('.filterAreaModal')
	const gyeonggi = document.querySelector('.gyeonggi')
	const chungcheong = document.querySelector('.chungcheong')
	const busan = document.querySelector('.busan')
	const jeju = document.querySelector('.jeju')
	const gangwon = document.querySelector('.gangwon')
	
	headerArea.onmouseover = areaOpenHandler
	

	
	function areaOpenHandler(event) {
		filterAreaModal.classList.remove('areaModalHidden')
	}
	
	
	window.addEventListener('load', function() {
		headerArea.innerText = gyeonggi.dataset.area
	})
	
	busan.onclick = function(event) {

		const url = cpath + '/selectArea/' + busan.dataset.areacode
		const opt = {
				method: 'GET'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => render(inDisplay, getDom(json)))
		
		headerArea.innerText = ''
		headerArea.innerText = busan.dataset.area
	}
	
	gyeonggi.onclick = function(event) {

		const url = cpath + '/selectArea/' + gyeonggi.dataset.areacode
		const opt = {
				method: 'GET'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => render(inDisplay, getDom(json)))
		
		headerArea.innerText = ''
		headerArea.innerText = gyeonggi.dataset.area
	}
	
	chungcheong.onclick = function(event) {
		const url = cpath + '/selectArea/' + chungcheong.dataset.areacode
		const opt = {
				method: 'GET'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => render(inDisplay, getDom(json)))
		
		headerArea.innerText = ''
		headerArea.innerText = chungcheong.dataset.area
	}
	
	jeju.onclick = function(event) {
		const url = cpath + '/selectArea/' + jeju.dataset.areacode
		const opt = {
				method: 'GET'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => render(inDisplay, getDom(json)))
		
		headerArea.innerText = ''
		headerArea.innerText = jeju.dataset.area
	}
	
	gangwon.onclick = function(event) {
		const url = cpath + '/selectArea/' + gangwon.dataset.areacode
		const opt = {
				method: 'GET'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => render(inDisplay, getDom(json)))
		
		headerArea.innerText = ''
		headerArea.innerText = gangwon.dataset.area
	}
	
</script>
</body>
