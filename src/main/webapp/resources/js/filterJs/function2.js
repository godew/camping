
const inDisplay = document.querySelector('.inDisplay')

const url = cpath + '/selectOriginal'
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
			const checkIn = ('0' + lt.dataset.month).slice(-2) + ('0' + lt.dataset.day).slice(-2)
			const checkOut = ('0' + rt.dataset.month).slice(-2) + ('0' + rt.dataset.day).slice(-2)
			location.href = cpath + '/product/detail?itemId=' + itemId + '&checkIn='+checkIn + '&checkOut='+checkOut
		}
	})
})

function getDom(json) {
	let dom = ''
	json.forEach(dto => {
		dom += '<div class="displayWrap" data-id="' + dto.itemid +  '">'
		dom += 		'<div><a href=""><img class="displayImg" src="' + dto.itemimage + '"></a></div>'
		dom += 		'<div class="displayText">'
		dom += 				'<strong>'+ dto.itemname + '</strong><br>'
		dom += 				'<span> 별 점 </span>'
		dom += 			'<div class="displayDetail">'
		dom += 				'<span>' + dto.locale + '</span>'
		dom += 				'<span class="displayPrice">'+ dto.itemprice + '원</span>'
		dom += 			'</div>'
		dom += 		'</div>'
		dom += '</div>'
	})
	return dom
}

function render(inDisplay, dom){
	inDisplay.innerHTML = ''
	inDisplay.innerHTML += dom
}




const filterBtnOnClick1 = document.querySelector('.filterBtnOnClick1')
const filterBtnOnClick2 = document.querySelector('.filterBtnOnClick2')
const filterBtnOnClick3 = document.querySelector('.filterBtnOnClick3')
const filterBtnOnClick4 = document.querySelector('.filterBtnOnClick4')

window.addEventListener('load', function() {
	filterBtnOnClick1.classList.add('btnOnClick')
})

filterBtnOnClick1.onclick = function(event){
	filterBtnOnClick1.classList.add('btnOnClick')
	filterBtnOnClick2.classList.remove('btnOnClick')
	filterBtnOnClick3.classList.remove('btnOnClick')
	filterBtnOnClick4.classList.remove('btnOnClick')
}

filterBtnOnClick2.onclick = function(event){
	filterBtnOnClick2.classList.add('btnOnClick')
	filterBtnOnClick1.classList.remove('btnOnClick')
	filterBtnOnClick3.classList.remove('btnOnClick')
	filterBtnOnClick4.classList.remove('btnOnClick')
}

filterBtnOnClick3.onclick = function(event){
	filterBtnOnClick3.classList.add('btnOnClick')
	filterBtnOnClick1.classList.remove('btnOnClick')
	filterBtnOnClick2.classList.remove('btnOnClick')
	filterBtnOnClick4.classList.remove('btnOnClick')
	
	const url = cpath + '/underPrice'
	const opt = {
			method: 'GET'
	}
	
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => render(inDisplay, getDom(json)))
}


filterBtnOnClick4.onclick = function(event){
	filterBtnOnClick4.classList.add('btnOnClick')
	filterBtnOnClick1.classList.remove('btnOnClick')
	filterBtnOnClick2.classList.remove('btnOnClick')
	filterBtnOnClick3.classList.remove('btnOnClick')
	
	const url = cpath + '/upPrice'
	const opt = {
		method: 'GET'
	}
	
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => render(inDisplay, getDom(json)))
}
