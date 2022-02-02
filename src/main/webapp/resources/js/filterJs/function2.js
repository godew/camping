
const inDisplay = document.querySelector('.inDisplay')



function getDom(json) {
	let dom = ''
	json.forEach(dto => {
		dom += '<div class="displayWrap" data-id="' + dto.itemid +  '">'
		dom += 		'<div><a href=""><img class="displayImg" src="' + dto.itemimage + '"></a></div>'
		dom += 		'<div class="displayText">'
		dom += 				'<strong>'+ dto.itemname + '</strong><br>'
		dom += 				'<span> 별 점 </span>'
		dom += 				'<span>' + dto.distance + '</span>'
		dom += 			'<div class="displayDetail">'
		dom += 				'<span>' + dto.locale + '</span>'
		dom += 				'<span class="displayPrice">'+ dto.itemprice + '원</span>'
		dom += 			'</div>'
		dom += 		'</div>'
		dom += '</div>'
	})
	return dom
}


function getUnderPriceDom(json) {
	let dom = ''
	dom += '<div><h3>5만원 미만<h3></div>' 
	json.forEach(dto => {  
		if(+dto.itemprice < 50000){
			dom += '<div class="displayWrap" data-id="' + dto.itemid +  '">'
			dom += 		'<div><a href=""><img class="displayImg" src="' + dto.itemimage + '"></a></div>'
			dom += 		'<div class="displayText">'
			dom += 				'<strong>'+ dto.itemname + '</strong><br>'
			dom += 				'<span> 별 점 </span>'
			dom += 				'<span>' + dto.distance + '</span>'
			dom += 			'<div class="displayDetail">'
			dom += 				'<span>' + dto.locale + '</span>'
			dom += 				'<span class="displayPrice">'+ dto.itemprice + '원</span>'
			dom += 			'</div>'
			dom += 		'</div>'
			dom += '</div>'
		}
		
	})
	
	dom += '<div><h3>5~10만원<h3></div>' 
	json.forEach(dto => {
		if(50000 <= +dto.itemprice && +dto.itemprice < 100000) {
		dom += '<div class="displayWrap" data-id="' + dto.itemid +  '">'
		dom += 		'<div><a href=""><img class="displayImg" src="' + dto.itemimage + '"></a></div>'
		dom += 		'<div class="displayText">'
		dom += 				'<strong>'+ dto.itemname + '</strong><br>'
		dom += 				'<span> 별 점 </span>'
		dom += 				'<span>' + dto.distance + '</span>'
		dom += 			'<div class="displayDetail">'
		dom += 				'<span>' + dto.locale + '</span>'
		dom += 				'<span class="displayPrice">'+ dto.itemprice + '원</span>'
		dom += 			'</div>'
		dom += 		'</div>'
		dom += '</div>'
		}
	})
	
	dom += '<div><h3>10~20만원<h3></div>'
	json.forEach(dto => {
		if(100000 <= +dto.itemprice && +dto.itemprice < 200000) {
		dom += '<div class="displayWrap" data-id="' + dto.itemid +  '">'
		dom += 		'<div><a href=""><img class="displayImg" src="' + dto.itemimage + '"></a></div>'
		dom += 		'<div class="displayText">'
		dom += 				'<strong>'+ dto.itemname + '</strong><br>'
		dom += 				'<span> 별 점 </span>'
		dom += 				'<span>' + dto.distance + '</span>'
		dom += 			'<div class="displayDetail">'
		dom += 				'<span>' + dto.locale + '</span>'
		dom += 				'<span class="displayPrice">'+ dto.itemprice + '원</span>'
		dom += 			'</div>'
		dom += 		'</div>'
		dom += '</div>'
		}
	})
	
	dom += '<div><h3>20~30만원<h3></div>'
	json.forEach(dto => {
		if(200000 <= +dto.itemprice && +dto.itemprice < 300000) {
		dom += '<div class="displayWrap" data-id="' + dto.itemid +  '">'
		dom += 		'<div><a href=""><img class="displayImg" src="' + dto.itemimage + '"></a></div>'
		dom += 		'<div class="displayText">'
		dom += 				'<strong>'+ dto.itemname + '</strong><br>'
		dom += 				'<span> 별 점 </span>'
		dom += 				'<span>' + dto.distance + '</span>'
		dom += 			'<div class="displayDetail">'
		dom += 				'<span>' + dto.locale + '</span>'
		dom += 				'<span class="displayPrice">'+ dto.itemprice + '원</span>'
		dom += 			'</div>'
		dom += 		'</div>'
		dom += '</div>'
		}
	})
	
	
	dom += '<div><h3>30만원 이상<h3></div>'
	json.forEach(dto => {
		if(300000 <= +dto.itemprice) {
		dom += '<div class="displayWrap" data-id="' + dto.itemid +  '">'
		dom += 		'<div><a href=""><img class="displayImg" src="' + dto.itemimage + '"></a></div>'
		dom += 		'<div class="displayText">'
		dom += 				'<strong>'+ dto.itemname + '</strong><br>'
		dom += 				'<span> 별 점 </span>'
		dom += 				'<span>' + dto.distance + '</span>'
		dom += 			'<div class="displayDetail">'
		dom += 				'<span>' + dto.locale + '</span>'
		dom += 				'<span class="displayPrice">'+ dto.itemprice + '원</span>'
		dom += 			'</div>'
		dom += 		'</div>'
		dom += '</div>'
		}
	})
	return dom 
	
}



