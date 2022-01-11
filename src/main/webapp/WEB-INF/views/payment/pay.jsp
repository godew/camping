<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="pay_main">
	<div class="pay_left">
		<form method="POST">
			<h3>예약자 정보</h3>
			<div><strong>예약자 이름</strong></div>
			<div><input type="text" name="name" value="${login.name }" placeholder="체크인시 필요한 정보입니다." required></div>
			<div><strong>휴대폰 번호</strong></div>
			
			<div class="sendForm">
				<input type="text" name="phone" value="${login.phone }" placeholder="체크인시 필요한 정보입니다." required autocomplete="off">
				<input class="sendBtn" type="button" value="인증번호 전송">
				<div class="sendMsg">휴대폰 번호를 확인해 주세요</div>
			</div>
			
			<div class="authForm hidden">
				<div>인증 번호 입력</div>
				<div>
					<input type="text" name="auth" placeholder="인증번호를 입력하세요">
					<input class="authBtn" type="button" value="인증">
				</div>
				<div class="authMsg"></div>
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
	</div>
	<div class="pay_right">
	</div>
</div>
<button class="pay">pay</button>
<button class="cancel">cancel</button>
<script src="${cpath }/resources/js/payment/pay.js"></script>
<script>
	const payBtn = document.querySelector('.pay')
	const cancelBtn = document.querySelector('.cancel')
	
	const form = document.forms[0]
	const sendBtn = document.querySelector('.sendBtn')
	const sendMsg = document.querySelector('.sendMsg')
	const authBtn = document.querySelector('.authBtn')
	const authForm = document.querySelector('.authForm')
	const authMsg = document.querySelector('.authMsg')
	const timer = document.querySelector('.timer')
	
	let second
	let interval
	
	payBtn.onclick = payReady
	cancelBtn.onclick = payCancel
	sendBtn.onclick = sendHandler
	authBtn.onclick = authHandler
</script>
</body>
</html>