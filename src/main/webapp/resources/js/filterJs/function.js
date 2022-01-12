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
				return
			}
			personCnt = parseInt(personCnt) + 1
			return filterResult.innerText = personCnt
	}
	
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
	
	
	// 카카오 API
	
	var imageSrc = "https://image.goodchoice.kr/images/web_v3/ico_map_2.png"
    var imageSize = new kakao.maps.Size(24, 35)
    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)
	
    var clickImageSrc = "https://image.goodchoice.kr/images/web_v3/ico_map_3.png"
	var clickImageSize = new kakao.maps.Size(24,35)
	var clickMarkerImage = new kakao.maps.MarkerImage(clickImageSrc, clickImageSize) 
	
	
	function clickBtn() {
		const url = cpath + '/map'
		const opt = {
				method: 'GET'
		}

		fetch(url, opt)
		.then(resp => resp.json())
		.then(json => position(mapContainer, json))
		
		function position(mapCotainer, json) {
			json.forEach(dto =>{
				
				const marker = new kakao.maps.Marker({
				    map: map,
				    position: new kakao.maps.LatLng(dto.latitude, dto.longitude), // 마커의 위치
				    content: dto.itemname,
				    image : markerImage,
				    clickable: true
				})
				 
			 	 var infowindow = new kakao.maps.InfoWindow({
			         content: dto.itemname, // 윈도우에 표시할 내용
			         clickable: true
			     })
					
				selectedMarker = null
				selectedInfo = null
				
				marker.markerImage = markerImage
				
				kakao.maps.event.addListener(marker, 'click', function() {					
				        if (!selectedMarker || selectedMarker !== marker) {
				        	infowindow.open(map, marker)
				            !!selectedMarker && selectedMarker.setImage(selectedMarker.markerImage)
				            marker.setImage(clickMarkerImage)
				            
				            if(selectedInfo != null && selectedInfo !== infowindow) {
				            	selectedInfo.close()
				            }
				        }
				        selectedInfo = infowindow
				        selectedMarker = marker
				})
				
			})
		}

		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
		mapOption = { 
		    center: new kakao.maps.LatLng(35.257917038415, 129.23512589487), // 지도의 중심좌표
		    level: 10, 
		    clickable: true
		};
	
		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	}
	