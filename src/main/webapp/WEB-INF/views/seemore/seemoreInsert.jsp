<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${cpath }/resources/css/seemore/seemore.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${cpath }/resources/js/seemore/seemore.js"></script>
<html>
<body>
	
	<div class="content">
		<div class="notice">
			<div class="tab">
				
				<span class="tab_btn active">
					서비스 공지사항 작성탭
				</span>
				
			</div>
			
			<div id="writeDown">
				<div>
					<hr />
					<form id="insertForm">
						t_number : <input type="text" name="t_number" id="t_number" />
						&emsp;
						top_class : <input type="text" name="top_class" id="top_class" />
						&emsp;
						mid_class : <input type="text" name="mid_class" id="mid_class" />
						<hr />
						title : <input type="text" name="title" id="title" />
						&emsp;
						reg_date : <input type="text" name="reg_date" id="reg_date" />
						<hr />
						enfm_date : <input type="text" name="enfm_date" id="enfm_date" />
						<hr />
						t_contents<br />
						<textarea name="t_contents" id="t_contents" rows="5" cols="120"></textarea>
					</form>
					<hr />
					<button type="button" onclick="sendInsertForm()">전송</button>
				</div>
			</div>

		</div>
	</div>

	<script>
		
		function sendInsertForm() {
			
			const idBox = ['t_id', 'top_class', 'mid_class', 'title', 't_number', 'enfm_date', 't_contents', 'reg_date'];
			ajaxRequest("${cpath}/more/insert", {
				...getFormData(idBox, 'insertForm')
			}).then(data => {
				alert(data.resultMsg);
				return data;
			}).then(data => {
 				console.log(data);
			}).catch(error => {
				console.log(error);
				alert("오류가 발생했습니다");
			});
		}
		
	</script>
</body>
</html>