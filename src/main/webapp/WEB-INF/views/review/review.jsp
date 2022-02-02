<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${cpath }/resources/css/review/review.css">

<script src="${cpath }/resources/js/review/review.js">
	
</script>

<div class="contentbox">
		<form method="POST" id="review"  enctype="multipart/form-data">
			<span class="star"> ★★★★★ <span>★★★★★</span> 
			<input name="starPoint" type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
			</span>
			<p><input type="text" name="title" placeholder="제목" required autofocus></p>
			<p><input type="text" name="itemRoomId" ></p>
			<p><input type="text" name="memberId" value="${dto.name }" ></p>
			<p><input type="file" name="img"></p>
			<p><textarea style="resize: none; width: 400px; height: 400px;" placeholder="300자 이하로 작상해주세요"></textarea></p>
			<p><input type="submit" value="작성"></p>
		</form>
</div>


<script type="text/javascript">
const link = document.location.href
const orderId = link.split('/')
const form = document.getElementById('review')

form.action = cpath + '/review/' + orderId[5]
console.log(form)
</script>








</body>
</html>