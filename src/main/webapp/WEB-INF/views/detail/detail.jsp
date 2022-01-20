<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="filterMap.jsp" %>
<div id="detail">
	<div class="item">
		<div class="left">
			<img src="${item.itemImage }">		
		</div>
		<div class="right">
			<h2>${item.itemName}</h2>
			<div>${item.address}</div>
			<div>${item.locale}</div>
		</div>
	</div>
	<div class="tab">
		<button class="reserve on">
			<span>객실안내/예약</span>
		</button>
		<button class="info">
			<span>숙소정보</span>
		</button>
		<button class="review">
			<span>리뷰</span>
		</button>
	</div>
	<div class="rooms-reserves">
	<c:forEach var="room" items="${rooms }">
		<div class="rooms-reserve">
			<div class="top">
				<div data-idx=${room.itemRoomId } class="left">
					<img src="https://image.goodchoice.kr/images/web_v3/ico_picview.png">
					<img src="${room.itemRoomImage }">
				</div>
				<div class="right">
					<h2>${room.itemRoomName }</h2>
					<div class="price">
						<div>가격</div>
						<div><fmt:formatNumber value="${room.itemRoomPrice }" pattern="#,###" />원</div>
					</div>
					<button data-idx=${room.itemRoomId } class="roomInfoBtn">객실 이용 안내</button>
					<button data-idx=${room.itemRoomId } class="roomReserveBtn">예약</button>
				</div>
			</div>
			<div class="bottom hidden">
				<button class="cancel"></button>
				<div class="image"></div>
			</div>
		</div>
	</c:forEach>
	</div>
	<div class="rooms-info hidden">
		<div class="standardDiv">
			<div class="flex">
				<div>기본 정보</div>
				<button class="standardBtn"></button>
			</div>
			<div class="standard hidden">
				<h3>기본 정보</h3>
				<ul>
					<li>입실 : 15:00 | 퇴실 : 11:00</li>
					<li>20시 이후 입실불가 (사전문의 필수)</li>
					<li>22시 이후 에티켓타임 (타인들에게 피해를 줄 경우 1차 주의 / 2차 경고 / 3차 환불없이 강제퇴실)</li>
					<li style="color: red;">전 객실 금연 (지정된 흡연구영 이용 / 객실내 흡연 적발 시 환불없이 강제퇴실 및 1박요금 추가청구)</li>
				</ul>
				<h3>인원 추가 정보</h3>
				<ul>
					<li>기준인원 초과 시 1인 20,000원 (12개월 이상), 30,000원 (성인)</li>
					<li>영유아 인원수 포함 / 최대인원 초과불가</li>
					<li style="color: red;">최대인원 무단 초과 시 환불없이 퇴실조치</li>
				</ul>
				<h3>취소 및 환불 규정</h3>
				<ul>
					<li><b>[기본 수수료]</b></li>
					<li>숙박일 기준 10일전 : 100% 환불</li>
					<li>숙박일 기준 9~8일전 : 90% 환불</li>
					<li>숙박일 기준 7~6일전 : 80% 환불</li>
					<li>숙박일 기준 5일전 : 50% 환불</li>
					<li>숙박일 기준 4일전~당일 및 No-show : 환불불가</li>
					<li>취소, 환불 시 수수료가 발생할 수 있습니다</li>
					<li><b>[성수기]</b></li>
					<li>숙박일 기준 10일 전: 100% 환불</li>
					<li>숙박일 기준 9~7일 전: 80% 환불</li>
					<li>숙박일 기준 6~5일 전: 60% 환불</li>
					<li>숙박일 기준 4~3일 전: 40% 환불</li>
					<li>숙박일 기준 2~당일 및 No-show : 환불불가</li>
					<li>취소, 환불 시 수수료가 발생할 수 있습니다</li>
					<li style="color: red;">예약확정 후 객실/날짜 변경 : 결제 시 동의한 취소환불정책에 따라 취소수수료 부과 (당일예약 후 취소 포함 / 신중한 예약 필수)</li>
				</ul>
			</div>
		</div>
		<div class="serviceDiv">
			<div class="flex">
				<div>편의시설 및 서비스</div>
				<button class="serviceBtn"></button>
			</div>
			<div class="service hidden">
				<c:forEach var="tmp" items="${item.filter.split(' ')}">
					<div class="list">
						<img src="${filterMap.get(tmp)}">
						<div class="text">${tmp }</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- review -->
	<div class="rooms-review hidden">
	</div>
</div>

<!-- modal -->
<div class="detail-modal hidden">
	<div class="content">
		<div class="title">
			<div>객실 이용 안내</div>
			<button class="cancel"></button>
		</div>
		<div class="info">
			<strong>기본정보</strong>
			<ul>
				<li class="people"></li>
			</ul>
		</div>
		<div class="facilities">
			<strong>편의시설</strong>
			<ul>
				<li class="filter">${item.filter.substring(0, item.filter.length()-1).replace(" ", ", ") }</li>
			</ul>
		</div>
	</div>
</div>
<script src="${cpath }/resources/js/detail/function.js"></script>
<script src="${cpath }/resources/js/detail/rooms-info.js"></script>
<script>
	const reserveBtn = document.querySelector('.reserve')
	const infoBtn = document.querySelector('.info')
	const reviewBtn = document.querySelector('.review')
	const roomReserveBtns = document.querySelectorAll('.roomReserveBtn')
	const lefts = document.querySelectorAll('#detail .rooms-reserve > .top > .left')
	const bottoms = document.querySelectorAll('#detail .rooms-reserve > .bottom')
	const cancels = document.querySelectorAll('.cancel')
	const images = document.querySelectorAll('.image')
	
	reserveBtn.onclick = reserveBtnHandler
	infoBtn.onclick = infoBtnHandler
	reviewBtn.onclick = reviewBtnHandler
	
	roomReserveBtns.forEach(btn => {
		btn.onclick = function() {
			location.href = cpath + '/payment/' + btn.dataset.idx
		}
	})
	
	for (let i = 0; i < lefts.length; i++) {
		cancels[i].onclick = function() {
			bottoms[i].classList.add('hidden')
		}
		lefts[i].onclick = function() {
			if (bottoms[i].classList.contains('hidden')) {
				bottoms[i].classList.remove('hidden')
				const url = cpath + '/product/detail/images?itemRoomId=' + lefts[i].dataset.idx
				const opt = {
					method : 'GET'
				}
				fetch(url, opt)
					.then(resp => resp.json())
					.then(json => {
						images[i].innerHTML = getDom(json)
						
						const prev = images[i].children[images[i].children.length - 3]
						const next = images[i].children[images[i].children.length - 2]
						
						prev.onclick = prevHandler
						next.onclick = nextHandler

					})
			} else {
				bottoms[i].classList.add('hidden')
			}
		}
	}
	
</script>
<script src="${cpath }/resources/js/detail/modal.js"></script>
</body>
</html>