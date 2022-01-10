<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${cpath }/resources/css/payment/style.css" rel="stylesheet">
</head>
<body>
<form method="POST">
	<div>예약자 이름</div>
	<div><input type="text" name="name" value="${login.name }" placeholder="체크인시 필요한 정보입니다." required></div>
	<div>이메일</div>
	<div class="sendMailForm">
		<input type="email" name="email" value="${login.email }" placeholder="체크인시 필요한 정보입니다." required>
		<input class="sendBtn" type="button" value="인증번호 전송">
		<div class="sendMailMsg"></div>
	</div>
	
	<div class="authMailForm hidden">
		<div>인증 번호 입력</div>
		<div>
			<input type="text" name="auth" placeholder="인증번호를 입력하세요">
			<input class="authBtn" type="button" value="인증">
		</div>
		<div class="authMailMsg"></div>
		<div class="timer"></div>
	</div>
	<c:if test="${empty login }">
		<h3>할인수단 선택</h3>
		<h4>70000</h4>
		<input type="text">
	</c:if>
	
	<h3>결제수단 선택</h3>
	<select name="payMethod">
		<option value="kakaopay">카카오페이</option>
	</select>
	<div><label><input type="checkbox" >전체 동의</label></div>
	<div><label><input type="checkbox" >숙소이용규칙 및 취소/환불규정 동의 (필수)</label></div>
	<div><label><input type="checkbox" >개인정보 수집 및 이용 동의 (필수)</label></div>
	<div><label><input type="checkbox" >개인정보 제 3자 제공 동의 (필수)</label></div>
	<div><label><input type="checkbox" >만 14세 이상 확인 (선택)</label></div>
</form>

<button class="pay">pay</button>
<button class="cancel">cancel</button>
<script src="${cpath }/resources/js/payment/pay.js"></script>
<script>
	const cpath = '${cpath }'
	const payBtn = document.querySelector('.pay')
	const cancelBtn = document.querySelector('.cancel')
	const form = document.forms[0]
	const sendBtn = document.querySelector('.sendBtn')
	const sendMailMsg = document.querySelector('.sendMailMsg')
	const authBtn = document.querySelector('.authBtn')
	const authMailForm = document.querySelector('.authMailForm')
	const authMailMsg = document.querySelector('.authMailMsg')
	const timer = document.querySelector('.timer')
	
	let second
	let interval
	
	payBtn.onclick = payReady
	cancelBtn.onclick = payCancel
	sendBtn.onclick = sendMailHandler
	authBtn.onclick = authMailHandler

</script>
</body>
</html>