<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
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
	<div class="rooms-info hidden">
	</div>
	<div class="rooms-review hidden">
	</div>
</div>
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
<script>
	const reserveBtn = document.querySelector('.reserve')
	const infoBtn = document.querySelector('.info')
	const reviewBtn = document.querySelector('.review')
	const roomReserveBtns = document.querySelectorAll('.roomReserveBtn')
	const lefts = document.querySelectorAll('#detail > .rooms-reserve > .top > .left')
	const bottoms = document.querySelectorAll('#detail > .rooms-reserve > .bottom')
	const cancels = document.querySelectorAll('.cancel')
	const images = document.querySelectorAll('.image')

	reserveBtn.onclick = function() {
		reserveBtn.classList.add('on')
		infoBtn.classList.remove('on')
		reviewBtn.classList.remove('on')
	}
	infoBtn.onclick = function() {
		reserveBtn.classList.remove('on')
		infoBtn.classList.add('on')
		reviewBtn.classList.remove('on')
	}
	reviewBtn.onclick = function() {
		reserveBtn.classList.remove('on')
		infoBtn.classList.remove('on')
		reviewBtn.classList.add('on')
	}
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