<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<table>
	<tr>
		<td>${item.itemName}</td>
		<td>${item.address}</td>
		<td><img src="${item.itemImage }"></td>
	</tr>
<c:forEach var="room" items="${rooms }">
	<tr>
		<td>${room.itemRoomId }</td>
		<td>${room.itemId }</td>
		<td>${room.itemRoomName }</td>
		<td><img src="${room.itemRoomImage }"></td>
		<td>${room.itemRoomPrice }</td>
		<td>${room.standardPeople }</td>
		<td>${room.maxPeople }</td>
	</tr>
</c:forEach>
</table>
</body>
</html>