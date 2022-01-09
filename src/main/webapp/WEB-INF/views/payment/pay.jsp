<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<button class="pay">pay</button>
<button class="cancel">cancel</button>
<script>
	let btn = document.querySelector('.pay')
	let btn2 = document.querySelector('.cancel')
	const cpath = '${cpath }'
	btn.onclick = function() {
		const url = cpath + '/ready';
		const opt = {
				method : 'GET'
		}
		fetch(url, opt)
			.then(resp => resp.json())
			.then(json => {
				console.log(json.tid)
				window.open(json.next_redirect_pc_url)
			})
	}
	
	btn2.onclick = function() {
		const url = cpath + '/cancel';
		const opt = {
				method : 'GET'
		}
		fetch(url, opt)
			.then(resp => resp.json())
			.then(json => {
				console.log(json)
			})
	}
</script>
</body>
</html>