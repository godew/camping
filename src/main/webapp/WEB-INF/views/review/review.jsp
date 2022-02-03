<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${cpath }/resources/css/review/review.css">

<script src="${cpath }/resources/js/review/review.js">
	
</script>

<div class="contentbox">
		<form method="POST" id="review">
			<span class="star"> ★★★★★ <span>★★★★★</span> 
			<input name="starPoint" type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10" required>
			</span>
			<p><input type="text" name="title" placeholder="제목" required autofocus></p>
			<c:forEach var="list" items="${list }">
				<p><input type="text" name="itemId" value="${list.itemId }" hidden="" required></p>
				<p><input type="text" name="itemRoomId" value="${list.itemRoomId }" hidden="" required></p>
			</c:forEach>
			<p><input type="text" name="memberId" value="${dto.memberID }" hidden="" required></p>
			<p><textarea name="content" style="resize: none; width: 400px; height: 400px;" placeholder="300자 이하로 작상해주세요"></textarea></p>
			<p><input type="submit" value="작성"></p>
		</form>
</div>

<script type="text/javascript">
const link = document.location.href
const orderId = link.split('/')
const form = document.getElementById('review')

</script>








</body>
</html>