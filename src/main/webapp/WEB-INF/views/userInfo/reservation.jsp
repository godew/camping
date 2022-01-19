<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath">${pageContext.request.contextPath }</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
const cpath = '${cpath}'

function reservationHistory(event) {
	const url = 'http://localhost:8080/camping/reservationHistory/1'
	const opt = {
		method: 'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json)
	})
}
</script>
<div>
	<div id="reservation">
		<h3>예약 내역</h3>
		<ul>
			
		</ul>
	</div>

	<div id="usageHistory">
		<h3>이용 내역</h3>
		<ul>
			
		</ul>
	</div>
	
	<div id="cancellationHistory">
		<h3>취소 내역</h3>
		<ul>
			
		</ul>
	</div>

</div>
<script>
	const reservation = document.getElementById('reservation')
	const usageHistory = document.getElementById('usageHistory')
	const cancellationHistory = document.getElementById('cancellationHistory')
	
	
	window.onload = reservationHistory
</script>


</body>
</html>