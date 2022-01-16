<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<c:set var="point" value="300000" />
<c:set var="checkIn" value="01.12 수 15:00" />
<c:set var="checkOut" value="01.13 목 11:00" />
<form method="POST">
	<div class="pay_main">
		<div class="pay_left">
			<div class="book_info">
				<h3>예약자 정보</h3>
				<div><strong>예약자 이름</strong></div>
				<div><input class="input_text" type="text" name="name" value="${login.name }" placeholder="체크인시 필요한 정보입니다."></div>
				
				<div><strong>휴대폰 번호</strong></div>
				<c:if test="${not empty login }">
					<div class="sendForm">
						<input class="input_text" type="text" name="phone" value="${login.phone }" placeholder="체크인시 필요한 정보입니다." autocomplete="off">
					</div>
				</c:if>
				<c:if test="${empty login }">
					<div class="sendForm">
						<input class="empty_login_text" type="text" name="phone" placeholder="체크인시 필요한 정보입니다." autocomplete="off">
						<button class="sendBtn" disabled>인증번호 전송</button>
					</div>
					<div class="phoneMsg"></div>
					<div class="sendMsg"></div>
				</c:if>
				
				<div class="authForm hidden">
					<div class="authForm2">
						<input class="empty_login_text" type="text" name="auth" placeholder="인증번호를 입력하세요">
						<input type="hidden" name="authcheck" required>
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
						<div class="price"><fmt:formatNumber value="${itemRoomPrice }" pattern="#,###" />원</div>
					</div>
					<div class="point">
						<button class="pointBtn">포인트 사용 ${point }P</button>
						<div>
							<input type="text" name="point" placeholder="0"><b>P</b>
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
		</div>
		<div class="pay_right">
			<div class="room_info">
				<div>
					<div><strong>숙소이름</strong></div>
					<div class="info_text">${itemName }</div>
				</div>
				<div>
					<div><strong>객실타입</strong></div>
					<div class="info_text">${itemRoomName }</div>
				</div>
				<div>
					<div><strong>체크인</strong></div>
					<div class="info_text">${checkIn }</div>
				</div>
				<div>
					<div><strong>체크아웃</strong></div>
					<div class="info_text">${checkOut }</div>
				</div>
			</div>
			<div class="total_price">
				<div><b>총 결제 금액</b>(VAT포함)</div>
				<div class="price"><fmt:formatNumber value="${itemRoomPrice }" pattern="#,###" />원</div>
				<ul>
					<li>해당 객실가는 세금, 봉사료가 포함된 금액입니다</li>
					<li>결제완료 후 <span>예약자 이름</span>으로 바로 <span>체크인</span> 하시면 됩니다</li>
				</ul>
			</div>
			<button class="pay">결제하기</button>
		</div>
	</div>
</form>

<!-- modal -->
<div class="pay-modal hidden">
    <div class="pay-modal-content">
        <div class="text">
        	
        </div>
        <div class="">
        	<button class="modal-cancel-btn">확인</button>
        </div>
    </div>
</div>

<div class="pay-info-modal hidden">
    <div class="pay-info-modal-content">
		<strong>예약내역 확인</strong>
		<div class="info">
			<div class="top">
				<div>${itemName }</div>
				<div style="margin-bottom: 20px">${itemRoomName }</div>
				<div class="check">
					<div class="color">체크인</div>
					<b>01.14</b>
				</div>
				<div class="check">
					<div class="color">체크 아웃</div>
					<b>01.15</b>
				</div>
			</div>
			<ul>
				<li>미성년자는 보호자 동반 시 투숙이 가능합니다.</li>
				<li><span>취소 및 환불 규정</span>에 따라 취소수수료 부과 및 취소불가 될 수 있습니다.</li>
			</ul>
		</div>
		<div class="btn">
			<button>취소</button>
			<button class="payReadyBtn">동의 후 결제</button>
		</div>
    </div>
</div>
<script>
	const pointVal = +'${point}'
	const priceVal = +'${itemRoomPrice }'
	
	// parameter
	const memberId = 1
	const itemRoomId = '${itemRoomId}'
	const itemName = '${itemName }'
	const checkIn = '${checkIn}'
	const checkOut = '${checkOut}'
	
	let kakaoWindow
</script>
<script src="${cpath }/resources/js/payment/function.js"></script>
<script src="${cpath }/resources/js/payment/pay.js"></script>
<script src="${cpath }/resources/js/payment/modal.js"></script>
<script src="${cpath }/resources/js/payment/agree.js"></script>
</body>
</html>
