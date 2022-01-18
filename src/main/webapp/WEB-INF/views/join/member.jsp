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
	href="${cpath }/resources/css/join/member.css">
</head>
<body>
	<div>
		<div class="title">
			<img src="${cpath }/resources/img/logo.png">
		</div>
		<div class="titleText">회원가입</div>
		<form method="POST">
			<div class="informationInput">
				<div class="emailID">이름</div>
				<div>
					<input class="input1" type="text" name="name" placeholder="이름을 입력해주세요." required autofocus>
				</div>
				<div>이메일 아이디</div>
				<div class="email">
					<input class="input2" type="email" name="email" placeholder="이메일 주소를 입력해주세요." required>
					<button class="duplicationBtn">중복확인</button>
				</div>
				<div class="emailCheck hidden"></div>
				<div>비밀번호</div>
				<div>
					<input class="input3" type="password" name="memberPW" placeholder="비밀번호를 입력해주세요" required>
				</div>
				<div class="passwordCheck hidden"></div>
				<div>비밀번호 확인</div>
				<div>
					<input class="input4" type="password" placeholder="비밀번호를 입력해주세요" required>
				</div>
				<div class="confirmPassword hidden"></div>
				<div>
					<input class="pnum hidden" type="text" name="phone">
				</div>
				<div>
					<input class="memberKind hidden" type="text" name="memberKind">
				</div>
				<div>
					<button class="btn" type="submit">가입하기</button>
				</div>
			</div>
		</form>
	</div>
	<script>
		const duplication = document.qureySelector('.duplicationBtn')
		
		function emailDuplication() {
			const url = cpath + '/member/email/' + emailCheck.value + '/'
			const opt = {
				method: 'GET'
			}
			
			fetch(url, opt)
			.then(resp => resp.json())
			.then(json => {
				console.log(json)
			})
		}
		
		const session = sessionStorage.getItem("pnum")
		console.log(session)
		const pnum = document.querySelector('.pnum')
		const memberKind = document.querySelector('.memberKind')
		pnum.value = session
		memberKind.value = 'd'
		console.log(memberKind.value)
		const btn = document.querySelector('.btn')	
		
		const inputList = document.querySelectorAll('.informationInput input')
		
		
		function checkEmail() {
			
			var reg_email = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/
			
			if(reg_email.test(emailCheck.value)) {
				emailCheckResult.classList.remove('hidden')
				emailCheckResult.classList.add('textColorBlue')
				emailCheckResult.innerText="사용가능합니다."
				duplication.classList.add('duplicationBtnOn')
			}
			else {
				emailCheckResult.classList.remove('hidden')
				emailCheckResult.classList.add('textColorRed')
				emailCheckResult.innerText="사용불가 : 이메일 형식을 확인해 주세요."
			}
		}
		
		const emailCheck = document.querySelector('.input2')
		const emailCheckResult = document.querySelector('.emailCheck')
		const passwordCheck = document.querySelector('.input3')
		const passwordCheckResult = document.querySelector('.passwordCheck')
		const confirmPasswordInput = document.querySelector('.input4')
		const confirmPasswordResult = document.querySelector('.confirmPassword')

		emailCheck.addEventListener('keyup', checkEmail)
		passwordCheck.addEventListener('keyup', checkPassword)
		confirmPasswordInput.addEventListener('keyup', confirmPassword)
		
		function valueCheck() {
			let valueCheckResult = 0
			const emailClassCheck = emailCheckResult.classList.contains('textColorBlue')
			const passwordClassCheck = passwordCheckResult.classList.contains('textColorBlue')
			const confirmClassCheck = confirmPasswordResult.classList.contains('textColorBlue')
			
			if(emailClassCheck && passwordClassCheck && confirmClassCheck) {
				valueCheckResult = 1
			}
			
			return valueCheckResult
		}
		
		function checkPassword() {
			if(passwordCheck.value.length >= 1 && passwordCheck.value.length < 8) {
				passwordCheckResult.classList.remove('hidden')
				passwordCheckResult.classList.add('textColorRed')
				passwordCheckResult.innerText="사용불가 : 최소 8자 이상 입력해 주세요."
			}
			else if(passwordCheck.value.length >= 8) {
				passwordCheckResult.classList.remove('hidden')
				passwordCheckResult.classList.add('textColorBlue')
				passwordCheckResult.innerText="사용가능합니다."
			}
			else if(passwordCheck.value.length == 0) {
				passwordCheckResult.classList.add('hidden')
			}
		}

		function confirmPassword() {
			if(confirmPasswordInput.value != passwordCheck.value) {
				confirmPasswordResult.classList.remove('hidden')
				confirmPasswordResult.classList.add('textColorRed')
				confirmPasswordResult.innerText="비밀번호가 일치하지 않습니다."
			}
			else if(confirmPasswordInput.value == passwordCheck.value) {
				confirmPasswordResult.classList.remove('hidden')
				confirmPasswordResult.classList.add('textColorBlue')
				confirmPasswordResult.innerText="일치합니다."
			}
			else if(confirmPasswordInput.value.length == 0) {
				confirmPasswordResult.classList.add('hidden')
			}
		}
		
		function checkInput(event) {

			const inputList = Array.from(document.querySelectorAll('.informationInput input'))
			const flag = inputList.filter(input => input.value == '')
			const check = valueCheck()

			console.log(flag, check)
			
			if(flag == 0 && check == 1) {
				btn.classList.add('on')
			}
			else {
				btn.classList.remove('on')
			}
		}
		
		inputList.forEach(input => input.addEventListener('keyup', checkInput))
	</script>
</body>
</html>