	let date = new Date()
	let month = date.getMonth() 
	let thisMonth = date.getMonth() +1
	let today = date.getDate()
	let tomorrow = today + 1
	let night = tomorrow - today
	const todayAndTomorrow = document.querySelector('.todayAndTomorrow')
	const filterCalendar = document.querySelector('.filterCalendar')
	const todayCalendar = document.querySelector('.todayCalendar')
	const calendarYear = document.querySelector('.calendarYear')
	const calendarTable = document.getElementById('calendarTable')
	const a = document.createElement('a')
	const calendarPrev = document.querySelector('.calendarPrev')
	const calendarNext = document.querySelector('.calendarNext')
	const filterSection = document.querySelector('.filterSection')
	let time = new Date() 
	let year = time.getFullYear() // 년도
	let day = time.getDate() // 날짜 
	let first_date = new Date(year,month,1).getDate(); // 달의 첫번째 일수 (1일)
	let last_date = new Date(year,month,0).getDate(); // 달의 마지막 일수(달은 0부터 시작하기 때문에 표시하는게 아니면 +1 해주지 않음 )
	let first_day = new Date(year,month,1).getDay() // 달의 첫번째 요일 
	const mapModal = document.querySelector('.mapModal')
	const calendarSubmit = document.querySelector('.calendarSubmit')

	let first = ''
	let second = ''
	let lt = ''
	let rt = ''

	if(lt == '' && rt == ''){
		todayAndTomorrow.innerHTML = '<div>' + thisMonth + '.' + today + ' ~ ' + thisMonth + '.' + tomorrow + ' · ' + night + '박' + '</div>'			
	}
	
	calendarSubmit.addEventListener('click', checkIO)
	calendarSubmit.addEventListener('click', closeCalendarHandler)
	
	function checkIO(event) {
		let checkIn = ('0'+lt.dataset.month).slice(-2) + ('0'+lt.dataset.day).slice(-2)
		let checkOut = ('0'+rt.dataset.month).slice(-2) + ('0'+rt.dataset.day).slice(-2)
		todayAndTomorrow.innerHTML = ''
//		console.log(lt)
//		console.log(rt)
		
		if(lt.dataset.month < rt.dataset.month){
			let ltday = new Date(year, lt.dataset.month, 0).getDate()
			let nightday = ((ltday - +lt.dataset.day +1) + +rt.dataset.day) 
			todayAndTomorrow.innerHTML = '<div>' + lt.dataset.month + '.' + lt.dataset.day + ' ~ ' + rt.dataset.month + '.' + rt.dataset.day + ' · ' + nightday + '박' + '</div>'
			
		} 
		else if(lt.dataset.month == rt.dataset.month){			
//			console.log(last_date)
			todayAndTomorrow.innerHTML = '<div>' + lt.dataset.month + '.' + lt.dataset.day + ' ~ ' + rt.dataset.month + '.' + rt.dataset.day + ' · ' + (+rt.dataset.day - +lt.dataset.day) + '박' + '</div>'		
		}
		console.log(checkIn)
		console.log(checkOut)
//		location.href = cpath + '/product/search?checkIn=' + checkIn + '&checkOut=' + checkOut
		
	}
		

		
	

	todayCalendar.addEventListener('click', openCalendarHandler)
	todayCalendar.addEventListener('click', calendarTodayHandler)
	
	
	
	function openCalendarHandler(event){
		filterCalendar.classList.remove('calendarHidden')
		calendarYear.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
//		makeCalendar
		const tds = document.querySelectorAll('td')
//		for(i = 0; i <= tds.length; i++){
//			console.log(tds[i])
//		}
//		
	}
	
