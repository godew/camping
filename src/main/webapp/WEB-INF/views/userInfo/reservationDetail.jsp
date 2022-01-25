<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/userinfo/reservation.css">
<div class="content">
<div class="leftmenu">
	<nav>
		<ul>
			<li><a href="${cpath }/point">포인트</a></li>
			<li><a href="${cpath }/reservation">예약 내역</a></li>
			<li><a href="${cpath }/userInfo">내 정보 관리</a></li>
		</ul>
	</nav>
</div>
<div class="mainContent">
<c:forEach var="list" items="${list }">
	<div class="orderId" style="display: none;">${list.orderId }</div>
	<div>예약자 		: ${name }</div>
	<div>itemRoomId : ${list.itemRoomId }</div>
	<div>checkIn	: ${list.checkIn }</div>
	<div>checkOut 	: ${list.checkOut }</div>
	<div>tid 		: ${list.tid }</div>
	<div>orderPrice	: ${list.orderPrice }</div>
	
	<button id="deleteBTN">삭제</button>
</c:forEach>

</div>
</div>


<script>
	const deleteBTN = document.getElementById('deleteBTN')
	const orderId = document.querySelector('.orderId').innerText
	console.log(orderId)
	deleteBTN.onclick = function(event) {
		location.href = cpath + '/reservationDelete/' + orderId
	}
		
		
</script>
</body>
</html>