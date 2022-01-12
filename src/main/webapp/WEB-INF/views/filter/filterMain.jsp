<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/filtercss/filterStyle.css">
</head>
<body>
<div class="mapModal mapModalHidden">
	<div class="mapOverlay"></div>
</div>
<div class="bodywrap">
	<div class="filterwrap1">
		<section class="filterSection">
			<h3 class="calendar">날짜</h3>
			<div class="todayCalendar">
				<div class="todayAndTomorrow"></div>
			</div>
			<table class="filterCalendar">
				<thead> 
					<tr>
						<!-- 요일 일~토 -->
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- 일자 1~31 -->
					</tr>
				</tbody>
			</table>
		</section>
		
		<section class="filterSection">
			<h3 class=" filterDetaile">상세조건</h3>
			<div class="detailBtn">
				<button type="button" class="filterReset">초기화</button>	
				<button type="submit" class="filterSubmit">적용</button>	
			</div>
		</section>
		
		<section class="filterSection">
			<div class="titlePersonCnt">
				<strong class="filterTitle">인원</strong>
				<div class="filterPrice">
					<button class="filterMinus">-</button>
					<div class="filterResult">2</div>
					<button class="filterPlus">+</button>
				</div>
			</div>
		</section>
		
		<section class="filterSection">
			<div class="priceWrap">
				<strong class="filterTitle">가격</strong>
				<div class="filterPriceList"></div>
			</div>
				<div class="middle">
					<div class="multi-range-slider">
						<input type="range" id="input-left" min="10000" max="300000" value="10000" step="10000">
						<input type="range" id="input-right" min="10000" max="300000" value="300000" step="10000">
				
						<div class="slider">
							<div class="track"></div>
							<div class="range"></div>
							<div class="thumb left"></div>
							<div class="thumb right"></div>
						</div>
					</div>
				</div>
		</section>
		
		<section class="filterSection">
			<strong class="filterTitle">공용시설</strong>
			<ul class="filterUL">
				<li><input type="checkbox" class="label_chk">
					<label class="checkboxLabel">전기사용가능</label>
				</li>
				<li><input type="checkbox" class="label_chk">BBQ</li>
				<li><input type="checkbox" class="label_chk">개수대</li>
				<li><input type="checkbox" class="label_chk">공용샤워실</li>
				<li><input type="checkbox" class="label_chk">인터넷</li>
				<li><input type="checkbox" class="label_chk">매점</li>
				<li><input type="checkbox" class="label_chk">공용화장실</li>
				<li><input type="checkbox" class="label_chk">물놀이시설</li>
				<li><input type="checkbox" class="label_chk">카페</li>
				<li><input type="checkbox" class="label_chk">편의점</li>
				<li><input type="checkbox" class="label_chk">노래방</li>
				<li><input type="checkbox" class="label_chk">주방/식당</li>
				<li><input type="checkbox" class="label_chk">세탁기</li>
				<li><input type="checkbox" class="label_chk">건조기</li>
				<li><input type="checkbox" class="label_chk">탈수기</li>
				<li><input type="checkbox" class="label_chk">공용PC</li>
				<li><input type="checkbox" class="label_chk">주차장</li>
				<li><input type="checkbox" class="label_chk">라운지</li>
				<li><input type="checkbox" class="label_chk">전자레인지</li>
				<li><input type="checkbox" class="label_chk">취사가능</li>
			</ul>
		</section>
		
		<section class="filterSection"> 
			<strong class="filterTitle">객실 내 시설</strong>
			<ul class="filterUL">
				<li><input type="checkbox" class="label_chk">객실샤워실</li>
				<li><input type="checkbox" class="label_chk">드라이기</li>
				<li><input type="checkbox" class="label_chk">와이파이</li>
				<li><input type="checkbox" class="label_chk">TV</li>
				<li><input type="checkbox" class="label_chk">욕실용품</li>
				<li><input type="checkbox" class="label_chk">냉장고</li>
				<li><input type="checkbox" class="label_chk">에어컨</li>
				<li><input type="checkbox" class="label_chk">냉장고</li>
				<li><input type="checkbox" class="label_chk">욕조</li>
				<li><input type="checkbox" class="label_chk">다리미</li>
				<li><input type="checkbox" class="label_chk">전기밥솥</li>
				<li><input type="checkbox" class="label_chk">객실스파</li>
				<li>
					<input type="checkbox" class="label_chk">
					<label class="filterLabel">세면도구</label>
				</li>
			</ul>
		</section>
		
		<section class="filterSection"> 
			<strong class="filterTitle">기타</strong>
			<ul class="filterUL">
				<li><input type="checkbox" class="label_chk">장비대여</li>
				<li><input type="checkbox" class="label_chk">사이트주차</li>
				<li><input type="checkbox" class="label_chk">카드결제</li>
				<li><input type="checkbox" class="label_chk">조식포함</li>
				<li><input type="checkbox" class="label_chk">객실내흡연</li>
				<li><input type="checkbox" class="label_chk">발렛파킹</li>
				<li><input type="checkbox" class="label_chk">반려견동반</li>
				<li><input type="checkbox" class="label_chk">객실내취사</li>
				<li><input type="checkbox" class="label_chk">픽업가능</li>
				<li><input type="checkbox" class="label_chk">캠프파이어</li>
				<li><input type="checkbox" class="label_chk">금연</li>
			</ul>
		</section>	
	</div>
	<div class="filterDisplay">
		<div class="filterwrap2">
			<div class="infilterwrap">
				<div class="filterBtn">
					<button class="filterBtnOnClick1"><span>추천 순</span></button>
					<button class="filterBtnOnClick2"><span>거리 순</span></button>
					<button class="filterBtnOnClick3"><span>낮은 가격 순</span></button>
					<button class="filterBtnOnClick4"><span>높은 가격 순</span></button>
				</div>
				
				<button class="filter_mapBtn">지도</button>
			</div>
		</div>
		<div class="filterwrap3">
			<div>
				<div id="map"></div>
			</div>
			<div class="inDisplay"></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=081d224ac09a57b9fde6466317eda63c"></script>
<script src="${cpath }/resources/js/filterJs/function.js"></script>

<script>
	
	/* mapContainer = #map */
	const mapBtn = document.querySelector('.filter_mapBtn')
	const cpath = '${cpath}'
	
	mapBtn.onclick = clickBtn
	mapBtn.addEventListener('click', function() {
		
		mapContainer.classListt.add('modalMap')
	})
</script>

<script src="${cpath }/resources/js/filterJs/function2.js"></script>

<script>
	let date = new Date()
	let month = date.getMonth()+1
	let today = date.getDate()
	let tomorrow = today + 1
	let night = tomorrow - today
	const todayAndTomorrow = document.querySelector('.todayAndTomorrow')
	
	window.addEventListener('load', function() {
		todayAndTomorrow.innerHTML = '<div>' + month + '.' + today + ' ~ ' + month + '.' + tomorrow + ' · ' + night + '박' + '</div>'
	})
	
</script>

<script>
	
	


</script>

</body>
</html>