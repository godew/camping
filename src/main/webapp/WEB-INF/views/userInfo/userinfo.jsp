<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/userinfo/userinfo.css">
<script>

function showModify(event) {
	switch (event.target.value) {
	case '1':
	console.log(event.target.value)
	modify1.classList.remove('hidden')
	renameBTN1.classList.add('hidden')
		break;
	case '2':
	console.log(event.target.value)
	modify2.classList.remove('hidden')
	renameBTN2.classList.add('hidden')
		break;
	case '3':
	console.log(event.target.value)
	modify3.classList.remove('hidden')
	renameBTN3.classList.add('hidden')
		break;

	default:
		break;
	}
}

function hideModify(event) {
	
	switch (event.target.value) {
	case '1':
	console.log(event.target.value)
	modify1.classList.add('hidden')
	renameBTN1.classList.remove('hidden')
	break;
	case '2':
	console.log(event.target.value)
	modify2.classList.add('hidden')
	renameBTN2.classList.remove('hidden')
	break;
	case '3':
	console.log(event.target.value)
	modify3.classList.add('hidden')
	renameBTN3.classList.remove('hidden')
	break;
	default:
		break;
	}
}



</script>
<div class="contentAA">
<div class="leftmenu">
	<nav>
		<ul>
			<li><a href="${cpath }/point/${dto.memberID}">포인트</a></li>
			<li><a href="${cpath }/reservation/${dto.memberID}">예약 내역</a></li>
			<li><a href="${cpath }/userInfo/${dto.memberID}">내 정보 관리</a></li>
		</ul>
		
	</nav>
</div>
<div class="userInfo">
	<strong>내 정보 수정</strong>
	<div>
	<p><img src="https://image.goodchoice.kr/profile/ico/ico_25.png" width="125px;"></p>
	<p class="kind">
	<c:choose>
	<c:when test="${dto.memberKind == 'n' }">
		naver계정으로 로그인
	</c:when>
	<c:when test="${dto.memberKind == 'k' }">
		KakaoTalk계정으로 로그인
	</c:when>
<%-- 	<c:when test="${dto.memberKind == 'n' }"> --%>
		
<%-- 	</c:when> --%>
	</c:choose>
	</p>
	</div>


	<!-- 예약자 이름 -->
	<div id="name">
		<div>
			<b>이름</b>
			<span class="name_span">${dto.name }</span>
		</div>
		<button class="renameBTN2" value="2">수정</button>
		
		<div id="modify2" class="modify hidden"><!-- 수정버튼 누르면 나타나는 태그 -->
			<form method="POST">
				<p><input type="text" value="${dto.name }" name="name" placeholder="체크인시 필요한 정보입니다" required></p>
				<p>
				<button id="change2" type="submit">수정 완료</button>
				<button id="cancelBTN2" type="button" value="2">수정 취소</button>
				</p>
			</form>
		</div>
	</div>
	
	<!-- 휴대폰 번호 -->
	<div id="phone">
		<div>
			<b>휴대폰 번호</b>
			<span id="phoneSpan">${dto.phone }</span>
			<div class="warning">개인 정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</div>
		</div>
		<button class="renameBTN3" value="3">수정</button>
		
		<div id="modify3" class="modify hidden"><!-- 수정버튼 누르면 나타나는 태그 -->
			<form method="POST">
				<p><input type="text" value="${dto.phone }" name="phone" placeholder="체크인시 필요한 정보입니다" required></p>
				<p>
				<button id="change3" type="submit">수정 완료</button>
				<button id="cancelBTN3" type="button" value="3">수정 취소</button>
				</p>
			</form>
		</div>
	</div>
</div>
</div>
<script>
	const phoneSpan = document.getElementById('phoneSpan')
	let pnum = phoneSpan.innerText
	const result = pnum.substring(0,3) + '****' + pnum.substring(7,11)
	console.log(result)
	phoneSpan.innerText = result
	
	
	
	const nickname = document.getElementById('nickname')
	const name = document.getElementById('name')
	const phone = document.getElementById('phone')


	const renameBTN2 = document.querySelector('.renameBTN2')
	const renameBTN3 = document.querySelector('.renameBTN3')
	
	const modify2 = document.getElementById('modify2')
	const modify3 = document.getElementById('modify3')
	
	const cancelBTN2 = document.getElementById('cancelBTN2')
	const cancelBTN3 = document.getElementById('cancelBTN3')
	
	
	renameBTN2.onclick = showModify
	renameBTN3.onclick = showModify
	
	cancelBTN2.onclick = hideModify
	cancelBTN3.onclick = hideModify
	
</script>



</body>
</html>