function render(inDisplay, dom){
	inDisplay.innerHTML = ''
	inDisplay.innerHTML += dom
}






const filterBtnOnClick1 = document.querySelector('.filterBtnOnClick1') // 추천 순
const filterBtnOnClick2 = document.querySelector('.filterBtnOnClick2') // 거리 순
const filterBtnOnClick3 = document.querySelector('.filterBtnOnClick3') // 낮은 가격 순 
const filterBtnOnClick4 = document.querySelector('.filterBtnOnClick4') // 높은 가격 순



window.addEventListener('load', function() {
	filterBtnOnClick1.classList.add('btnOnClick')
})

filterBtnOnClick1.addEventListener('click', btn1OC)
busan.addEventListener('click', btn1OC)
gyeonggi.addEventListener('click', btn1OC)
chungcheong.addEventListener('click', btn1OC)
jeju.addEventListener('click', btn1OC)
gangwon.addEventListener('click', btn1OC)

//window.addEventListener('load', originalSelect)

function originalSelect(){
	const url = cpath + '/select'
	const opt = {
			method: 'GET'
	}
	
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		render(inDisplay, getDom(json))
		
		const images = document.querySelectorAll('.displayWrap')
		images.forEach(image => {
			image.onclick = function() {
				const itemId = this.dataset.id
				let checkIn = ''
				let checkOut = ''
					
				const checkIn = '0'+lt
				const checkOut = '0'+rt
				location.href = cpath + '/product/detail?itemId=' + itemId + '&checkIn='+checkIn + '&checkOut='+checkOut
			}
		})
	})
}


// 추천 순
function btn1OC(event) {
	console.log('btn')
	filterBtnOnClick1.classList.add('btnOnClick')
	filterBtnOnClick2.classList.remove('btnOnClick')
	filterBtnOnClick3.classList.remove('btnOnClick')
	filterBtnOnClick4.classList.remove('btnOnClick')
	
	const area = document.querySelectorAll('.area')
	
	area.forEach(areas => {
		if(headerArea.innerHTML == areas.dataset.area){
			const url = cpath + '/selectOriginal/' + areas.dataset.areacode
			const opt = {
				method: 'GET'
			}
			
			fetch(url, opt)
			.then(resp => resp.json())
			.then(json => {
				const images = document.querySelectorAll('.displayWrap')
				images.forEach(image => {
					image.onclick = function() {
						const itemId = this.dataset.id
						const checkIn = '0'+lt
						const checkOut = '0'+rt
						location.href = cpath + '/product/detail?itemId=' + itemId + '&checkIn='+checkIn + '&checkOut='+checkOut
					}
				})
			})
		}
	})
}

