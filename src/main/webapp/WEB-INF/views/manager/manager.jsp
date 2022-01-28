<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div id="manager">
	<div class="piechart"></div>
	<div class="lineColumnchart">
		<button class="changeBtn">Column-chart</button>
		<div class="chart"></div>
	</div>
	<div id="userlist">
		<c:forEach var="user" items="${users }">
			<div class="user">${user }</div>
			<div data-name="${user }" class="manager-msg hidden">
				<div class="ma-content-wrap">
					<div data-email="${user }" class="ma-content"></div>
					<div>
						<input data-name="${user }" type="text" name="ma-msg" autocomplete="off">
						<button class="ma-ws-send-msg-btn" data-name="${user }">전송</button>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="${cpath }/resources/js/manager/function.js"></script>
<script>
	const users = document.querySelectorAll('.user')
	let rows = []
// 	const maWsContents = document.querySelectorAll('.ma-content-wrap > .ma-content')
// 	const maWsSendMsgBtns = document.querySelectorAll('.ma-ws-send-msg-btn')
// 	const maContentWrapInputs = document.querySelectorAll('.ma-content-wrap input')
	
	users.forEach((user, idx) => {
		user.ondblclick = function(event) {
			const tmp = event.target.innerText
			const managerMsg = document.querySelector('div[data-name="' + tmp + '"]')
			const maContentWrapInput = document.querySelector('input[data-name="' + tmp + '"]')
			const maWsSendMsgBtn = document.querySelector('button[data-name="' + tmp + '"]')
			
			managerMsg.classList.remove('hidden')
			maContentWrapInput.focus()
			maWsSendMsgBtn.onclick = maWsMsgBtnHandler
			maContentWrapInput.onkeydown = function(event) {
				if (event.key == 'Enter') {
					maWsMsgBtnHandler(event)
				}
			}
		}		
	})	
	
	// google chart
  	google.charts.load('current', {'packages':['corechart']});
  	google.charts.setOnLoadCallback(drawPieChart)
  	google.charts.setOnLoadCallback(drawLineChart)
  	
  	const changeBtn = document.querySelector('.changeBtn')
  	changeBtn.onclick = function() {
  		if (changeBtn.innerText == 'Column-chart') {
  			changeBtn.innerText = 'line-chart'
 			google.charts.setOnLoadCallback(columnChart)
  		} else {
  			changeBtn.innerText = 'Column-chart'
			google.charts.setOnLoadCallback(lineChart)
  		}
  	}
</script>
</body>
</html>
