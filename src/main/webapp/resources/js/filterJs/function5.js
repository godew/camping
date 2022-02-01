	let date = new Date()
	let month = date.getMonth() 
	let thisMonth = date.getMonth() +1
	let nextMonthDiv = date.getMonth() +1
	let today = date.getDate()
	let tomorrow = today + 1
	let night = tomorrow - today
	const todayAndTomorrow = document.querySelector('.todayAndTomorrow')
	const filterCalendar = document.querySelector('.filterCalendar')
	const todayCalendar = document.querySelector('.todayCalendar')
	
	const calendarTableOut = document.getElementById('calendarTableOut')
	const calendarTableIn = document.getElementById('calendarTableIn')
	const calendarPrev = document.querySelector('.calendarPrev')
	const calendarNext = document.querySelector('.calendarNext')
	let time = new Date() 
	let year = time.getFullYear() // 년도
	let day = time.getDate() // 날짜 
	let first_date = new Date(year,month,1).getDate(); // 달의 첫번째 일수 (1일)
	let last_date = new Date(year,month,0).getDate(); // 달의 마지막 일수(달은 0부터 시작하기 때문에 표시하는게 아니면 +1 해주지 않음 )
	let first_day = new Date(year,month,1).getDay() // 달의 첫번째 요일 
	const mapModal = document.querySelector('.mapModal')
	const calendarSubmit = document.querySelector('.calendarSubmit')
	const todayAndTomorrowOut = document.querySelector('.todayAndTomorrowOut')
	const todayAndTomorrowIn = document.querySelector('.todayAndTomorrowIn')
	const filterCalendarOut = document.querySelector('.filterCalendarOut')
	const todayCalendarOut = document.querySelector('.todayCalendarOut')
	const todayCalendarIn = document.querySelector('.todayCalendarIn')
	const calendarYearOut = document.querySelector('.calendarYearOut')
	const calendarYearIn = document.querySelector('.calendarYearIn')
	const calendarSubmitOut = document.querySelector('.calendarSubmitOut')
	const calendarSubmitIn = document.querySelector('.calendarSubmitIn')
	const calendarPrevOut = document.querySelector('.calendarPrevOut')
	const calendarNextOut = document.querySelector('.calendarNextOut')
	const filterCalendarIn = document.querySelector('.filterCalendarIn')
	const calendarPrevIn = document.querySelector('.calendarPrevIn')
	const calendarNextIn = document.querySelector('.calendarNextIn')
	const filterSubmit = document.querySelector('.filterSubmit')
	const mainAreaSelect = document.querySelector('.mainAreaSelect')
	console.log(filterSubmit)
	
	filterSubmit.addEventListener('click', mainFilter)
	
