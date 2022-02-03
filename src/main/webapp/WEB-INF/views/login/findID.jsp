<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AfterCamp</title>
<link rel="stylesheet" type="text/css"
	href="${cpath }/resources/css/login/findID.css">
</head>
<body>
	<div class="findIdBody">
		<div class="logo">
			<div>
				<a href="${cpath }/login/home"><img
					src="${cpath }/resources/img/logo.png"></a>
			</div>
		</div>
		<div class="title">아이디 찾기</div>
		<div>
			<div class="phonTitle">휴대폰 번호</div>
			<div class="findIdform">
				<div>
					<input class="phone" type="text" name="phone"
						onkeyup='phoneCheck()' placeholder="휴대폰번호"> <input
						type="button" class="phonNumCheck" value="인증번호">
				</div>
				<div class="phoneNumCheckMsg"></div>
				<div class="dlswmd">
					<div class="authNum">
						<input class="authNumInput hidden" type="text" name="authNum" placeholder="인증번호" onkeyup='checkAuthNum()'>
					</div>
					<div class="findIdButton">
						<input class="btn hidden" type="submit" value="인증하기">
					</div>
				</div>
			</div>
		</div>
		<div>
			<div>
				<input class="findIdResult hidden" type="text" readonly>
			</div>
			<div class="loginButton">
				<botton class="loginBtn hidden" type="botton">로그인</botton>
			</div>
		</div>
		<div>
		</div>
	</div>
	<script>
	const cpath = '${pageContext.request.contextPath}'

	const authNum = document.querySelector('.authNum')
	const authNumInput = document.querySelector('.authNumInput')
	const phone = document.querySelector('.phone')
	const phonNumCheck = document.querySelector('.phonNumCheck')
	const phoneNumCheckMsg = document.querySelector('.phoneNumCheckMsg')
	const btn = document.querySelector('.btn')
	const loginBtn = document.querySelector('.loginBtn')
	
	function phoneCheck() {
		const flag = phone.value
		if(flag.length == 11) {
			phonNumCheck.classList.add('on')
		}
		else {
			phonNumCheck.classList.remove('on')
		}
	}
	
	phonNumCheck.onclick = function(event) {
		const url = cpath + '/findID/phoneCheck/' + phone.value + '/'
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			if(json.status == 1) {
				phoneNumCheckMsg.classList.add('blue')
				phoneNumCheckMsg.innerText = '인증번호를 발송했습니다'
				authNumInput.classList.remove('hidden')
			}
			else {
				phoneNumCheckMsg.classList.add('red')
				phoneNumCheckMsg.innerText = '회원정보가 없습니다'
			}
		})
	}
	
	function checkAuthNum() {
		const flag2 = document.querySelector('.authNumInput').value
		console.log(flag2.length)
		if(flag2.length == 6) {
			btn.classList.add('on')
			btn.classList.remove('hidden')
		}
	}
	
	btn.onclick = function(event) {
		event.preventDefault()
		const auth = document.querySelector('.authNumInput')
		const url = cpath + '/findID/auth/' + auth.value + '/'
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			if(json.status == 1) {				
				alert(json.msg)
				console.log(phone)
				const url2 = cpath + '/findID/phone/' + phone.value + '/'
				fetch(url2)
				.then(resp => resp.json())
				.then(json2 => {
					const findIdResult = document.querySelector('.findIdResult')
					findIdResult.classList.remove('hidden')
					findIdResult.value = json2.email
					loginBtn.classList.remove('hidden')
				})
			}
			else {
				alert(json.msg)
			}
		})
	}
	loginBtn.onclick = function(event) {
		location.href=cpath
	}
	
</script>
</body>
</html>