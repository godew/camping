<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/filtercss/filterStyle.css">

<div class="mainBack">
	<div class="mainSearch">
		<div class="filterCalendar calendarHidden">
		<div class="calendarDay">
			<button class="calendarPrev"></button>
			<div class="calendarYear"></div>
			<button class="calendarNext"></button>
		</div>
		</div>
		<div class="detailSearch">
			<div>지역</div>
			<div>인원</div>
		</div>
	</div>
	<div class="mainBackImg">
		<img src="${cpath }/resources/img/mainBack.png">
	</div>
</div>
<div class="mainMid">
	<div class="mainMidBox">
	</div>
</div>
<div class="footer">
</div>
<div class="footerText">
	<div>
		<img src="${cpath }/resources/img/logo.png">
	</div>
</div>
<div class="TextAll">
	<div class="footerTextAll">
		<div class="footerName">
			<ul>
				<li><a href="">김유성</a></li>
				<li><a href="">신은욱</a></li>
				<li><a href="">조경민</a></li>
				<li><a href="">윤다영</a></li>
				<li><a href="">박진영</a></li>
			</ul>
		</div>
	</div>
</div>
<div class="footerEnd">
	<div class="footerEnd2">
		Copyrightⓒ 2022.AfterCamping.Allright reserved.
	</div>
</div>
<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
<script src="${cpath }/resources/js/function4.js"></script>
</body>
</html>