//	function test1(event) {
//		console.log(10)
//		location.href = cpath + '/product/search?'
//		console.log(20)
//	}
	
	
	
	// 2월 달 last_date가 31로 나옴(2월달만 그럼)
	if(month == 1){
		last_date = 28
	}
	
	let first = ''
	let second = ''
	let lt = ''
	let rt = ''
	
	let checkIn = ''
	let checkOut = ''
		
	if(+tomorrow > +last_date){
		tomorrow = 1
		nextMonthDiv = thisMonth + 1
	}
	
		
	if(lt == '' && rt == ''){
		todayAndTomorrowIn.innerHTML = '<div>' + thisMonth + '월' + '\u00A0' + today + '일'+'\u00A0' +'\u00A0' + '</div>'			
		todayAndTomorrowOut.innerHTML = '<div>' + nextMonthDiv + '월' + '\u00A0'+ tomorrow + '일' +'\u00A0' + '\u00A0' + '</div>'
	}
	
	calendarSubmitIn.addEventListener('click', checkIO)
	calendarSubmitIn.addEventListener('click', closeCalendarHandler2)
	calendarSubmitOut.addEventListener('click', checkIO)
	calendarSubmitOut.addEventListener('click', closeCalendarHandler)
	
	
	function checkIO(event) {
		todayAndTomorrowIn.innerHTML = '<div>' + lt.dataset.month + '월' + '\u00A0' + lt.dataset.day + '일' +'\u00A0' + '\u00A0' + '</div>'
		
		if(+lt.dataset.month <= +rt.dataset.month){
			todayAndTomorrowOut.innerHTML = '<div>' + rt.dataset.month + '월' + '\u00A0' + rt.dataset.day + '일' +'\u00A0' + '\u00A0' + '</div>'			
		}
		else if((+lt.dataset.month == +rt.dataset.month && +lt.dataset.day >= rt.dataset.day) ||
				+lt.dataset.month > rt.dataset.month || 
				(+lt.dataset.month == +rt.dataset.month && +lt.dataset.day == +rt.dataset.day)){
			todayAndTomorrowOut.innerHTML = ''
		}
		
		checkIn = ('0'+lt.dataset.month).slice(-2) + ('0'+lt.dataset.day).slice(-2)
		checkOut = ('0'+rt.dataset.month).slice(-2) + ('0'+rt.dataset.day).slice(-2)
		
		if(lt == '' && rt == ''){
			checkIn = ('0'+thisMonth).slice(-2) + ('0' + today).slice(-2)
			checkOut = ('0'+nextMonthDiv).slice(-2) + ('0' + tomorrow).slice(-2)
		}
		
		console.log(checkIn)
		console.log(checkOut)
		
	}
		
	
	
	function mainFilter(event){
		const area = document.querySelectorAll('.mainArea')
		let areacode = mainAreaSelect.value


			
		if(lt == '' && rt == ''){
			checkInDay = thisMonth + ('0'+today).slice(-2)
			checkOutDay = nextMonthDiv + ('0'+tomorrow).slice(-2)
		} else {
			checkInDay = lt.dataset.month + lt.dataset.day
			checkOutDay = rt.dataset.month + rt.dataset.day 
		}
		
		console.log(checkInDay)
		console.log(checkOutDay)

		console.log(areacode)

		location.href = cpath + '/product/search?areacode='+areacode + '&checkInDay=' + checkInDay + '&checkOutDay='+checkOutDay
		
	}
		
	
	
	todayCalendarIn.addEventListener('click', openCalendarHandlerIn)
	todayCalendarIn.addEventListener('click', calendarTodayHandler)
	todayCalendarOut.addEventListener('click', openCalendarHandlerOut)
	todayCalendarOut.addEventListener('click', calendarTodayHandler)

	function openCalendarHandlerOut(event){
		console.log(1)
		filterCalendarOut.classList.remove('calendarHidden')
		calendarYearOut.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
		const tds = document.querySelectorAll('td')
	}
	
	function openCalendarHandlerIn(event){
		console.log(1)
		filterCalendarIn.classList.remove('calendarHidden')
		calendarYearIn.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
		const tds = document.querySelectorAll('td')
	}
	
	
	function closeCalendarHandler(event) {
		filterCalendarOut.classList.add('calendarHidden')
	}
	
	function closeCalendarHandler2(event) {
		filterCalendarIn.classList.add('calendarHidden')
	}
	
	// 달력그리기
	function makeCalendarOut() {
		row = calendarTableOut.insertRow()	
		
		for(i = 0; i < first_day; i++){
			cell = row.insertCell()
		}
		
		for(i=1; i <= last_date; i++) {
			if(first_day != 7){
				cell = row.insertCell() 		
				cell.setAttribute('class', 'calendarTd') 	
				cell.setAttribute('id', 'D'+[i]) 	
				cell.setAttribute('data-day', [i]) 	 
				cell.setAttribute('data-month', month+1) 	
				cell.addEventListener('click', dayOnclick2)
				cell.addEventListener('click', calendarTodayHandler)
				cell.innerHTML = [i] 			
				first_day += 1 					
			}
			else{
				row = calendarTableOut.insertRow()
				cell = row.insertCell()
				cell.setAttribute('class', 'calendarTd')
				cell.setAttribute('id', 'D'+[i])
				cell.setAttribute('data-day', [i])
				cell.setAttribute('data-month', month+1)
				cell.addEventListener('click', dayOnclick2)
				cell.addEventListener('click', calendarTodayHandler)
				cell.innerHTML = [i]
				first_day = first_day -6;
			}
		} // for end
	}
	
	function makeCalendarIn() {
		row = calendarTableIn.insertRow()	
		
		for(i = 0; i < first_day; i++){
			cell = row.insertCell()
		}
		
		for(i=1; i <= last_date; i++) {
			if(first_day != 7){
				cell = row.insertCell() 		
				cell.setAttribute('class', 'calendarTd') 	
				cell.setAttribute('id', 'D'+[i]) 	
				cell.setAttribute('data-day', [i]) 	 
				cell.setAttribute('data-month', month+1) 	
				cell.addEventListener('click', dayOnclick1)
				cell.addEventListener('click', calendarTodayHandler)
				cell.innerHTML = [i] 			
				first_day += 1 					
			}
			else{
				row = calendarTableIn.insertRow()
				cell = row.insertCell()
				cell.setAttribute('class', 'calendarTd')
				cell.setAttribute('id', 'D'+[i])
				cell.setAttribute('data-day', [i])
				cell.setAttribute('data-month', month+1)
				cell.addEventListener('click', dayOnclick1)
				cell.addEventListener('click', calendarTodayHandler)
				cell.innerHTML = [i]
				first_day = first_day -6;
			}
		} // for end
		
		
	}
	
	window.addEventListener('load',makeCalendarOut)
	window.addEventListener('load',makeCalendarIn)
	
	function calendarTodayHandler(){
		let thisToday = 'D'+ today
		let thisTomorrow = 'D' + (today+1)
		for(i = 1; i <= last_date; i++) {
			set_date = document.getElementById('D'+[i]) 
			if(month < thisMonth && thisToday == set_date.getAttribute('id')){
				set_date.style.color = "#FF2B5C"
			}
			
			else if (month < thisMonth && set_date.dataset.day < today) {
				set_date.style.color = '#DEE2E6'
				set_date.style.pointerEvents = 'none'
			}
		}
	}
	
	// 날짜 클릭
	function dayOnclick1(event){
		console.log('d1' + event.target)
		let getDate = event.target
		
		if(getDate != ''){
			for(let i = 1; i <= last_date; i++){
				set_date = document.getElementById('D'+[i])
				set_date.style.backgroundColor = 'white'
				set_date.style.color = 'black'
			}
			getDate.style.backgroundColor = 'pink'
			getDate.style.color = 'white'
		}
		lt = getDate
	}
	
	// 날짜 클릭
	function dayOnclick2(event){
		let getDate2 = event.target
		console.log(getDate2)
		console.log(last_date)
		if(getDate2 != ''){
			for(let i = 1; i <= last_date; i++){
				set_date2 = document.getElementById('D'+[i])
				set_date2.style.backgroundColor = 'white'
				set_date2.style.color = 'black'
			}

			getDate2.style.backgroundColor = 'pink'
			getDate2.style.color = 'white'				

		}
		rt = getDate2
	}
	
	
	
	
	
	calendarNextIn.addEventListener('click', nextMonthIn)
	calendarPrevIn.addEventListener('click', prevMonthIn)
	calendarPrevOut.addEventListener('click', prevMonthOut)
	calendarNextOut.addEventListener('click', nextMonthOut)
	
	// out 이전 달 
	function prevMonthOut(event){
		if(thisMonth > month){
			return
		}
		
		else{
			while(calendarTableOut.rows.length > 2){
				calendarTableOut.deleteRow(calendarTableOut.rows.length-1)
			}
			
			month = month - 1
			
			if(month === -1){
				year = year - 1
				month = month + 12
			}
			calendarYearOut.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
			
			first_date = new Date(year,month,1).getDate();
			last_date = new Date(year,month+1,0).getDate();
			first_day = new Date(year,month,1).getDay();
			
			
			makeCalendarOut()
			
			if(thisMonth == month+1){
				calendarTodayHandler()
			}
		}
		
		
		if (lt != '' && rt != '') {
			if (+lt.dataset.month < (month+1) && (month+1) < +rt.dataset.month) {
				for(i = 1; i <= last_date; i++) {
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			} else if (+lt.dataset.month == (month+1)) {
				for(i = +lt.dataset.day; i <= last_date; i++){
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			}
		}
		
	
	}
	
	// in 이전달
	function prevMonthIn(event){
		if(thisMonth > month){
			return
		}
		
		else{
			while(calendarTableIn.rows.length > 2){
				calendarTableIn.deleteRow(calendarTableIn.rows.length-1)
			}
			
			month = month - 1
			
			if(month === -1){
				year = year - 1
				month = month + 12
			}
			calendarYearIn.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
			
			first_date = new Date(year,month,1).getDate();
			last_date = new Date(year,month+1,0).getDate();
			first_day = new Date(year,month,1).getDay();
			
			
			makeCalendarIn()
			
			if(thisMonth == month+1){
				calendarTodayHandler()
			}
		}
		
		
		if (lt != '' && rt != '') {
			if (+lt.dataset.month < (month+1) && (month+1) < +rt.dataset.month) {
				for(i = 1; i <= last_date; i++) {
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			} else if (+lt.dataset.month == (month+1)) {
				for(i = +lt.dataset.day; i <= last_date; i++){
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			}
		}
		
	
	}
	
	
	// out 다음 달 
	function nextMonthOut(event){
		if(thisMonth < month){
			return
		}
		while(calendarTableOut.rows.length > 2){
			calendarTableOut.deleteRow(calendarTableOut.rows.length-1)
		};
		
		month = month +1
		
		if(month === 12){
			year = year + 1
			month = month - 12
		}
		
		calendarYearOut.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
		
		first_date = new Date(year,month,1).getDate();
		last_date = new Date(year,month+1,0).getDate()
		first_day = new Date(year,month,1).getDay();
		
		makeCalendarOut()
		
		
		if (lt != '' && rt != '') {
			if (+lt.dataset.month < (month+1) && (month+1) < +rt.dataset.month) {
				for(i = 1; i <= last_date; i++) {
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			} else if (+rt.dataset.month == (month+1)) {
				for(i = first_date; i <= +rt.dataset.day; i++){
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			}
		}
	}
	
	// in 다음 달 
	function nextMonthIn(event){
		if(thisMonth < month){
			return
		}
		while(calendarTableIn.rows.length > 2){
			calendarTableIn.deleteRow(calendarTableIn.rows.length-1)
		};
		
		month = month +1
		
		if(month === 12){
			year = year + 1
			month = month - 12
		}
		
		calendarYearIn.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
		
		first_date = new Date(year,month,1).getDate();
		last_date = new Date(year,month+1,0).getDate()
		first_day = new Date(year,month,1).getDay();
		
		makeCalendarIn()
		
		
		if (lt != '' && rt != '') {
			if (+lt.dataset.month < (month+1) && (month+1) < +rt.dataset.month) {
				for(i = 1; i <= last_date; i++) {
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			} else if (+rt.dataset.month == (month+1)) {
				for(i = first_date; i <= +rt.dataset.day; i++){
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			}
		}
	}