<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${cpath }/resources/css/review/review.css">
<div class="contentbox">





	<div>
		<form>
			<span class="star"> ★★★★★ <span>★★★★★</span> 
			<input type="range" oninput="drawStar(this)" value="1" step="1" min="0" max="10">
			</span>
			<p><input type="text" name="title"></p>
			<p><input type="text" name="itemName"></p>
			<p><input type="text" name="userName"></p>
			<p><input type="file" name="img"></p>
			<p><textarea style="resize: none;"></textarea></p>
			<p><input type="submit"></p>
		</form>
	</div>
</div>




<script src="${cpath }/resources/js/review/review.js">
	
</script>







</body>
</html>