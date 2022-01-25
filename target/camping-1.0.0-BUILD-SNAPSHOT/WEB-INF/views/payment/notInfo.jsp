<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<div class="notInfo">
	<h2>비회원 주문이 완료되었습니다</h2>
	<h4>주문번호는 [<span>${tid }</span>] 입니다 </h4>
	<h5>예약내역에서 주문번호로 주문내역을 확인할 수 있으니, 주문번호를 기억해주세요</h5>
	<h5>(주문번호 클릭 시 클립보드 자동 저장)</h5>
</div>
</body>
<script>
	
	const tid = document.querySelector('span')
	
	tid.onclick = function() {
		const t = document.createElement('textarea')
		document.body.appendChild(t)
		t.value = tid.innerText
		t.select()
			
		document.execCommand('copy')
	 	document.body.removeChild(t);
	}
	  
</script>
</html>