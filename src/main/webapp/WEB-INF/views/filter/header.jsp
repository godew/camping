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
	let ws
	if ('${not empty login}' == 'true') {
		ws = new SockJS(cpath + '/chat?username=${login.email}')
		ws.onmessage = onMessage
	}
</script>

<div class="filterHeaderWrap">
<header>
	<div class="content">
		<a href="${cpath }"><img class="headerLogo" src="${cpath }/resources/img/headerLogo.png"></a>
		<ul>
			<li><p style="margin: 0"><img src="${cpath }/resources/img/돋보기.png"></p></li>
			<li><a href="${cpath }/reservation/${login.memberID}" class="a_tag1">예약내역</a></li>
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
			<c:if test="${not empty login }">
				<li><a href="${cpath }/logout" id="socketclose" class="a_tag1">로그아웃</a></li>
			</c:if>
		</ul>
	</div>
</header>
	<div id="bottom-msg">
		<div class="content-wrap hidden">
			<div class="content"></div>
			<div>
				<input type="text" name="msg" autocomplete="off">
				<button class="ws-send-msg-btn">전송</button>
			</div>
		</div>
		<button class="bottom-msg-btn">관리자 1대1 대화</button>
	</div>

	<div class="underHeader">
		<div class="underHeaderDiv">
			<div class="headerCamping">캠핑</div>
			<div class="headerArea"></div>
			<div class="filterAreaModal areaModalHidden">
				<a><button id="area" class="gyeonggi area" data-areacode="5001" data-area="경기/인천권 전체">경기/인천권 전체</button></a>
				<a><button id="area" class="chungcheong area" data-areacode="5003" data-area="충천권 전체">충천권</button></a>
				<a><button id="area" class="busan area" data-areacode="5004" data-area="경상/부산권 전체">경상/부산권</button></a>
				<a><button id="area" class="jeju area" data-areacode="5005" data-area="전라/제주권 전체">전라/제주권</button></a>
				<a><button id="area" class="gangwon area" data-areacode="5002" data-area="강원권 전체">강원권</button></a>
			</div>
		</div>
	</div>
</div>

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
<script>
	const bottomMsgBtn = document.querySelector('.bottom-msg-btn')
	const contentWrap = document.querySelector('.content-wrap')
	const wsContent = document.querySelector('.content-wrap > .content')
	const contentWrapInput = document.querySelector('.content-wrap input')
	const wsSendMsgBtn = document.querySelector('.ws-send-msg-btn')
	
	bottomMsgBtn.onclick = function() {
		if (contentWrap.classList.contains('hidden')) {
			contentWrap.classList.remove('hidden')
			contentWrapInput.focus()
		} else {
			contentWrap.classList.add('hidden')
		}
	}
	
	wsSendMsgBtn.onclick = function() {
		if (contentWrapInput.value != '') {
			wsContent.innerHTML += renderWsMsg(contentWrapInput.value)
			wsContent.scroll({top: wsContent.scrollHeight, behavior: 'smooth'})
			contentWrapInput.value = ''
			contentWrapInput.focus()
		}
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
		const url = cpath + '/searchArea/' + busan.dataset.areacode
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

		const url = cpath + '/searchArea/' + gyeonggi.dataset.areacode
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
		const url = cpath + '/searchArea/' + chungcheong.dataset.areacode
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
		const url = cpath + '/searchArea/' + jeju.dataset.areacode
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
		const url = cpath + '/searchArea/' + gangwon.dataset.areacode
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
