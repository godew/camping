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
	let time = new Date() 
	let year = time.getFullYear() // 년도
	let day = time.getDate() // 날짜 
	let first_date = new Date(year,month,1).getDate(); // 달의 첫번째 일수 (1일)
	let last_date = new Date(year,month,0).getDate(); // 달의 마지막 일수(달은 0부터 시작하기 때문에 표시하는게 아니면 +1 해주지 않음 )
	let first_day = new Date(year,month,1).getDay() // 달의 첫번째 요일 
	
	
	
	
	window.addEventListener('load', function() {
		todayAndTomorrow.innerHTML = '<div>' + thisMonth + '.' + today + ' ~ ' + thisMonth + '.' + tomorrow + ' · ' + night + '박' + '</div>'
	})
	
	todayCalendar.onclick = openCalendarHandler
	
	function openCalendarHandler(event){
		filterCalendar.classList.remove('calendarHidden')
		calendarYear.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
	}
	
	
	
	
	todayCalendar.addEventListener('click', openCalendarHandler)
	
	
	console.log(first_day)
	
	

	
	function makeCalendar() {
		
		row = calendarTable.insertRow()	
		// calendarTable에 행을 추가 해 줌
		// 변수면 row 지정해 주는 이유 : 후에 cell이 추가될 자리를 알려주기 위해
		
		for(i = 0; i < first_day; i++){
			// first_day에 해당하는 요일까지 열을 만든다
			// 요일은 0부터 시작하기 때문에 i값도 0에서 시작한다
			cell = row.insertCell()
		}
		
		for(i=1; i <= last_date; i++) {
		// 날짜는 1일부터 시작하므로 i는 1
			if(first_day != 7){ // first_day(일~토 0~6) 일주일은 7일이니까 7 이상은 찍히지 않도록 함 
				cell = row.insertCell() 		// 셀추가
				cell.setAttribute('id', 'D'+[i]) 	// 모든 셀에 id를 부여 함 
				cell.innerHTML = [i] 			// 추가된 셀에 i값 입력 
				first_day += 1 					// 요일 값이 하루 추가된 걸 for문에서 알려 줌 
			}
			else{
				// 첫 줄의 first_day 값이 7이되면 작동 
				row = calendarTable.insertRow()
				cell = row.insertCell()
				cell.setAttribute('id', 'D'+[i])
				cell.innerHTML = [i]
				first_day = first_day -6;
			}
		} // for end
	}
	
	makeCalendar()
	calenderTodayHandler()
	
	function calenderTodayHandler(){
		thisToday = 'D'+day
		thisTomorrow = 'D'+ (day+1)
		console.log(thisTomorrow)
		for(i = 1; i <= last_date; i++){
			set_date = document.getElementById('D'+[i])

			if(thisToday === set_date.getAttribute('id')){
				set_date.style.backgroundColor = "#FF2B5C"
				set_date.style.color = 'white'
			}
			
			else if(thisTomorrow === set_date.getAttribute('id')){
				set_date.style.backgroundColor = "#FF2B5C"
				set_date.style.color = 'white'
			}
			
			else if(i < today){
				set_date.style.color = 'grey'
			}
		}		
	}
	console.log(calendarNext)
	calendarNext.addEventListener('click', nextMonth)
	calendarPrev.addEventListener('click', prevMonth)
	
	
	function prevMonth(event){
		while(calendarTable.rows.length > 2){
			calendarTable.deleteRow(calendarTable.rows.length-1)
		}
		
		month = month - 1
		console.log(month)
		
		if(month === -1){
			year = year - 1
			month = month + 12
		}
		
		
		
		
		calendarYear.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
		
		first_date = new Date(year,month,1).getDate();
		last_date = new Date(year,month+1,0).getDate();
		first_day = new Date(year,month,1).getDay();
		
		
		makeCalendar()
	}
	
	function nextMonth(event){
		console.log(1)
		while(calendarTable.rows.length > 2){
			calendarTable.deleteRow(calendarTable.rows.length-1)
		}
		
		month = month +1
		
		if(month === 12){
			year = year + 1
			month = month - 12
		}
		
		calendarYear.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
		
		first_date = new Date(year,month,1).getDate();
		last_date = new Date(year,month+1,0).getDate();
		first_day = new Date(year,month,1).getDay();
		
		
		makeCalendar()
	}