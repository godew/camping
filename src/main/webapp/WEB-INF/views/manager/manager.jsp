<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<div id="manager">
	<div id="userlist">
		<c:forEach var="user" items="${users }">
			<div data-user="${user }" data-cnt="0" ondblclick="dbClickHandler(event)" class="user">${user }</div>
		</c:forEach>
	</div>
	<div id="mamsglist">
		<c:forEach var="user" items="${users }">
			<div data-name="${user }" class="manager-msg hidden">
				<div class="msg-header">
					<div>${user }</div>
					<div data-close="${user }" class="close" onclick="closeClickHandler(event)">X</div>
				</div>
				<div class="ma-content-wrap">
					<div data-email="${user }" class="ma-content"></div>
					<div>
						<input data-name="${user }" type="text" name="ma-msg" onkeydown="keydownHandler(event)" autocomplete="off">
						<button class="ma-ws-send-msg-btn" data-name="${user }" onclick="maWsMsgBtnHandler(event)">전송</button>
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
	let rows = []
	
	if ('${empty login or login.email ne "manager@naver.com"}' == 'true') {
		location.href = cpath + '/login/login'
	}
	
	// 마우스 드래그 이벤트
	window.onload = function() {
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
	}

 
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
