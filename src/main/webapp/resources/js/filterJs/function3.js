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
	
	let checkInDay = ''
	let checkOutDay = ''
	let checkInMonth = ''
	let checkOutMonth = ''
		
	if(lt == '' && rt == ''){
		checkInDay = ('0' + thisMonth).slice(-2) + today
		checkOutDay = ('0' + thisMonth).slice(-2) + tomorrow
	} else {
		checkInDay = ('0'+lt.dataset.month).slice(-2) + lt.dataset.day
		checkOutDay = ('0'+rt.dataset.month).slice(-2) + rt.dataset.day 
	}
	
	console.log(checkInDay)
	console.log(checkOutDay)


	
	console.log(areacode)
	
	const url = cpath + '/submitSearch?areacode='+areacode+'&people='+people+'&checkInDay='+ checkInDay + '&checkOutDay='+checkOutDay 
	+ '&minPrice='+minPrice+'&maxPrice='+ maxPrice +'&checkLabel='+checkLabel
	const opt = {
		method: 'GET'
	}
	
	fetch(url, opt)
	.then(resp => resp.json())
	.then(json => console.log(json))
	
}

	