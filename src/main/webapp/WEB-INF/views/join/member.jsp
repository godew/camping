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
		<div class="informationInput">
			<div class="emailID">이름</div>
			<div>
				<input class="input1" type="text" placeholder="이름을 입력해주세요.">
			</div>
			<div>이메일 아이디</div>
			<div>
				<input class="input2" type="email" placeholder="이메일 주소를 입력해주세요.">
			</div>
			<div class="emailCheck hidden"></div>
			<div>비밀번호</div>
			<div>
				<input class="input3" type="password" placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="passwordCheck hidden"></div>
			<div>비밀번호 확인</div>
			<div>
				<input class="input4" type="password" placeholder="비밀번호를 입력해주세요">
			</div>
			<div class="cofirmPassword hidden"></div>
			<div>
				<button class="btn">가입하기</button>
			</div>
		</div>
	</div>
	<script>
		const btn = document.querySelector('.btn')	
	
		function checkInput(event) {

			const inputList = Array.from(document.querySelectorAll('.informationInput input'))
			const flag = inputList.filter(input => input.value == '')
			
			if(flag == 0) {
				btn.classList.add('on')
			}
			else {
				btn.classList.remove('on')
			}
		}
		
		const inputList = document.querySelectorAll('.informationInput input')
		inputList.forEach(input => input.addEventListener('keyup', checkInput))
		
		function checkEmail() {
// 			const reg_test = new RegExp('/^[a-z]')
// 			console.log(reg_test.test('abcd'))
			
// 			var reg_email = new RegExp('/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/')
			var reg_email = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/
			console.log(reg_email.test(emailCheck.value))
			
			if(reg_email.test(emailCheck.value)) {
				
			}
			else {
			}
		}
		
		const emailCheck = document.querySelector('.input2')
		const emailCheckResult = document.querySelector('.emailCheck')
		const passwordCheck = document.querySelector('.input3')
		const passwordCheckResult = document.querySelector('.passwordCheck')
		const confirmPasswordInput = document.querySelector('.input4')
		const confirmPasswordResult = document.querySelector('.cofirmPassword')

		emailCheck.addEventListener('keyup', checkEmail)
		passwordCheck.addEventListener('keyup', checkPassword)
		confirmPasswordInput.addEventListener('keyup', confirmPassword)
		
		
		function checkPassword() {
			if(passwordCheck.value.length >= 1 && passwordCheck.value.length < 8) {
				console.log(passwordCheck)
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
				console.log(passwordCheck)
				confirmPasswordResult.classList.remove('hidden')
				confirmPasswordResult.classList.add('textColorRed')
				confirmPasswordResult.innerText="비밀번호가 일치하지 않습니다."
			}
			else if(confirmPasswordInput.value == passwordCheck.value) {
				console.log(passwordCheck)
				confirmPasswordResult.classList.remove('hidden')
				confirmPasswordResult.classList.add('textColorBlue')
				confirmPasswordResult.innerText="일치합니다."
			}
			else if(confirmPasswordInput.value.length == 0) {
				confirmPasswordResult.classList.add('hidden')
			}
		}
	</script>
</body>
</html>