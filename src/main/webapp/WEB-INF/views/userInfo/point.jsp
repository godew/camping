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
		console.log(json)
		console.log(json.title)
		json.forEach(p => {
		console.log(p.title)
		
			let li = ``
			li += `<li>`
			li += p.title + `(` + p.rpoint + `)`
			li += `<span>`
			li += p.reviewDate
			li += `</span>`
			li += `<p>`
			li += p.rpoint
			li += `</p>`
			li += `</li>`
			pointList.innerHTML = li
			
		})
		
	})
	
}
</script>


<div>
	<h4>사용가능 포인트<span id="point"><!-- point --></span></h4>
	<hr>
	<div>
	<ul id="pointList">
		<li>
			reviewname
			<span>date</span>
			<p>point</p>
		</li>
	</ul>
	</div>
</div>

<script>

const pointList = document.getElementById('pointList')

window.onload = getpoint

</script>
</body>
</html>