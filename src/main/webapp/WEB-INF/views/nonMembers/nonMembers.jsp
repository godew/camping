<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/userinfo/reservation.css">
<style>
	
</style>


<div class="content">
	<div class="reservationContent">
	<c:forEach var="list" items="${list }">
	<h2>비회원 예약내역 조회</h2>
	<c:if test="${list.cancel == 0 }">
	<h2 class="cancel">이미 취소된 방입니다</h2>
	</c:if>
	<fmt:parseDate var="checkIn" value="${list.checkIn }" pattern="MMdd"/>
	<fmt:formatDate var="checkInDate" value="${checkIn }" pattern="MM월dd일"/>
	<fmt:parseDate var="checkOut" value="${list.checkOut }" pattern="MMdd"/>
	<fmt:formatDate var="checkOutDate" value="${checkOut }" pattern="MM월dd일"/>
	<div class="itemRoomImage"><img src="${list.itemRoomImage }"></div>
	<div>
		방 이름 : ${list.itemRoomName }
	</div>
	<div>
		예약자 : ${list.notName }
	</div>
	<div>
		전화번호 : ${list.notPhone }
	</div>
	<div id="checkIn">
		체크인 : ${checkInDate }
	</div>
	<div id="checkOut">
		체크아웃 : ${checkOutDate }
	</div>
	
	<div>
		예약가격 : ${list.orderPrice }
	</div>
	<div>
		기준 인원 : ${list.standardPeople }
	</div>
	<div>
		최대 인원 : ${list.maxPeople }
	</div>
	<c:if test="${list.cancel != 0 }">
	<form method="POST">
		<input type="number" name="orderId" value="${list.orderId }" hidden="">
		<input class="btn" type="submit" value="예약취소">
	</form>
	</c:if>
	</c:forEach>
	</div>
</div>

<script>
	const btn = document.querySelector('.btn')
	
	btn.onclick = function(event){
// 		event.preventDefault()
	const check = confirm('예약취소하시겠습니까?')
	if(check == true){
		btn.onsubmit
		
	}
	}
</script>

</body>
</html>