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
			<div class="left">
				<img src="https://image.goodchoice.kr/images/web_v3/ico_picview.png">
				<img src="${room.itemRoomImage }">
			</div>
			<div class="right">
				<h2>${room.itemRoomName }</h2>
				<div>${room.itemRoomPrice }</div>
				<div>객실 이용 안내</div>
				<button>예약</button>
			</div>
		</div>
	</c:forEach>
	<div class="rooms-info hidden">
	</div>
	<div class="rooms-review hidden">
	</div>
</div>
<script>
	const reserveBtn = document.querySelector('.reserve')
	const infoBtn = document.querySelector('.info')
	const reviewBtn = document.querySelector('.review')
	
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
	
</script>
<%-- 		<td>${room.itemRoomId }</td> --%>
<%-- 		<td>${room.itemId }</td> --%>
<%-- 		<td>${room.standardPeople }</td> --%>
<%-- 		<td>${room.maxPeople }</td> --%>
</body>
</html>