<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now }" pattern="MMdd" var="today"/>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/userinfo/reservation.css">

<script>

	
</script>
<div class="content">
<div class="leftmenu">
	<nav>
		<ul>
			<li><a href="${cpath }/point/${dto.memberID}">포인트</a></li>
			<li><a href="${cpath }/reservation/${dto.memberID}">예약 내역</a></li>
			<li><a href="${cpath }/userInfo/${dto.memberID}">내 정보 관리</a></li>
		</ul>
	</nav>
</div>
<div class="mainContent">

		<h3>예약 내역</h3>
	<div id="reservation">
	<c:forEach var="list" items="${list }" >
		<fmt:parseDate var="checkIn" value="${list.checkIn }" pattern="MMdd"/>
		<fmt:formatDate var="checkInDate" value="${checkIn }" pattern="MM월dd일"/>
		<fmt:parseDate var="checkOut" value="${list.checkOut }" pattern="MMdd"/>
		<fmt:formatDate var="checkOutDate" value="${checkOut }" pattern="MM월dd일"/>
		<c:if test="${list.checkIn > today }">
		<c:if test="${list.cancel != 0}">
		<div class="reservationList">
			<img src="${list.itemRoomImage }" >
			<div class="reservationText">
				<div><strong>${list.itemRoomName }</strong></div>
				<span>${checkInDate } ~ ${checkOutDate }</span>
			</div>
			
			<c:if test="${list.cancel == 1 }">
			
			<form method="GET">
				<input type="text" class="orderPrice" name="orderPrice" value="${list.orderPrice }" hidden="">
				<input type="text" class="itemRoomName" name="itemRoomName" value="${list.itemRoomName }" hidden="">
				<button class="getPoint" value="${list.orderId }" type="button">
					포인트 받기
				</button>
			</form>			
			<form method="POST">
				<input type="number" name="orderId" value="${list.orderId }" hidden="">
				<input class="btn" type="submit" value="예약취소">
			</form>
			</c:if>
		</div>
		</c:if>
		</c:if>
	</c:forEach>
	</div>
		<h3>이용 내역</h3>
	<div id="usageHistory">
		<c:forEach var="list" items="${list }" >
		<fmt:parseDate var="checkIn" value="${list.checkIn }" pattern="MMdd"/>
		<fmt:formatDate var="checkInDate" value="${checkIn }" pattern="MM월dd일"/>
		<fmt:parseDate var="checkOut" value="${list.checkOut }" pattern="MMdd"/>
		<fmt:formatDate var="checkOutDate" value="${checkOut }" pattern="MM월dd일"/>
		<c:if test="${list.checkIn < today }">
		<c:if test="${list.cancel != 0}">
		<div class="usageHistoryList" >
		<a href="${cpath }/reservationDetail/${list.orderId}/${list.memberId}">
			<img src="${list.itemRoomImage }" >
			<div class="reservationText">
				<div><strong>${list.itemRoomName }</strong></div>
				<span>${checkInDate } ~ ${checkOutDate }</span>
				<div><a href="${cpath }/product/detail?itemId=${list.itemRoomId}&checkIn=${today}&checkOut=${today}">다시예약</a></div><!-- 예약페이지 -->
			</div>
		</a>
		</div>
		</c:if>
		</c:if>
		</c:forEach>
		
	</div> 
		<h3>취소 내역</h3>
	<div id="cancellationHistory"> 
		<c:forEach var="list" items="${list }" >
		<fmt:parseDate var="checkIn" value="${list.checkIn }" pattern="MMdd"/>
		<fmt:formatDate var="checkInDate" value="${checkIn }" pattern="MM월dd일"/>
		<fmt:parseDate var="checkOut" value="${list.checkOut }" pattern="MMdd"/>
		<fmt:formatDate var="checkOutDate" value="${checkOut }" pattern="MM월dd일"/>
		<c:if test="${list.cancel == 0 }">
		<div class="reservationList">
			<img src="${list.itemRoomImage }" >
			<div class="reservationText">
				<div><strong>${list.itemRoomName }</strong></div>
				<span>${checkInDate } ~ ${checkOutDate }</span>
			</div>
		</div>
		</c:if>
		</c:forEach>
	</div>
</div>

</div>
<script>

	const getPoint = document.querySelectorAll('.getPoint')
	
	const orderPrice = document.querySelectorAll('.orderPrice')
	const itemRoomName = document.querySelectorAll('.itemRoomName')
	for(let i in getPoint){
		getPoint[i].onclick = function(event) {
			const check = confirm('포인트를 받으면 예약취소를 못합니다. 포인트를 받으시겠습니까?')
			if(check == true){
				console.log(orderPrice[i].value)
				
			location.href = cpath + '/getPoint/' + event.target.value + '?orderPrice=' + orderPrice[i].value + '&itemRoomName='+ itemRoomName[i].value
			
			}
		}
		
		
				
	}
</script>


</body>
</html>