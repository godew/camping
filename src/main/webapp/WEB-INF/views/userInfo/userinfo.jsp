<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="userinfoHeader.jsp" %>
<body>
<script>
const cpath = '${cpath}'

function showModify(event) {
	modify.classList.remove('hidden')
	renameBTN.classList.add('hidden')
}

function hideModify(event) {
	modify.classList.add('hidden')
	renameBTN.classList.remove('hidden')
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
	<!-- 닉네임 -->
	<div>
		<div class="username">
			<b>닉네임</b>
			<span>1234<!-- 닉네임 --></span>
		</div>
		<div class="BTN">
			<button id="renameBTN">수정</button>
			
			<div class="modify hidden"><!-- 수정버튼 누르면 나타나는 태그 -->
				<form>
					<p><input type="text" placeholder="체크인시 필요한 정보입니다" required></p>
					<p>
					<button id="change" onsubmit="">수정 완료</button>
					<button id="cancelBTN">수정 취소</button>
					</p>
				</form>
			</div>
		</div>
	</div>

	<!-- 예약자 이름 -->
	<div>
		<div>
			<b>이름</b><span>1234<!-- 예약자 이름(별로 가림) --></span>
		</div>
		<button id="renameBTN">수정</button>
		
 		<div class="modify hidden"><!-- 수정버튼 누르면 나타나는 태그 -->
			<input type="text" placeholder="체크인시 필요한 정보입니다" required>
			<button id="change">수정</button>
		</div>
		<div class="modify hidden"><!-- 수정버튼 누르면 나타나는 태그 -->
			<form>
				<p><input type="text" placeholder="체크인시 필요한 정보입니다" required></p>
				<p>
				<button id="change" onsubmit="">수정 완료</button>
				<button id="cancelBTN">수정 취소</button>
				</p>
			</form>
		</div>
	</div>
	
	<!-- 휴대폰 번호 -->
	<div>
		<div>
			<b>휴대폰 번호</b><span>1234<!-- 전화번호(가운데 4자리 별로 가림) --></span>
			<div>개인 정보 보호를 위해 내 정보는 모두 안전하게 암호화됩니다.</div>
		</div>
		<button id="renameBTN">수정</button>
		
		<div class="modify hidden"><!-- 수정버튼 누르면 나타나는 태그 -->
			<input type="text" placeholder="체크인시 필요한 정보입니다" required>
			<button id="change">수정</button>
		</div>
		<div class="modify hidden"><!-- 수정버튼 누르면 나타나는 태그 -->
			<form>
				<p><input type="text" placeholder="체크인시 필요한 정보입니다" required></p>
				<p>
				<button id="change" onsubmit="">수정 완료</button>
				<button id="cancelBTN">수정 취소</button>
				</p>
			</form>
		</div>
	</div>
</div>
</div>
<script>
	const renameBTN = document.getElementById('renameBTN')
	const modify = document.querySelector('.modify')
	const cancelBTN = document.getElementById('cancelBTN')
	
	
	renameBTN.onclick = showModify
	cancelBTN.onclick = hideModify
</script>




</body>
</html>