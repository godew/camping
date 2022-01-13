<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../filter/header.jsp" %>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/userinfo/userinfo.css">
<script>
const cpath = '${cpath}'

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

function getMember(event) {
	const url = cpath + '/member/' + 1
	const opt = {
			method: 'GET'
	}
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json[0])
		json.forEach(m => {
			let name_span = document.querySelector('.name_span')
			let name_input = document.getElementsByName('name')
			
			let phone_span = document.querySelector('.phone_span')
			let phone_input = document.getElementsByName('phone')
			
			let kind = document.querySelector('.kind')
			
			switch (m.memberKind) {
			case 'n':
			kind.innerText = 'naver 회원으로 로그인'
				break;
			case 'k':
			kind.innerText = 'Kakao Talk 회원으로 로그인'
				break;
			case 'd':
			kind.innerText = '여기어때 회원으로 로그인'
				break;
			default:
				break;
			}
			console.log(m.name.charAt(1).replace('*'))
			
			name_span.innerText = m.name
			name_input.value = m.name
			
			let pnum = m.phone.split('-')
			console.log(pnum[0])
			result = pnum[0] + '****' + pnum[2]
			
			phone_span.innerText = result
			phone_input.value = result
		})
		
	})
}




</script>
<div class="content">
<div class="leftmenu">
	<nav>
		<ul>
			<li><a>포인트</a></li>
			<li><a>예약 내역</a></li>
			<li><a>내 정보 관리</a></li>
		</ul>
		
	</nav>
</div>

<div class="userInfo">
	<strong>내 정보 수정</strong>
	<div>
	<img src="https://image.goodchoice.kr/profile/ico/ico_25.png" width="125px;">
	<p class="kind"></p>
	</div>
<!-- 	닉네임 -->
	<div id="nickname">
		<div class="username">
			<b>닉네임</b>
			<span><!-- 닉네임 --></span>
		</div>
			<button class="renameBTN1" type="button" value="1">수정</button>
			
		<div id="modify1" class="modify hidden"><!-- 수정버튼 누르면 나타나는 태그 -->
			<form>
				<p><input type="text" placeholder="체크인시 필요한 정보입니다" required></p>
				<p>
				<button id="change1" type="submit">수정 완료</button>
				<button id="cancelBTN1" type="button" value="1">수정 취소</button>
				</p>
			</form>
		</div>
	</div>

	<!-- 예약자 이름 -->
	<div id="name">
		<div>
			<b>이름</b>
			<span class="name_span">1234<!-- 예약자 이름(별로 가림) --></span>
		</div>
		<button class="renameBTN2" value="2">수정</button>
		
		<div id="modify2" class="modify hidden"><!-- 수정버튼 누르면 나타나는 태그 -->
			<form>
				<p><input type="text" name="name" placeholder="체크인시 필요한 정보입니다" required></p>
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
			<span class="phone_span">1234<!-- 전화번호(가운데 4자리 별로 가림) --></span>
			<div>개인 정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</div>
		</div>
		<button class="renameBTN3" value="3">수정</button>
		
		<div id="modify3" class="modify hidden"><!-- 수정버튼 누르면 나타나는 태그 -->
			<form>
				<p><input type="text" name="phone" placeholder="체크인시 필요한 정보입니다" required></p>
				<p>
				<button id="change3" type="submit">수정 완료</button>
				<button id="cancelBTN3" type="button" value="3">수정 취소</button>
				</p>
			</form>
		</div>
	</div>
	<hr>
	<hr>
	<div class="secession">
	<p>이용하고 싶지 않으신가요?</p>
	<button>로그아웃</button>
	<button>회원탈퇴</button>
	</div>
</div>
</div>
<script>


	const nickname = document.getElementById('nickname')
	const name = document.getElementById('name')
	const phone = document.getElementById('phone')


	const renameBTN1 = document.querySelector('.renameBTN1')
	const renameBTN2 = document.querySelector('.renameBTN2')
	const renameBTN3 = document.querySelector('.renameBTN3')
	
	const modify1 = document.getElementById('modify1')
	const modify2 = document.getElementById('modify2')
	const modify3 = document.getElementById('modify3')
	
	const cancelBTN1 = document.getElementById('cancelBTN1')
	const cancelBTN2 = document.getElementById('cancelBTN2')
	const cancelBTN3 = document.getElementById('cancelBTN3')
	
	
	renameBTN1.onclick = showModify
	renameBTN2.onclick = showModify
	renameBTN3.onclick = showModify
	
	cancelBTN1.onclick = hideModify
	cancelBTN2.onclick = hideModify
	cancelBTN3.onclick = hideModify
	
	window.onload = getMember
</script>



</body>
</html>