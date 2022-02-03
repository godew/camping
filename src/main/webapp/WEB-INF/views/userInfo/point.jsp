<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/userinfo/userinfo.css">
<script>
function getpoint(event) {
	const memberId = document.querySelector('.memberId').innerText
	url = cpath + '/getpoint/' + memberId
	opt = {
		method:'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
			let result = 0
		json.forEach(point => {
			const member = point.memberId
			console.log(member)
			let li = document.createElement('li')
			let span = document.createElement('span')
			let p = document.createElement('p')
			result += point.point
			
			li.innerText = point.title 
			span.innerText = point.pointDate
			p.innerText = point.point
			
			li.appendChild(span)
			li.appendChild(p)
			pointList.appendChild(li)
			console.log(point.point)
		})
			available_points.innerText = result
		
	})
	
}
</script>

<div class="content">
<div class="memberId hidden">
${dto.memberID }
</div>
<div class="leftmenu">
	<nav>
		<ul>
			<li><a href="${cpath }/point/${dto.memberID}">포인트</a></li>
			<li><a href="${cpath }/reservation/${dto.memberID}">예약 내역</a></li>
			<li><a href="${cpath }/userInfo/${dto.memberID}">내 정보 관리</a></li>
		</ul>
		
	</nav>
</div>
<div class="point">
	<h4 class="availablePoints">사용가능한 포인트<span id="available_points">${dto.point }</span></h4>
	<div>
	<ul id="pointList"></ul>
	</div>
</div>
</div>
<script>
	const pointList = document.getElementById('pointList')
	
	window.onload = getpoint
</script>
</body>
</html>