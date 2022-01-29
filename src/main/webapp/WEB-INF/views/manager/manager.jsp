<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div id="manager">
	<div id="userlist">
		<c:forEach var="user" items="${users }">
			<div data-user="${user }" data-cnt="0" class="user">${user }</div>
			<div data-name="${user }" class="manager-msg hidden">
				<div class="msg-header">
					<div>${user }</div>
					<div data-close="${user }" class="close">X</div>
				</div>
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
	<div class="piechart"></div>
	<div class="lineColumnchart">
		<button class="changeBtn">Column-chart</button>
		<div class="chart"></div>
	</div>
</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="${cpath }/resources/js/manager/function.js"></script>
<script>
	if ('${empty login or login.email ne "manager@naver.com"}' == 'true') {
		location.href = cpath + '/login/login'
	}
	const users = document.querySelectorAll('.user')
	let rows = []
// 	const maWsContents = document.querySelectorAll('.ma-content-wrap > .ma-content')
// 	const maWsSendMsgBtns = document.querySelectorAll('.ma-ws-send-msg-btn')
// 	const maContentWrapInputs = document.querySelectorAll('.ma-content-wrap input')
	
	users.forEach((user, idx) => {
		user.ondblclick = function(event) {
			const tmp = event.target.dataset.user
			const managerMsg = document.querySelector('div[data-name="' + tmp + '"]')
			const maContentWrapInput = document.querySelector('input[data-name="' + tmp + '"]')
			const maWsSendMsgBtn = document.querySelector('button[data-name="' + tmp + '"]')
			const user = document.querySelector('div[data-user="' + tmp + '"]')
			
			managerMsg.classList.remove('hidden')
			user.dataset.cnt = 0
			user.innerText = tmp
			maContentWrapInput.focus()
			maWsSendMsgBtn.onclick = maWsMsgBtnHandler
			maContentWrapInput.onkeydown = function(event) {
				if (event.key == 'Enter') {
					maWsMsgBtnHandler(event)
				}
			}
		}		
	})	
	
	const closes = document.querySelectorAll('.manager-msg .close')
	closes.forEach(c => {
		c.onclick = function() {
			const tmp = c.dataset.close
			const managerMsg = document.querySelector('div[data-name="' + tmp + '"]')
			managerMsg.classList.add('hidden')
		}
	})
	
  	let pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0

   	const headers = document.querySelectorAll('.manager-msg > .msg-header')
   	const headerWraps = document.querySelectorAll('.manager-msg')
   	
   	headers.forEach((header, idx) => {
	   	header.onmousedown = function(e) {
	   	    e = e || window.event
	   	    e.preventDefault()
	   	    pos3 = e.clientX
	   	    pos4 = e.clientY
	   	    document.onmousemove = function(e) {
		   	    e = e || window.event
		   	    e.preventDefault()
		   	    pos1 = pos3 - e.clientX
		   	    pos2 = pos4 - e.clientY
		   	    pos3 = e.clientX
		   	    pos4 = e.clientY
		   	 	headerWraps[idx].style.top = (headerWraps[idx].offsetTop - pos2) + "px"
		   	 	headerWraps[idx].style.left = (headerWraps[idx].offsetLeft - pos1) + "px"
	   	    }
	   	    document.onmouseup = function() {
	   	     	document.onmouseup = null
	   	    	document.onmousemove = null
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
