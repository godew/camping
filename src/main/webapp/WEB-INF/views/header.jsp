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
<link href="${cpath }/resources/css/filtercss/filterHeader.css" rel="stylesheet"> 
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/main/main.css">
</head>
<body class="headerBody">
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="${cpath }/resources/js/manager/function.js"></script>
<script>
	const cpath = '${cpath }'
	let ws
	if ('${not empty login}' == 'true') {
		ws = new SockJS(cpath + '/chat?username=${login.email}')
		ws.onmessage = onMessage
	}
</script>
<header>
	<div class="content">
		<a href="${cpath }"><img class="headerLogo" src="${cpath }/resources/img/headerLogo.png"></a>
		<ul>
			<li><p style="margin: 0"><img src="${cpath }/resources/img/돋보기.png"></p></li>
			<c:if test="${not empty login and login.email eq 'manager@naver.com'}">
				<li><a href="${cpath }/manager" class="a_tag1">관리자 페이지</a></li>
			</c:if>
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
<c:if test="${not empty login and login.email ne 'manager@naver.com'}">
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
</c:if>
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
<!-- web socket js -->
<script>
	let bottomMsgBtn
	let contentWrap
	let wsContent
	let contentWrapInput
	let wsSendMsgBtn
	let cnt = 0
	
	if('${not empty login and login.email ne "manager@naver.com"}' == 'true') {
		bottomMsgBtn = document.querySelector('.bottom-msg-btn')
		contentWrap = document.querySelector('.content-wrap')
		wsContent = document.querySelector('.content-wrap > .content')
		contentWrapInput = document.querySelector('.content-wrap input')
		wsSendMsgBtn = document.querySelector('.ws-send-msg-btn')
		
		bottomMsgBtn.onclick = function() {
			if (contentWrap.classList.contains('hidden')) {
				contentWrap.classList.remove('hidden')
				contentWrapInput.focus()
				cnt = 0
				bottomMsgBtn.innerText = '관리자 1대1 대화'
			} else {
				contentWrap.classList.add('hidden')
			}
		}
		
		
		wsSendMsgBtn.onclick = wsMsgBtnHandler
		
		contentWrapInput.onkeydown = function(event) {
			if (event.key == 'Enter') {
				wsMsgBtnHandler()
			}
		}
		
		function wsMsgBtnHandler() {
			if (contentWrapInput.value != '') {
				wsContent.innerHTML += renderWsMsg(contentWrapInput.value)
				wsContent.scroll({top: wsContent.scrollHeight, behavior: 'smooth'})
				
				const payload = {
					msg : contentWrapInput.value,
					target : 'manager@naver.com',
					me : '${login.email}'
				}
				ws.send(JSON.stringify(payload))
				
				contentWrapInput.value = ''
				contentWrapInput.focus()
			}
		}
	}
	
</script>
<script>
	window.onbeforeunload = function() {
		if (ws != null) {
			if ('${login.email}' == 'manager@naver.com') {
				if (document.querySelector('#userlist') != null) {
					const obj = {}
					const managerMsgs = document.querySelectorAll('.manager-msg')
					managerMsgs.forEach(ms => {
						obj[ms.dataset.name] = ms.outerHTML
					})
					
					const nameObj = {}
					const users = document.querySelectorAll('.user')
					users.forEach(user => {
						nameObj[user.dataset.user] = user.outerHTML
					})
					
					const payload = {
						status : 'end',
						me : 'manager@naver.com',
						store : obj,
						name : nameObj
					}
					
					ws.send(JSON.stringify(payload))
				}
			} else {
				const payload = {
					status : 'end',
					me : '${login.email}',
					store : wsContent.innerHTML,
					bottomMsgBtn : bottomMsgBtn.innerText
				}
				ws.send(JSON.stringify(payload))
			}
		}
	}
	if (document.getElementById('socketclose') != null) {
		document.getElementById('socketclose').onclick = function() {
			if ('${login.email}' == 'manager@naver.com') {
				if (document.querySelector('#userlist') != null) {
					const obj = {}
					const managerMsgs = document.querySelectorAll('.manager-msg')
					managerMsgs.forEach(ms => {
						obj[ms.dataset.name] = ms.outerHTML
					})
					
					const nameObj = {}
					const users = document.querySelectorAll('.user')
					users.forEach(user => {
						nameObj[user.dataset.user] = user.outerHTML
					})
					
					const payload = {
						status : 'end',
						me : 'manager@naver.com',
						store : obj,
						name : nameObj
					}
					
					ws.send(JSON.stringify(payload))
				}
			} else {
				const payload = {
					status : 'end',
					me : '${login.email}',
					store : wsContent.innerHTML,
					bottomMsgBtn : bottomMsgBtn.innerText
				}
				ws.send(JSON.stringify(payload))
			}
		}
	}
</script>