<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }" />
<%@ include file="../header.jsp" %>





<div class="filterHeaderWrap">




	<div class="underHeader">
		<div class="underHeaderDiv">
			<div class="headerCamping">캠핑</div>
			<div class="headerArea"></div>
			<div class="filterAreaModal areaModalHidden">
				<a><button id="area" class="gyeonggi area" data-areacode="5001" data-area="경기/인천권 전체">경기/인천권 전체</button></a>
				<a><button id="area" class="chungcheong area" data-areacode="5003" data-area="충천권 전체">충천권</button></a>
				<a><button id="area" class="busan area" data-areacode="5004" data-area="경상/부산권 전체">경상/부산권</button></a>
				<a><button id="area" class="jeju area" data-areacode="5005" data-area="전라/제주권 전체">전라/제주권</button></a>
				<a><button id="area" class="gangwon area" data-areacode="5002" data-area="강원권 전체">강원권</button></a>
			</div>
		</div>
	</div>
</div>



<script>
	const headerBody = document.querySelector('.headerBody')
	const headerArea = document.querySelector('.headerArea')
	const filterAreaModal = document.querySelector('.filterAreaModal')
	const gyeonggi = document.querySelector('.gyeonggi')
	const chungcheong = document.querySelector('.chungcheong')
	const busan = document.querySelector('.busan')
	const jeju = document.querySelector('.jeju')
	const gangwon = document.querySelector('.gangwon')
	
	headerArea.onmouseover = areaOpenHandler
	
	
	
	function areaOpenHandler(event) {
		filterAreaModal.classList.remove('areaModalHidden')
	}
	
	
	window.addEventListener('load', function() {
		headerArea.innerText = gyeonggi.dataset.area
	})
	
	busan.onclick = function(event) {
		const url = cpath + '/searchArea/' + busan.dataset.areacode
		const opt = {
				method: 'GET'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => render(inDisplay, getDom(json)))
		
		headerArea.innerText = ''
		headerArea.innerText = busan.dataset.area
	}
	
	gyeonggi.onclick = function(event) {

		const url = cpath + '/searchArea/' + gyeonggi.dataset.areacode
		const opt = {
				method: 'GET'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => render(inDisplay, getDom(json)))
		
		headerArea.innerText = ''
		headerArea.innerText = gyeonggi.dataset.area
	}
	
	chungcheong.onclick = function(event) {
		const url = cpath + '/searchArea/' + chungcheong.dataset.areacode
		const opt = {
				method: 'GET'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => render(inDisplay, getDom(json)))
		
		headerArea.innerText = ''
		headerArea.innerText = chungcheong.dataset.area
	}
	
	jeju.onclick = function(event) {
		const url = cpath + '/searchArea/' + jeju.dataset.areacode
		const opt = {
				method: 'GET'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => render(inDisplay, getDom(json)))
		
		headerArea.innerText = ''
		headerArea.innerText = jeju.dataset.area
	}
	
	gangwon.onclick = function(event) {
		const url = cpath + '/searchArea/' + gangwon.dataset.areacode
		const opt = {
				method: 'GET'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => render(inDisplay, getDom(json)))
		
		headerArea.innerText = ''
		headerArea.innerText = gangwon.dataset.area
	}
	
</script>
</body>
