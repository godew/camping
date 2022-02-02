const filterSubmit = document.querySelector('.filterSubmit')
const filterReset = document.querySelector('.filterReset')
const label_chk = document.querySelectorAll('.label_chk')
//const label_chk = document.querySelectorAll('.label_chk')

filterSubmit.addEventListener('click', filterSearch)
filterReset. addEventListener('click', filterRest)


function getDom1(json) {
	console.log(json)
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
			dom += 				'<span class="displayPrice">'+ dto.itemprice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',') + '원</span>'
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

function filterRest(event){
	console.log(event.target)
	
}

function filterSearch(event){
	const area = document.querySelectorAll('.area')
	let areacode = ''
		
	area.forEach(areas => {
		if(headerArea.innerHTML == areas.dataset.area){
			areacode = areas.dataset.areacode
		}
	})
	
	let people = +filterResult.innerHTML
	
	let checkLabel = ''
	label_chk.forEach(e => {
		if(e.checked == true){
			checkLabel += e.value + '\u00A0'
		}
	})
	
	let minPrice = +inputLeft.value + '0000'
	let maxPrice = +inputRight.value + '0000'
	
	let checkInDay = lt
	let checkOutDay = rt
	
	console.log(checkInDay)
	console.log(checkOutDay)


	
	console.log(areacode)
	
	const url = cpath + '/submitSearch?areacode='+areacode+'&people='+people+'&checkInDay='+ checkInDay + '&checkOutDay='+checkOutDay 
	+ '&minPrice='+minPrice+'&maxPrice='+ maxPrice +'&checkLabel='+checkLabel
	console.log(url)
	const opt = {
		method: 'GET'
	}
	
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => {
		console.log(json) // 필터 잘 되었는지 확인용 콘솔
		render(inDisplay, getDom1(json))
		
		const images = document.querySelectorAll('.displayWrap')
		images.forEach(image => {
			image.onclick = function() {
				console.log(1)
				const itemId = this.dataset.id
				
				const checkIn = '0'+lt
				const checkOut = '0'+rt
				location.href = cpath + '/product/detail?itemId=' + itemId + '&checkIn='+checkIn + '&checkOut='+checkOut
			}
		})
	
	
	})
}






	