//	calendarSubmit.onclick = closeCalendarHandler
	
	
	
	function closeCalendarHandler(event) {
//		console.log(1)
		filterCalendar.classList.add('calendarHidden')
		
	}
	
	function makeCalendar() {
		row = calendarTable.insertRow()	
		
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
				row = calendarTable.insertRow()
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

	window.addEventListener('load',makeCalendar)
	
	function calendarTodayHandler(){
		let thisToday = 'D'+ today
		let thisTomorrow = 'D' + (today+1)
		for(i = 1; i <= last_date; i++) {
			set_date = document.getElementById('D'+[i]) 
			if(month < thisMonth && thisToday == set_date.getAttribute('id')){
				set_date.style.color = "#FF2B5C"
//				set_date.style.color = 'white'
			}
			
			else if (month < thisMonth && set_date.dataset.day < today) {
				set_date.style.color = '#DEE2E6'
				set_date.style.pointerEvents = 'none'
			}
		}
	}
	
	
	function dayOnclick1(event){
		
		if(first == ''){
			// 전체 for문돌면서 background 흰색으로 변경
			for(let i = 1; i <= last_date; i++){
				set_date = document.getElementById('D'+[i])
				set_date.style.backgroundColor = 'white'
				set_date.style.color = 'black'
			}
			event.target.style.backgroundColor = 'pink'
			event.target.style.color = 'white'
				
			first = event.target
			lt = ''
			rt = ''
		} else {
			// first, second 둘다누름
			// first < second 이면 lt 에 first 아니면 rt에 first
			// 여기서 lt와 rt를 가지고 for문 돌면서 backgound 변경
			second = event.target
			if (+first.dataset.month == +second.dataset.month) {
				if(+first.dataset.day < +second.dataset.day){
					lt = first
					rt = second
				}
				else if(first >= second){
					lt = second
					rt = first
				}
				
				for(i = +lt.dataset.day; i <= +rt.dataset.day; i++){
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			} else {
				if(+first.dataset.month < +second.dataset.month){
					lt = first
					rt = second
					
					for(i = first_date; i <= +rt.dataset.day; i++){
						set_date = document.getElementById('D'+[i])
						set_date.style.backgroundColor = 'pink'
						set_date.style.color = 'white'
					}
					
					
				} else {
					lt = second
					rt = first
					for(i = +lt.dataset.day; i <= last_date; i++){
						set_date = document.getElementById('D'+[i])
						set_date.style.backgroundColor = 'pink'
						set_date.style.color = 'white'
					}
				}
			}
			
			first = ''
			second = ''
		}		
//			else {
//				if(first_month != second_month){
//					lt = first
//					rt = second
//					console.log('넘어가는 달 first', first)
//					console.log('넘어가는 달 second', second)
//					
//					for(i = lt; i = last_date; i++){
//						set_date = document.getElementById('D'+[i])
//						set_date.style.backgroundColor = 'pink'
//						set_date.style.color = 'white'
//					}
//					
//					for(i = rt; i = first_date; i++){
//						set_date = document.getElementById('D'+[i])
//						set_date.style.backgroundColor = 'pink'
//						set_date.style.color = 'white'
//					}
//				}
//			}

			
//		console.log('first', first)
//		console.log('second', second)
//		console.log('lt', lt)
//		console.log('rt', rt)
	}
	

	
	
	
	calendarNext.addEventListener('click', nextMonth)
	calendarPrev.addEventListener('click', prevMonth)
	
	
	// 이전 달 
	function prevMonth(event){
		if(thisMonth > month){
			return
		}
		
		else{
			while(calendarTable.rows.length > 2){
				calendarTable.deleteRow(calendarTable.rows.length-1)
			}
			
			month = month - 1
			
			if(month === -1){
				year = year - 1
				month = month + 12
			}
			calendarYear.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
			
			first_date = new Date(year,month,1).getDate();
			last_date = new Date(year,month+1,0).getDate();
			first_day = new Date(year,month,1).getDay();
			
			
			makeCalendar()
			
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
	
	
	// 다음 달 
	function nextMonth(event){
		if(thisMonth < month){
			return
		}
		while(calendarTable.rows.length > 2){
			calendarTable.deleteRow(calendarTable.rows.length-1)
		};
		
		month = month +1
		
		if(month === 12){
			year = year + 1
			month = month - 12
		}
		
		calendarYear.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
		
		first_date = new Date(year,month,1).getDate();
		last_date = new Date(year,month+1,0).getDate()
		first_day = new Date(year,month,1).getDay();
		
		makeCalendar()
		
		
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