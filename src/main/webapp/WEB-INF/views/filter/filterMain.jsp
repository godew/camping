<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${cpath }/resources/filtercss/filterStyle.css">
</head>
<body>
<div class="bodywrap">
	<div class="filterwrap1">
		<section>
			<h3 class="calender">날짜</h3>
			<table class="filterCalender">
			
			</table>
		</section>
		
		<section>
			<h3 class=" filterDetaile">상세조건</h3>
			<div class="detailBtn">
				<button type="button" class="filterReset">초기화</button>	
				<button type="submit" class="filterSubmit">적용</button>	
			</div>
		</section>
		
		<section>
			<div class="titlePersonCnt">
				<strong class="filterTitle">인원</strong>
				<div class="filterPrice">
					<button class="filterMinus">-</button>
					<div class="filterResult">2</div>
					<button class="filterPlus">+</button>
				</div>
			</div>
		</section>
		
		<section>
			<div class="priceWrap">
				<strong class="filterTitle">가격</strong>
				<div class="filterPriceList">12만원</div>
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
		
		<section>
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
		
		<section>
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
		
		<section>
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
	<div class="filterwrap2">
		<div class="infilterwrap">
			<div class="filterBtn">
				<button><span>추천 순</span></button>
				<button><span>거리 순</span></button>
				<button><span>낮은 가격 순</span></button>
				<button><span>높은 가격 순</span></button>
			</div>
			
			<button class="filter_mapBtn">지도</button>
		</div>
	</div>
	<div id="map" style="width:50%;height:350px;"></div>
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=081d224ac09a57b9fde6466317eda63c"></script>
<script>
	const filterMinus = document.querySelector('.filterMinus')
	const filterPlus = document.querySelector('.filterPlus')
	let filterResult = document.querySelector('.filterResult')
	let personCnt = filterResult.innerText
	
	filterMinus.onclick = function(event){
			if(personCnt > 2){
				personCnt = parseInt(personCnt) - 1
				return filterResult.innerText = personCnt
			}
	}
	
	filterPlus.onclick = function(event){
			if(personCnt == '10'){
				return filterResult = personCnt
			}
			personCnt = parseInt(personCnt) + 1
			return filterResult.innerText = personCnt
	}
</script>


<script>
	const inputLeft = document.getElementById("input-left");
	const inputRight = document.getElementById("input-right");
	
	const thumbLeft = document.querySelector(".slider > .thumb.left");
	const thumbRight = document.querySelector(".slider > .thumb.right");
	const range = document.querySelector(".slider > .range");
	
	function setLeftValue() {
		let _this = inputLeft,
			min = parseInt(_this.min),
			max = parseInt(_this.max);
			
		_this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1);
	
		let percent = ((_this.value - min) / (max - min)) * 100;
	
		thumbLeft.style.left = percent + "%";
		range.style.left = percent + "%";
	}
	setLeftValue();
	
	function setRightValue() {
		let _this = inputRight,
			min = parseInt(_this.min),
			max = parseInt(_this.max);
	
		_this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 1);
	
		let percent = ((_this.value - min) / (max - min)) * 100;
	
		thumbRight.style.right = (100 - percent) + "%";
		range.style.right = (100 - percent) + "%";
	}
	setRightValue();
	
	inputLeft.addEventListener("input", setLeftValue);
	inputRight.addEventListener("input", setRightValue);
	
	inputLeft.addEventListener("mouseover", function() {
		thumbLeft.classList.add("hover");
	});
	inputLeft.addEventListener("mouseout", function() {
		thumbLeft.classList.remove("hover");
	});
	inputLeft.addEventListener("mousedown", function() {
		thumbLeft.classList.add("active");
	});
	inputLeft.addEventListener("mouseup", function() {
		thumbLeft.classList.remove("active");
	});
	
	inputRight.addEventListener("mouseover", function() {
		thumbRight.classList.add("hover");
	});
	inputRight.addEventListener("mouseout", function() {
		thumbRight.classList.remove("hover");
	});
	inputRight.addEventListener("mousedown", function() {
		thumbRight.classList.add("active");
	});
	inputRight.addEventListener("mouseup", function() {
		thumbRight.classList.remove("active");
	});
	
</script>

<script>
	const btn = document.querySelector('.filter_mapBtn')
	const cpath = '${cpath}'	
	
	btn.onclick = function() {
		const url = cpath + '/map'
		const opt = {
				method: 'GET'
		}
		
		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => console.log(json))
		
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = { 
		    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		    level: 3, // 지도의 확대 레벨
		    clickable: true
		};
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	
		//마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
		var positions = [
			{
			    content: '<div>카카오</div>', 
			    latlng: new kakao.maps.LatLng(33.450705, 126.570677)
			},
			{
			    content: '<div>생태연못</div>', 
			    latlng: new kakao.maps.LatLng(33.450936, 126.569477)
			},
			{
			    content: '<div>텃밭</div>', 
			    latlng: new kakao.maps.LatLng(33.450879, 126.569940)
			},
			{
			    content: '<div>근린공원</div>',
			    latlng: new kakao.maps.LatLng(33.451393, 126.570738)
			}
		];
	
		for (var i = 0; i < positions.length; i ++) {
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    map: map, // 마커를 표시할 지도
			    position: positions[i].latlng // 마커의 위치
			});
		
			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
			    content: positions[i].content // 인포윈도우에 표시할 내용
			});
		
			// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
			// 이벤트 리스너로는 클로저를 만들어 등록합니다 
			// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
			kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		}
	
		//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
			    infowindow.open(map, marker);
			};
		}
	
		//인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
			    infowindow.close();
			};
		}
	}
	
	
</script>

</body>
</html>