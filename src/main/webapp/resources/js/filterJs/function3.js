const filterSubmit = document.querySelector('.filterSubmit')
const filterReset = document.querySelector('.filterReset')
const label_chk = document.querySelectorAll('.label_chk')
//const label_chk = document.querySelectorAll('.label_chk')

filterSubmit.addEventListener('click', filterSearch)
filterReset. addEventListener('click', filterRest)

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
	
	
	
	if(lt == '' && rt == ''){
		let checkInDay = today
		let checkOutDay = tomorrow
		let checkInMonth = thisMonth
		let checkOutMonth = thisMonth
	}
	let checkInDay = lt.dataset.day
	let checkOutDay = rt.dataset.day
	let checkInMonth = lt.dataset.month
	let checkOutMonth = rt.dataset.month
	
	console.log(areacode)
	
	const url = cpath + '/submitSearch'
	const opt = {
		method: 'GET'
	}
	
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => console.log(json))
	
}

	