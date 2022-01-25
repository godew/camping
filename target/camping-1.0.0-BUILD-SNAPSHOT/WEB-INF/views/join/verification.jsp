<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AfterCamp</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/join/verification.css">
</head>
<body>
<div class="verificationBody">
	<div class="title">
		휴대폰 본인 확인
	</div>
	<div>
		원활한 서비스 제공을 위해, 휴대폰 번호를 입력해주세요.
	</div>
	<div class="pnumForm">
		<div class="pnumTitle">
			휴대폰 번호
		</div>
		<div>
			<input class="phonInput" type="text" onkeyup='checkPnum()' name="pnum" placeholder="휴대폰번호를 입력하세요" required autofocus>
			<button class="pnumBtn">인증번호 전송</button>
		</div>
		<div class="pnumMsg"></div>
	</div>
	<div class="authNumForm hidden">
		<div class="authNumTitle">
			인증 번호
		</div>
		<div>
			<input class="authNumInput" type="text" onkeyup='checkAuthNum()'  name="authNum" placeholder="인증번호를 입력하세요" required>
			<button class="authNumBtn">인증하기</button>
		</div>
		<div class="pnumMsg"></div>
	</div>
</div>
<script>
	const cpath = '${pageContext.request.contextPath}'

	function checkPnum() {
		const flag = pnum.value
		console.log(flag.length)
		if(flag.length == 11) {
			pnumbtn.classList.add('on')
		}
		else {
			pnumbtn.classList.remove('on')
		}
	}
	
	function checkAuthNum() {
		const flag2 = authNum.value
		console.log(flag2.length)
		if(flag2.length == 6) {
			authNumBtn.classList.add('on')
		}
		else {
			authNumBtn.classList.remove('on')
		}
	}
	
	function sendAuthNumHandler(event) {
// 		event.preventDefault()
		const url = cpath + '/verification/authNum/' + pnum.value + '/'
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			
		})
	}
	const pnum = document.querySelector('input[name="pnum"]')
	const authNum = document.querySelector('input[name="authNum"]')
	const pnumbtn = document.querySelector('.pnumBtn')
	const authNumBtn = document.querySelector('.authNumBtn')
	const authNumForm = document.querySelector('.authNumForm')
	const pnumMsg = document.querySelector('.pnumMsg')
	const authNumMsg = document.querySelector('.authNumMsg')
	
	authNumBtn.onclick = function(event) {
		event.preventDefault()
		const auth = document.querySelector('.authNumInput')
		const url = cpath + '/vertification/auth/' + auth.value + '/'
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json  => {
			console.log(json)
			if(json.status == 1) {
				alert(json.msg)
				var sessionData=pnum.value
				sessionStorage.setItem("pnum",sessionData)
				console.log(sessionData)
				location.href='member'
			}
			else {
				alert(json.msg)
			}
		})
		
	}
	
	// 1) 
	pnumbtn.onclick = function(event) {
// 		event.preventDefault()
		sendAuthNumHandler()
		pnumMsg.innerText = '인증번호를 발송했습니다'
		authNumForm.classList.remove('hidden')
	}
</script>
</body>
</html>