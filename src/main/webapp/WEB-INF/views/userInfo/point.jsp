<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/userinfo/userinfo.css">
<script>
function getpoint(event) {
	console.log(event.target)
	url = cpath + '/getRpoint/' + 1
	opt = {
		method:'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
			let result = 0
		json.forEach(point => {
			let available_points = document.getElementById('available_points')
			let li = document.createElement('li')
			let span = document.createElement('span')
			let p = document.createElement('p')
			
			result += point.rpoint
			
			li.innerText = point.title 
			span.innerText = point.reviewDate
			p.innerText = point.rpoint
			
			li.appendChild(span)
			li.appendChild(p)
			pointList.appendChild(li)
			console.log(result)
		})
			available_points.innerText = result
		
	})
	
}
</script>

<div class="content">
<div class="leftmenu">
	<nav>
		<ul>
			<li><a href="${cpath }/point">포인트</a></li>
			<li><a href="${cpath }/reservation">예약 내역</a></li>
			<li><a href="${cpath }/userInfo">내 정보 관리</a></li>
		</ul>
		
	</nav>
</div>
<div class="point">
	<h4 class="availablePoints">사용가능 포인트<span id="available_points"><!-- point --></span></h4>
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