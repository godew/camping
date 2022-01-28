const filterSubmit = document.querySelector('.filterSubmit')
const filterReset = document.querySelector('.filterReset')
const label_chk = document.querySelectorAll('.label_chk')
//const label_chk = document.querySelectorAll('.label_chk')

filterSubmit.addEventListener('click', filterSearch)
filterReset. addEventListener('click', filterRest)


function getDom(json) {
	console.log(json)
	let dom = ''
	json.forEach(dto => {
		dom += '<div class="displayWrap" data-id="' + dto[0] +  '">'
		dom += 		'<div><a href=""><img class="displayImg" src="' + dto[1] + '"></a></div>'
		dom += 		'<div class="displayText">'
		dom += 				'<strong>'+ dto[2] + '</strong><br>'
		dom += 				'<span> 별 점 </span>'
		dom += 				'<span>' + dto[3] + '</span>'
		dom += 			'<div class="displayDetail">'
		dom += 				'<span>' + dto[4] + '</span>'
		dom += 				'<span class="displayPrice">'+ dto[5] + '원</span>'
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
	
	let checkInDay = ''
	let checkOutDay = ''
	let checkInMonth = ''
	let checkOutMonth = ''
		
	if(lt == '' && rt == ''){
		checkInDay = String(thisMonth) + today
		checkOutDay = String(thisMonth) + tomorrow
	} else {
		checkInDay = lt.dataset.month + lt.dataset.day
		checkOutDay = rt.dataset.month + rt.dataset.day 
	}
	
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
		const arr = []
		for(i = 0; i < json.length; i++){
			arr.push([json[i].itemid, json[i].itemimage, json[i].itemname, json[i].distance, json[i].locale, json[i].itemprice])
		}
		console.log(arr)

		inDisplay.innerHTML = getDom(arr)
	
	})
}






	