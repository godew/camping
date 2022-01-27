<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<style>
	
</style>


<div class="content">
	<h1>비회원</h1>
	<div>
	<c:forEach var="list" items="${list }">
	<img src="${list.itemRoomImage }">
		${list.itemRoomName }
		${list.orderPrice }
		${list.standardPeople }
		${list.maxPeople }
	</c:forEach>
	</div>
</div>



</body>
</html>