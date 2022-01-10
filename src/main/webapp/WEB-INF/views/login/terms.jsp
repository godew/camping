<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/login/terms.css">
</head>
<body>
<div class="termsBody">
	<div class="title">AfterCamp 약관동의</div>
	<div class="agreeForm">
		<div>
			<span class="allAgree">	
				<input type="checkbox" name="agree"><a>전체동의</a>
			</span>
		</div>
		<div>
			<span>	
				<input type="checkbox" name="agree"><a href="">이용약관 동의</a>
			</span>
			<span class="necessary">(필수)</span>
		</div>
		<div>
			<span>	
				<input type="checkbox" name="agree"><a href="">만 14세 이상 확인</a>
			</span>
			<span class="necessary">(필수)</span>
		</div>
		<div>
			<span>	
				<input type="checkbox" name="agree"><a href="">개인정보 수집 및 이용 동의</a>
			</span>
			<span class="necessary">(필수)</span>
		</div>
		<div>
			<span>	
				<input type="checkbox" name="agree"><a href="">개인정보 수집 및 이용 동의 </a>
			</span>
			<span>(선택)</span>
		</div>
		<div>
			<span>	
				<input type="checkbox" name="agree"><a href="">위치기반 서비스 이용약관 동의</a>
			</span>
			<span>(선택)</span>
		</div>
	</div>
</div>
<script>

</script>
</body>
</html>