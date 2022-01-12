<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="pay_main">
	<div class="pay_left">
		<form method="POST">
			<div class="book_info">
				<h3>예약자 정보</h3>
				<div><strong>예약자 이름</strong></div>
				<div><input class="input_text" type="text" name="name" value="${login.name }" placeholder="체크인시 필요한 정보입니다." required></div>
				
				<div><strong>휴대폰 번호</strong></div>
				<c:if test="${not empty login }">
					<div class="sendForm">
						<input class="input_text" type="text" name="phone" value="${login.phone }" placeholder="체크인시 필요한 정보입니다." required autocomplete="off">
					</div>
				</c:if>
				<c:if test="${empty login }">
					<div class="sendForm">
						<input class="empty_login_text" type="text" name="phone" placeholder="체크인시 필요한 정보입니다." required autocomplete="off">
						<button class="sendBtn">인증번호 전송</button>
					</div>
					<div class="sendMsg"></div>
				</c:if>
				
				<div class="authForm hidden">
					<div class="authForm2">
						<input class="empty_login_text" type="text" name="auth" placeholder="인증번호를 입력하세요">
						<button class="authBtn">인증</button>
					</div>
					<div class="timer"></div>
					<div class="authMsg"></div>
				</div>
			</div>
			
			<c:if test="${empty login }">
				<div class="discount">
					<h3>할인 수단 선택</h3>
					<div class="total">
						<div><strong>구매총액</strong></div>
						<div class="price">40,000원</div>
					</div>
					<div class="point">
						<button class="pointBtn">포인트 사용 0P</button>
						<div>
							<input type="text" name="point"><b>P</b>
						</div>
					</div>
				</div>
			</c:if>
			
			<div class="method">
				<h3>결제수단 선택</h3>
				<select name="payMethod">
					<option value="kakaopay">카카오페이</option>
					<option value="toss">토스</option>
				</select>
			</div>
			<div class="agree">
				<div><label><input type="checkbox" name="agree">전체 동의</label></div>
				<div><label><input type="checkbox" name="agree">숙소이용규칙 및 취소/환불규정 동의</label><span>&nbsp(필수)</span></div>
				<div><label><input type="checkbox" name="agree">개인정보 수집 및 이용 동의</label><span>&nbsp(필수)</span></div>
				<div><label><input type="checkbox" name="agree">개인정보 제 3자 제공 동의</label><span>&nbsp(필수)</span></div>
				<div><label><input type="checkbox" name="agree">만 14세 이상 확인</label><span>&nbsp(필수)</span></div>
			</div>
		</form>
	</div>
	<div class="pay_right">
		<div class="room_info">
			<div>
				<div><strong>숙소이름</strong></div>
				<div class="info_text">포천 파인트리글램핑&풀빌라</div>
			</div>
			<div>
				<div><strong>객실타입/기간</strong></div>
				<div class="info_text">프라이빗 카라반 / 1박</div>
			</div>
			<div>
				<div><strong>체크인</strong></div>
				<div class="info_text">01.12 수 15:00</div>
			</div>
			<div>
				<div><strong>체크아웃</strong></div>
				<div class="info_text">01.13 목 11:00</div>
			</div>
		</div>
		<div class="total_price">
			<div><b>총 결제 금액</b>(VAT포함)</div>
			<div class="price">99,000원</div>
			<ul>
				<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
				<li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span> 하시면 됩니다</li>
			</ul>
		</div>
	</div>
</div>
<button class="pay">pay</button>
<!-- <button class="cancel">cancel</button> test-->
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
<script>
	const agrees = form.agree
	agrees[0].onchange = function() {
		if (this.checked) {
			agrees.forEach(e => e.checked = true)			
		} else {
			agrees.forEach(e => e.checked = false)
		}
	}
	for (let i = 1; i < agrees.length; i++) {
		agrees[i].onchange = function() {
			if (this.checked) {
				if (agrees[1].checked && agrees[2].checked && agrees[3].checked && agrees[4].checked) {
					agrees[0].checked = true
				}
			} else {
				if (agrees[0].checked) {
					agrees[0].checked = false
				}
			}
		}
	}
</script>
</body>
</html>
