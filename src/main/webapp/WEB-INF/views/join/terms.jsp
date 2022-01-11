<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AfterCamp</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/login/terms.css">
</head>
<body>
<div class="termsBody">
	<div class="title">
			<img src="${cpath }/resources/img/logo3.png">fterCamp 약관동의
	</div>
	<div class="agreeForm">
		<div>
			<span class="allAgree">	
				<input type="checkbox" name="all"><a>전체동의</a>
			</span>
		</div>
		<div>
			<span>	
				<input class="agree" type="checkbox" name="agree"><a href="">이용약관 동의</a>
			</span>
			<span class="necessary">(필수)</span>
		</div>
		<div>
			<span>	
				<input class="agree" type="checkbox" name="agree"><a href="">만 14세 이상 확인</a>
			</span>
			<span class="necessary">(필수)</span>
		</div>
		<div>
			<span>	
				<input class="agree" type="checkbox" name="agree"><a href="">개인정보 수집 및 이용 동의</a>
			</span>
			<span class="necessary">(필수)</span>
		</div>
		<div>
			<span>	
				<input class="agree" type="checkbox" name="agree"><a href="">개인정보 수집 및 이용 동의 </a>
			</span>
			<span>(선택)</span>
		</div>
		<div>
			<span>	
				<input class="agree" type="checkbox" name="agree"><a href="">위치기반 서비스 이용약관 동의</a>
			</span>
			<span>(선택)</span>
		</div>
		<div>
			<span>	
				<button class="btn disabled" type="button">다음</button>
			</span>
		</div>
	</div>
</div>
<script>
	
	function checkRequired() {
		const flag1 = agreeBtnList[0].checked
		const flag2 = agreeBtnList[1].checked
		const flag3 = agreeBtnList[2].checked
		if(flag1 && flag2 && flag3) btn.classList.remove('disabled')
		else			   			btn.classList.add('disabled')
	}
	
	const allBtn = document.querySelector('input[name="all"]')
	const agreeBtnList = document.querySelectorAll('.agree')
	const btn = document.querySelector('.btn')
	
	
	
	btn.onclick = function() {
		location.href = 'verification'
	}
	
	allBtn.onclick = function(event) {
		agreeBtnList.forEach(box => box.checked = allBtn.checked ? 'checked' : '')
		checkRequired()
	}
	agreeBtnList.forEach(box => box.onchange = checkRequired)
</script>
</body>
</html>