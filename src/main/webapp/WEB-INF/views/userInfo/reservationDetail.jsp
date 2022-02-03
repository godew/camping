<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/userinfo/reservation.css">
<div class="contentAA">
<div class="leftmenu">
	<nav>
		<ul>
			<li><a href="${cpath }/point/${dto.memberID}">포인트</a></li>
			<li><a href="${cpath }/reservation/${dto.memberID}">예약 내역</a></li>
			<li><a href="${cpath }/userInfo/${dto.memberID}">내 정보 관리</a></li>
		</ul>
	</nav>
</div>
<div class="reservationContent">
<c:forEach var="list" items="${list }">

	<fmt:parseDate var="checkIn" value="${list.checkIn }" pattern="MMdd"/>
	<fmt:formatDate var="checkInDate" value="${checkIn }" pattern="MM월dd일"/>
	<fmt:parseDate var="checkOut" value="${list.checkOut }" pattern="MMdd"/>
	<fmt:formatDate var="checkOutDate" value="${checkOut }" pattern="MM월dd일"/>

	<div class="itemRoomImage"><img src="${list.itemRoomImage }"></div>
	<div>${list.itemRoomName }</div>
	<div>기준 인원 		: <b>${list.satandardPeople }</b></div>
	<div>최대 인원		: <b>${list.maxPeople }</b></div>
	<div>입실 날짜		: <b>${checkInDate }</b></div>
	<div>퇴실 날짜 		: <b>${checkOutDate }</b></div>
	<p>입실 및 퇴실 시간은 숙소에 문의 해주세요</p>
	<div>예약 번호 		: <b>${list.tid }</b></div>
	<div>결제 금액 		: <b class="price">${list.orderPrice }</b></div>
	<div><button id="review" value="${list.orderId }">리뷰작성</button></div>
</c:forEach>

</div>
</div>


<script>
	const review = document.getElementById('review')
		
	review.onclick = function(event){
		location.href = cpath + '/review/' + event.target.value
	}
	
		
</script>
</body>
</html>