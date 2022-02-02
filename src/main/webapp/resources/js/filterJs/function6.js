var imageSrc = "https://image.goodchoice.kr/images/web_v3/ico_map_2.png"
var imageSize = new kakao.maps.Size(24, 35)
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize)

var clickImageSrc = "https://image.goodchoice.kr/images/web_v3/ico_map_3.png"
var clickImageSize = new kakao.maps.Size(24,35)
var clickMarkerImage = new kakao.maps.MarkerImage(clickImageSrc, clickImageSize) 

const mapBtn = document.querySelector('.filter_mapBtn')
const bodywrap = document.querySelector('.bodywrap')
const overlay = document.querySelector('.mapOverlay')

mapBtn.addEventListener('click', clickBtn)
mapBtn.addEventListener('click', mapOpenHandler)

function mapOpenHandler(event) {
	let mapModal = document.querySelector('.mapModal')
	mapModal.classList.remove('mapModalHidden')
	bodywrap.classList.add('not_scroll')
}

function mapCloseHandler(event) {
	let mapModal = document.querySelector('.mapModal')
	mapModal.classList.add('mapModalHidden')
	bodywrap.classList.remove('not_scroll')
}

overlay.addEventListener('click', mapCloseHandler)


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
			
			const checkIn = '0'+lt
			const checkOut = '0'+rt
			
		 	 var infowindow = new kakao.maps.InfoWindow({
		         content: '<div class="infoContent"><a href="' + cpath +'/product/detail?itemId=' + dto.itemid + '&checkIn='+ checkIn + '&checkOut='+ checkOut +'"><img class="infoItemImage" src="' + dto.itemimage + '"></a>' +
		       
		         '<div class="infoInContent"> <div class="infoItemName">' + dto.itemname + '</div>' + 
		         '<div class="infoItemPrice">' + dto.itemprice + '원</div></div></div>'
		         			, // 윈도우에 표시할 내용
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

	
	var mapContainer = document.querySelector('.map'),
	mapOption = { 
	    center: new kakao.maps.LatLng(35.17537781054425, 129.081683231146),
	    level: 6, 
	    clickable: true
	};

	var map = new kakao.maps.Map(mapContainer, mapOption);
	setTimeout(function(){ map.relayout(); }, 0);
}
	