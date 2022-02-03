<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AfterCamp</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/login/findPassword.css">
</head>
<body>
<div class="findPasswordBody">
		<div class="logo">
			<div>
				<a href="${cpath }/login/home"><img
					src="${cpath }/resources/img/logo.png"></a>
			</div>
		</div>
		<div class="title">비밀번호 변경</div>
		<form method="POST">
			<div>
				<div class="emailTitle">이메일</div>
				<div class="findPasswordform">
					<div>
						<input class="emailCheck" type="email" name="email" placeholder="이메일 주소를 입력해 주세요.">
						<input type="button" class="emailCheckBtn" value="인증하기">
					</div>
					<div class="emailCheckMsg"></div>
					<div class="changePassword">
						<input class="changePasswordInput hidden" type="password" name="memberPW" placeholder="변경할 비밀번호">
					</div>
					<div class="passwordMsg"></div>
					<div class="changePassword">
						<input class="changePasswordCheckInput hidden" type="password" name="changePassword" placeholder="비밀번호 확인">
					</div>
					<div class="passwordCheckMsg"></div>
				</div>
			</div>
			<div>
				<div class="findPasswordButton">
					<button class="btn hidden" type="submit">변경하기</button>
				</div>
			</div>
		</form>
	</div>
<script>
	const cpath = '${pageContext.request.contextPath}'
	
	const email = document.querySelector('.emailCheck')
	const emailCheckBtn = document.querySelector('.emailCheckBtn')	
	const changePassword = document.querySelector('.changePasswordInput')
	const emailCheckMsg = document.querySelector('.emailCheckMsg')
	const changePasswordInput = document.querySelector('.changePasswordInput')
	const changePasswordCheckInput = document.querySelector('.changePasswordCheckInput')
	const passwordMsg = document.querySelector('.passwordMsg')
	const passwordChcekMsg = document.querySelector('.passwordCheckMsg')
	const btn = document.querySelector('.btn')
	
	function checkEmail() {
		var reg_email = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/
		
		if(reg_email.test(email.value)) {
			emailCheckBtn.classList.add('on')
			emailCheckMsg.innerText="인증을 해주세요"
			emailCheckMsg.classList.add('red')
		}
		else {
			emailCheckMsg.innerText="이메일 형식을 확인해주세요"
			emailCheckMsg.classList.add('red')
		}
	}
	
	email.addEventListener('keyup', checkEmail)
	
	emailCheckBtn.onclick = function(event) {
		const url = cpath + '/findPassword/email/' + email.value + "/"
		const opt = {
			method: 'GET'
		}
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
			if(json.status == 1) {
				emailCheckMsg.innerText="인증되었습니다."
				emailCheckMsg.classList.remove('red')
				emailCheckMsg.classList.add('blue')
				changePasswordInput.classList.remove('hidden')
				changePasswordCheckInput.classList.remove('hidden')
			}
			else{
				emailCheckMsg.innerText="존재하지 않는 이메일 입니다."
				emailCheckMsg.classList.add('red')				
			}
		})
	}
	
	function checkPassword() {
		if(changePasswordInput.value.length >= 1 && changePasswordInput.value.length < 8) {
			passwordMsg.innerText="사용불가 : 8자리 이상 입력하세요."
			passwordMsg.classList.add('red')
		}
		else if(changePasswordInput.value.length == 8) {
			passwordMsg.innerText="사용가능"
			passwordMsg.classList.remove('red')
			passwordMsg.classList.add('blue')
		}
	}
	changePasswordInput.addEventListener('keyup', checkPassword)
	
	function checkPassword2() {
		if(changePasswordInput.value != changePasswordCheckInput.value) {
			passwordChcekMsg.innerText="비밀번호가 일치하지 않습니다."
			passwordChcekMsg.classList.add('red')
		}
		else if(changePasswordInput.value == changePasswordCheckInput.value){
			passwordChcekMsg.innerText="일치합니다."
			passwordChcekMsg.classList.remove('red')			
			passwordChcekMsg.classList.add('blue')
			btn.classList.remove('hidden')
		}
	}
	
	changePasswordCheckInput.addEventListener('keyup', checkPassword2)
	

</script>
</body>
</html>