filterBtnOnClick2.addEventListener('click', btn2OC)
// 거리 순
function btn2OC(event){
	filterBtnOnClick2.classList.add('btnOnClick')
	filterBtnOnClick1.classList.remove('btnOnClick')
	filterBtnOnClick3.classList.remove('btnOnClick')
	filterBtnOnClick4.classList.remove('btnOnClick')
	
	const area = document.querySelectorAll('.area')
	
	area.forEach(areas => {
		if(headerArea.innerHTML == areas.dataset.area){
//			console.log(headerArea.innerHTML == areas.dataset.area)
			const url = cpath + '/place/' + areas.dataset.areacode
			const opt = {
				method: 'GET'
			}
			
			fetch(url, opt)
			.then(resp => resp.json())
			.then(json => {
				render(inDisplay, getDom(json))
				
				const images = document.querySelectorAll('.displayWrap')
				images.forEach(image => {
					image.onclick = function() {
						const itemId = this.dataset.id
						const checkIn = '0'+lt
						const checkOut = '0'+rt
						location.href = cpath + '/product/detail?itemId=' + itemId + '&checkIn='+checkIn + '&checkOut='+checkOut
					}
				})
			})
		}
	})
}




//render(inDisplay, getDom(json))



filterBtnOnClick3.addEventListener('click', btn3OC)
// 낮은 가격 순
function btn3OC(event){
	filterBtnOnClick3.classList.add('btnOnClick')
	filterBtnOnClick1.classList.remove('btnOnClick')
	filterBtnOnClick2.classList.remove('btnOnClick')
	filterBtnOnClick4.classList.remove('btnOnClick')
	
	const area = document.querySelectorAll('.area')
	
	area.forEach(areas => {
		if(headerArea.innerHTML == areas.dataset.area){
//			console.log(headerArea.innerHTML == areas.dataset.area)
			const url = cpath + '/underPrice/' + areas.dataset.areacode
			const opt = {
				method: 'GET'
			}
			
			fetch(url, opt)
			.then(resp => resp.json())
			.then(json => {
				render(inDisplay, getDom(json))
				
				const images = document.querySelectorAll('.displayWrap')
				images.forEach(image => {
					image.onclick = function() {
						const itemId = this.dataset.id
						const checkIn = '0'+lt
						const checkOut = '0'+rt
						location.href = cpath + '/product/detail?itemId=' + itemId + '&checkIn='+checkIn + '&checkOut='+checkOut
					}
				})
			})	
		} // if end
	})
}


filterBtnOnClick4.addEventListener('click', btn4OC)
// 높은 가격 순
function btn4OC(event) {
	filterBtnOnClick4.classList.add('btnOnClick')
	filterBtnOnClick1.classList.remove('btnOnClick')
	filterBtnOnClick2.classList.remove('btnOnClick')
	filterBtnOnClick3.classList.remove('btnOnClick')
	
	const area = document.querySelectorAll('.area')
	area.forEach(areas => {
		if(headerArea.innerHTML == areas.dataset.area){
//			console.log(headerArea.innerHTML == areas.dataset.area)
			const url = cpath + '/upPrice/' + areas.dataset.areacode
			const opt = {
				method: 'GET'
			}
			
			fetch(url, opt)
			.then(resp => resp.json())
			.then(json => {
				render(inDisplay, getDom(json))
				
				const images = document.querySelectorAll('.displayWrap')
				images.forEach(image => {
					image.onclick = function() {
						const itemId = this.dataset.id
						const checkIn = '0'+lt
						const checkOut = '0'+rt
						location.href = cpath + '/product/detail?itemId=' + itemId + '&checkIn='+checkIn + '&checkOut='+checkOut
					}
				})
			})
		}
	})
}

