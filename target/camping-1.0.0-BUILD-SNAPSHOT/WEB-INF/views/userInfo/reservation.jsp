<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now }" pattern="yyyy-MM-dd" var="today"/>
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
		<c:if test="${list.checkOut > today }">
		<ul>
			<li>예약자 ${name }</li>
			<li>방번호${list.itemRoomId }</li>
			<li>가격${list.orderprice }원</li>
			<li>체크인${list.checkIn }</li>
			<li>체크아웃${list.checkOut }</li>
			<li>예약날짜${list.orderDate }</li>
		</ul>
		</c:if>
</c:forEach>
	</div>
		<h3>이용 내역</h3>
	<div id="usageHistory">
		<c:forEach var="list" items="${list }" >
		<c:if test="${list.checkOut < today }">
		<a href="${cpath }/reservationDetail/${list.orderId}/${list.memberId}">
		<ul>
			<li>방번호${list.itemRoomId }</li>
			<li>가격${list.orderprice }원</li>
			<li>${list.checkIn } ~ ${list.checkOut }</li>
			<li><a href="">다시예약</a></li><!-- 예약페이지 -->
		</ul>
		</a>
		</c:if>
		</c:forEach>
		
	</div>
		<h3>취소 내역</h3>
	<div id="cancellationHistory"> 
		<c:forEach var="list" items="${list }" >
		<c:if test="${list.cancle == 0 }">
		<ul>
			<li>예약자 ${name }</li>
			<li>방번호${list.itemRoomId }</li>
			<li>가격${list.orderprice }원</li>
			<li>체크인${list.checkIn }</li>
			<li>체크아웃${list.checkOut }</li>
			<li>예약날짜${list.orderDate }</li>
		</ul>
		</c:if>
		</c:forEach>
	</div>
</div>

</div>
<script>
	const reservation = document.getElementById('reservation')
	const usageHistory = document.getElementById('usageHistory')
	const cancellationHistory = document.getElementById('cancellationHistory')
	
	
</script>


</body>
</html>