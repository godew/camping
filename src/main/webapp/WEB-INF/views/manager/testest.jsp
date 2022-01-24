<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${cpath }/resources/css/style.css" rel="stylesheet">
</head>
<body>
<c:if test="${empty username }">
	<c:redirect url="/" />
</c:if>

<h1>채팅</h1>
<hr>

<div id="textarea"></div>
<div class="bottom">
	<input id="send" name="send" autofocus>
	<input id="btn" type="button" value="전송">
	<input id="quit" type="button" value="나가기">
	<input id="list" type="button" value="목록">
</div>
<div class="userList"></div>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="${cpath }/resources/js/manager/chat.js"></script>
<script>
	const cpath = '${cpath}'
	const username = '${username}'
	const btn = document.getElementById('btn')
	const send = document.getElementById('send')
	const textarea = document.getElementById('textarea')
	const quit = document.getElementById('quit')
	const list = document.getElementById('list')
	const ws = new SockJS(cpath + '/chat?username=' + username)
	
	ws.onmessage = onMessage
	ws.onopen = onOpen // 웹 소켓이 열리면 입장 메시지 출력
	ws.onclose = onClose
	ws.onerror = function(msg) {}
	
	btn.onclick = sendHandler
	send.onkeydown = keyHandler
	
	list.onclick = showListHandler
</script>
</body>
</html>