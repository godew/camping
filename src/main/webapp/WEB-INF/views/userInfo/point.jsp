<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../filter/header.jsp" %>

<script>
const cpath = '${cpath}'
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


<div>
	<h4>사용가능 포인트<span id="available_points"><!-- point --></span></h4>
	<hr>
	<div>
	<ul id="pointList"></ul>
	</div>
</div>

<script>

const pointList = document.getElementById('pointList')

window.onload = getpoint

</script>
</body>
</html>