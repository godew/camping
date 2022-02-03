<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cpath" value="${pageContext.request.contextPath }"></c:set>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/filtercss/filterStyle.css">
<link rel="stylesheet" type="text/css" href="${cpath }/resources/css/filtercss/filterStyle2.css">


</head>

<body class="headerBody">
<div class="mapModal mapModalHidden">
	<div class="mapOverlay"></div>
	<div class="mapModalWrap">
		<div class="map"></div>	
	</div>
</div>

<div class="bodywrap">
	<div class="filterwrap1">
		<section class="filterSection">
			<h3 class="calendar">날짜</h3>
			<div class="todayCalendar">
				<div class="todayAndTomorrow"></div>
			</div>
			<div class="filterCalendar calendarHidden">
				<div class="calendarDay">
					<button class="calendarPrev"></button>
					<div class="calendarYear"></div>
					<button class="calendarNext"></button>
				</div>
				<table id="calendarTable">
					<thead>
						<tr>
							<th class="calendarYoil"><span>일</span></th>
							<th class="calendarYoil"><span>월</span></th>
							<th class="calendarYoil"><span>화</span></th>
							<th class="calendarYoil"><span>수</span></th>
							<th class="calendarYoil"><span>목</span></th>
							<th class="calendarYoil"><span>금</span></th>
							<th class="calendarYoil"><span>토</span></th>
						</tr>
					</thead>
					<tbody class="calendarTbody">
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
						<tr></tr>
					</tbody>
				</table>
				<div><button class="calendarSubmit" value="선택완료">선택완료</button></div>
			</div>
		</section>
		
		<section class="filterSection">
			<h3 class=" filterDetaile">상세조건</h3>
			<div class="detailBtn">
				<button type="reset" class="filterReset">초기화</button>	
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
						<input type="range" id="input-left" min="1" max="30" value="1" step="1">
						<input type="range" id="input-right" min="1" max="30" value="30" step="1">
				
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
				<li><input type="checkbox" class="label_chk" value="전기사용가능">전기사용가능</li>
				<li><input type="checkbox" class="label_chk" value="BBQ">BBQ</li>
				<li><input type="checkbox" class="label_chk" value="개수대">개수대 </li>
				<li><input type="checkbox" class="label_chk" value="공용샤워실">공용샤워실</li>
				<li><input type="checkbox" class="label_chk" value="인터넷">인터넷</li>
				<li><input type="checkbox" class="label_chk" value="매점">매점</li>
				<li><input type="checkbox" class="label_chk" value="공용화장실">공용화장실</li>
				<li><input type="checkbox" class="label_chk" value="물놀이시설">물놀이시설</li>
				<li><input type="checkbox" class="label_chk" value="카페">카페</li>
				<li><input type="checkbox" class="label_chk" value="편의점">편의점</li>
				<li><input type="checkbox" class="label_chk" value="노래방">노래방</li>
				<li><input type="checkbox" class="label_chk" value="주방/식당">주방/식당</li>
				<li><input type="checkbox" class="label_chk" value="세탁기">세탁기</li>
				<li><input type="checkbox" class="label_chk" value="건조기">건조기</li>
				<li><input type="checkbox" class="label_chk" value="탈수기">탈수기</li>
				<li><input type="checkbox" class="label_chk" value="공용PC">공용PC</li>
				<li><input type="checkbox" class="label_chk" value="주차장">주차장</li>
				<li><input type="checkbox" class="label_chk" value="라운지">라운지</li>
				<li><input type="checkbox" class="label_chk" value="전자레인지">전자레인지</li>
				<li><input type="checkbox" class="label_chk" value="취사가능">취사가능</li>
			</ul>
		</section>
		
		<section class="filterSection"> 
			<strong class="filterTitle">객실 내 시설</strong>
			<ul class="filterUL">
				<li><input type="checkbox" class="label_chk" value="객실샤워실">객실샤워실</li>
				<li><input type="checkbox" class="label_chk" value="드라이기">드라이기</li>
				<li><input type="checkbox" class="label_chk" value="와이파이">와이파이</li>
				<li><input type="checkbox" class="label_chk" value="TV">TV</li>
				<li><input type="checkbox" class="label_chk" value="욕실용품">욕실용품</li>
				<li><input type="checkbox" class="label_chk" value="냉장고">냉장고</li>
				<li><input type="checkbox" class="label_chk" value="에어컨">에어컨</li>
				<li><input type="checkbox" class="label_chk" value="냉장고">냉장고</li>
				<li><input type="checkbox" class="label_chk" value="욕조">욕조</li>
				<li><input type="checkbox" class="label_chk" value="다리미">다리미</li>
				<li><input type="checkbox" class="label_chk" value="전기밥솥">전기밥솥</li>
				<li><input type="checkbox" class="label_chk" value="객실스파">객실스파</li>
				<li><input type="checkbox" class="label_chk" value="세면도구">세면도구</li>
			</ul>
		</section>
		
		<section class="filterSection"> 
			<strong class="filterTitle">기타</strong>
			<ul class="filterUL">
				<li><input type="checkbox" class="label_chk" value="장비대여">장비대여</li>
				<li><input type="checkbox" class="label_chk" value="사이트주차">사이트주차</li>
				<li><input type="checkbox" class="label_chk" value="카드결제">카드결제</li>
				<li><input type="checkbox" class="label_chk" value="조식포함">조식포함</li>
				<li><input type="checkbox" class="label_chk" value="객실내흡연">객실내흡연</li>
				<li><input type="checkbox" class="label_chk" value="발렛파킹">발렛파킹</li>
				<li><input type="checkbox" class="label_chk" value="반려견동반">반려견동반</li>
				<li><input type="checkbox" class="label_chk" value="객실내취사">객실내취사</li>
				<li><input type="checkbox" class="label_chk" value="픽업가능">픽업가능</li>
				<li><input type="checkbox" class="label_chk" value="캠프파이어">캠프파이어</li>
				<li><input type="checkbox" class="label_chk" value="금연">금연</li>
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
			<div class="inDisplay"></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=081d224ac09a57b9fde6466317eda63c"></script>
<script src="${cpath }/resources/js/filterJs/function.js"></script>
<script src="${cpath }/resources/js/filterJs/function2.js"></script>
<script src="${cpath }/resources/js/filterJs/function3.js"></script>
<script src="${cpath }/resources/js/filterJs/function4.js"></script>
<%-- <script src="${cpath }/resources/js/filterJs/function5.js"></script> --%>
<script src="${cpath }/resources/js/filterJs/function6.js"></script>


<script>

// 	window.addEventListener('load', function() {
// 		filterBtnOnClick1.classList.add('btnOnClick')
// 	})
	
// 	filterBtnOnClick1.addEventListener('click', btn1OC)
// 	busan.addEventListener('click', btn1OC)
// 	gyeonggi.addEventListener('click', btn1OC)
// 	chungcheong.addEventListener('click', btn1OC)
// 	jeju.addEventListener('click', btn1OC)
// 	gangwon.addEventListener('click', btn1OC)
	
 	headerBody.addEventListener('click', areaCloseHandler)
 	
 	function areaCloseHandler(event) {
 		filterAreaModal.classList.add('areaModalHidden')
 	}
 	
 	window.addEventListener('load', mainAllFilter)

 	
</script>




</body>
</html>