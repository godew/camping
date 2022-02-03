const filterBtnOnClick1 = document.querySelector('.filterBtnOnClick1') // 추천 순
const filterBtnOnClick2 = document.querySelector('.filterBtnOnClick2') // 거리 순
const filterBtnOnClick3 = document.querySelector('.filterBtnOnClick3') // 낮은 가격 순 
const filterBtnOnClick4 = document.querySelector('.filterBtnOnClick4') // 높은 가격 순
const inDisplay = document.querySelector('.inDisplay')

let lt = ''
let rt = ''

if(params.get('checkInDay') != '' && params.get('checkOutDay') != ''){
	lt = params.get('checkInDay')
	rt = params.get('checkOutDay')
}
else {
	console.log(11)
}

console.log(lt)
console.log(rt)

// getDom(json)
function getDom(json) {
	let dom = ''
	json.forEach(dto => {
		dom += '<div class="displayWrap" data-id="' + dto.itemid +  '">'
		dom += 		'<div><a href=""><img class="displayImg" src="' + dto.itemimage + '"></a></div>'
		dom += 		'<div class="displayText">'
		dom += 				'<strong>'+ dto.itemname + '</strong><br>'
		dom += 			'<div class="displayDetail">'
		dom += 				'<span>' + dto.locale + '</span>'
		dom += 				'<span class="displayPrice">'+ dto.itemprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',')+'원</span>'
		dom += 			'</div>'
		dom += 		'</div>'
		dom += '</div>'
	})
	return dom
}


// render(inDisplay, dom)
function render(inDisplay, dom){
	inDisplay.innerHTML = ''
	inDisplay.innerHTML += dom
}



window.addEventListener('load', function() {
	filterBtnOnClick1.classList.add('btnOnClick')
})

filterBtnOnClick1.addEventListener('click', btn1OC)
busan.addEventListener('click', btn1OC)
gyeonggi.addEventListener('click', btn1OC)
chungcheong.addEventListener('click', btn1OC)
jeju.addEventListener('click', btn1OC)
gangwon.addEventListener('click', btn1OC)


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
				let checkIn = '0'+lt
				let checkOut = '0'+rt
	 
				location.href = cpath + '/product/detail?itemId=' + itemId + '&checkIn='+checkIn + '&checkOut='+checkOut
			}
		})
	})
}


// 추천 순
function btn1OC(event) {
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
						checkIn = '0'+lt
						checkOut = '0'+rt
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
						if(params.get('checkInDay') == lt && params.get('checkOutDay') == rt){
							checkIn = '0'+lt
							checkOut = '0' + rt
						}
						else {
							checkIn = ('0'+lt.dataset.month).slice(-2) + ('0'+lt.dataset.day).slice(-2)
							checkOut = ('0'+rt.dataset.month).slice(-2) + ('0'+rt.dataset.day).slice(-2)
						}
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
						if(params.get('checkInDay') == lt && params.get('checkOutDay') == rt){
							checkIn = '0'+lt
							checkOut = '0' + rt
						}
						else {
							checkIn = ('0'+lt.dataset.month).slice(-2) + ('0'+lt.dataset.day).slice(-2)
							checkOut = ('0'+rt.dataset.month).slice(-2) + ('0'+rt.dataset.day).slice(-2)
						}
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
			console.log(headerArea.innerHTML == areas.dataset.area)
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
						if(params.get('checkInDay') == lt && params.get('checkOutDay') == rt){
							checkIn = '0'+lt
							checkOut = '0' + rt
						}
						else {
							checkIn = ('0'+lt.dataset.month).slice(-2) + ('0'+lt.dataset.day).slice(-2)
							checkOut = ('0'+rt.dataset.month).slice(-2) + ('0'+rt.dataset.day).slice(-2)
						}
						location.href = cpath + '/product/detail?itemId=' + itemId + '&checkIn='+checkIn + '&checkOut='+checkOut
					}
				})
			})
		}
	})
}

