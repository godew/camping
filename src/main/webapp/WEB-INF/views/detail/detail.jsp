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
	<c:forEach var="room" items="${rooms }" varStatus="status">
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
					<c:if test="${calendar.get(status.index) eq 0}">
						<button data-idx=${room.itemRoomId } class="roomReserveBtn soldOut" disabled="disabled">판매완료</button>
					</c:if>
					<c:if test="${calendar.get(status.index) eq 1}">
						<button data-idx=${room.itemRoomId } class="roomReserveBtn">예약</button>
					</c:if>
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
		<div class="startext"></div>		
		<div id="starRatingTotal">
			<img class="starTotalImg" src="https://image.goodchoice.kr/images/web_v3/bg_score.png">
		
		</div>
		<c:forEach var="review" items="${review}">
		<div class="reviewContent">
			<strong class="title">${review.title }</strong>
			<div id="star_rating">
				<div class="starPoint">
					<img class="starImg" src="https://image.goodchoice.kr/images/web_v3/bg_score.png">
					${review.starPoint }
				</div>
			</div>
			<span>
				<div class="memberId">${review.memberId }</div>
				<div class="itemRoomId">${review.itemRoomId }</div>
			</span>
				<div class="content">${review.content }</div>
			<ul class="img">
				<li><img src="${review.img }"></li>
			</ul>
		</div>
		</c:forEach>
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
	const starPoint = document.querySelectorAll('.starPoint')//별점
	const starImg = document.querySelectorAll('.starImg')	
	const starRatingTotal = document.getElementById('starRatingTotal')
	const starTotalImg = document.querySelector('.starTotalImg')
	const startext = document.querySelector('.startext')
	
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
			location.href = cpath + '/payment/' + btn.dataset.idx + '?checkIn=${param.checkIn}&checkOut=${param.checkOut}'
		}
	})
	let star = 1
	let starTotal = 0
	for(let i = 0; i < starPoint.length; i++){
		star = parseInt(starPoint[i].innerText)
		starTotal += star
		
		switch (star) {
		case 1:
			starImg[i].style.marginTop = '-165px'
			break;
		case 2:
			starImg[i].style.marginTop = '-147px'
			break;
		case 3:
			starImg[i].style.marginTop = '-129px'
			break;
		case 4:
			starImg[i].style.marginTop = '-110px'
			break;
		case 5:
			starImg[i].style.marginTop = '-91px'
			break;
		case 6:
			starImg[i].style.marginTop = '-74px'
			break;
		case 7:
			starImg[i].style.marginTop = '-56px'
			break;
		case 8:
			starImg[i].style.marginTop = '-39px'
			break;
		case 9:
			starImg[i].style.marginTop = '-19px'
			break;
		default:
			break;
		}
	}
	const starAVG =  parseInt(starTotal / starPoint.length)
	switch (starAVG) {
	case 1:
		console.log(1)
		starTotalImg.style.marginTop = '-450px'
		startext.innerText = '실망이야 (' + starAVG + ')'
		break;
	case 2:
		console.log(2)
		starTotalImg.style.marginTop ='-400px'
		starTotalImg.style.width ='250px'
		startext.innerText = '실망이야 (' + starAVG + ')'
		break;
	case 3:
		console.log(3)
		starTotalImg.style.marginTop ='-350px'
		starTotalImg.style.width ='250px'
		startext.innerText = '별로 (' + starAVG + ')'
		break;
	case 4:
		console.log(4)
		starTotalImg.style.marginTop ='-300px'
		starTotalImg.style.width ='250px'
		startext.innerText = '별로 (' + starAVG + ')'
		break;
	case 5:
		console.log(5)
		starTotalImg.style.marginTop ='-250px'
		starTotalImg.style.width ='250px'
		startext.innerText = '좋은거같아요 (' + starAVG + ')'
		break;
	case 6:
		console.log(6)
		starTotalImg.style.marginTop ='-200px'
		starTotalImg.style.width ='250px'
		startext.innerText = '괜찮아요 (' + starAVG + ')'
		break;
	case 7:
		console.log(7)
		starTotalImg.style.marginTop ='-150px'
		starTotalImg.style.width ='250px'
		startext.innerText = '추천해요 (' + starAVG + ')'
		break;
	case 8:
		console.log(8)
		starTotalImg.style.marginTop ='-100px'
		starTotalImg.style.width ='250px'
		startext.innerText = '만족해요 (' + starAVG + ')'
		break;
	case 9:
		console.log(9)
		starTotalImg.style.marginTop ='-50px'
		starTotalImg.style.width ='250px'
		startext.innerText = '만족해요 (' + starAVG + ')'
		break;
		break;
	case 10:
		console.log(10)
		starTotalImg.style.marginTop ='0'
		starTotalImg.style.width ='250px'
		startext.innerText = '최고야 (' + starAVG + ')'
		break;
	default:
		starTotalImg.style.marginTop ='100%'
		startext.innerText = '리뷰가 없어요ㅠㅠ'
		startext.style.fontWeight  = 'bolder'
		break;
	}
	
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