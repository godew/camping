<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
	const login = '${not empty login}'
	if (login == 'true') {
		window.opener.location.href = '${pageContext.request.contextPath}/reservation/${login.memberID}'		
	} else {
		window.opener.location.href = '${pageContext.request.contextPath}/payment/notInfo'
	}
    window.close()
</script>
</body>
</html>