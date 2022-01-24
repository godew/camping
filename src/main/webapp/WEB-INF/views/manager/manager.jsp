<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div id="manager">
	<div class="piechart"></div>
	<div class="linechart"></div>
	<div id="userlist">
		<c:forEach var="user" items="${users }">
			<div class="user">${user }</div>
		</c:forEach>
	</div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="${cpath }/resources/js/manager/function.js"></script>
<script>
	const users = document.querySelectorAll('.user')
	users.forEach(user => {
		user.ondblclick = chatRender
		
	})	

	// google chart
  	google.charts.load('current', {'packages':['corechart', 'line']});
  	google.charts.setOnLoadCallback(drawPieChart)
  	google.charts.setOnLoadCallback(drawLineChart)
</script>
</body>
</html>
