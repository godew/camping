<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/userinfo/userinfo.css">
<style>
	
</style>


<div class="content">
	<div>
	<h2>비회원 예약내역 조회</h2>
	<c:forEach var="list" items="${list }">
	<img src="${list.itemRoomImage }">
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
		체크인 : ${list.checkIn }
	</div>
	<div id="checkOut">
		체크아웃 : ${list.checkOut }
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
	<button value="${list.tid }">예약취소</button>
	</c:forEach>
	</div>
</div>

<script>
	const checkIn = document.getElementById('checkIn').innerText
	const checkOut = document.getElementById('checkOut').innerText
// 	checkInDate = checkIn.substring(0,2) + '월' + checkIn.subString(2,4) + '일'
// 	checkOutDate = checkOut.substring(0,2) + '월' + checkOut.subString(2,4) + '일'
	
	console.log(checkIn.substring(0, -4))
</script>

</body>
</html>