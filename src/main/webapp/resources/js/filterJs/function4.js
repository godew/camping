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
	
	// window onload가 되면 오늘 날짜 / 내일 날짜 / 박수(night) 계산하여 나타나게 함 
	window.addEventListener('load', function() {
		todayAndTomorrow.innerHTML = '<div>' + thisMonth + '.' + today + ' ~ ' + thisMonth + '.' + tomorrow + ' · ' + night + '박' + '</div>'
	})
	
	console.log((month+today) < (month+tomorrow))
	
	
	// todayCalendar 클릭시 opCalendarHandler 실행 
	todayCalendar.addEventListener('click', openCalendarHandler)
	todayCalendar.addEventListener('click', calendarTodayHandler)
	
	
	
	// Calendar Modal Open function 
	function openCalendarHandler(event){
		filterCalendar.classList.remove('calendarHidden')
		calendarYear.innerText = year+'년'+ '\u00A0' +  (month+1) +'월'
	}
	
	
	// Calendar Modal Close function
	function closeCalendarHandler(event) {
		console.log(1)
		filterCalendar.classList.add('calendarHidden')
		
	}
	
	// calendar make function 
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
				cell.setAttribute('class', 'calendarTd') 	
				cell.setAttribute('id', 'D'+[i]) 	
				cell.setAttribute('data-day', [i]) 	 
				cell.setAttribute('data-month', month+1) 	
				cell.addEventListener('click', dayOnclick)
				cell.innerHTML = [i] 			// 추가된 셀에 i값 입력 
				first_day += 1 					// 요일 값이 하루 추가된 걸 for문에서 알려 줌 
			}
			else{
				// 첫 줄의 first_day 값이 7이되면 작동 
				row = calendarTable.insertRow()
				cell = row.insertCell()
				cell.setAttribute('class', 'calendarTd')
				cell.setAttribute('id', 'D'+[i])
				cell.setAttribute('data-day', [i])
				cell.setAttribute('data-month', month+1)
				cell.addEventListener('click', dayOnclick)
				cell.innerHTML = [i]
				first_day = first_day -6;
			}
		} // for end
		
		
	}
	
	
	
	window.addEventListener('load',makeCalendar)
	
	

	
	// 오늘 날짜 style function 
	function calendarTodayHandler(){
		thisToday = 'D'+day
		thisTomorrow = 'D'+ (day+1)

		for(i = 1; i <= last_date; i++){
			set_date = document.getElementById('D'+[i])
			
			
			if(thisToday === set_date.getAttribute('id')){
				set_date.style.backgroundColor = "#FF2B5C"
				set_date.style.color = 'white'
			}
			
			else if( thisTomorrow === set_date.getAttribute('id')){
				set_date.style.backgroundColor = "#FF2B5C"
				set_date.style.color = 'white'
			}
			
			else if(i < today){
				set_date.style.color = '#00000061'
			}
			
		}
	}
	
	// 날짜를 클릭하면 배경색 바뀌는 함수
	function dayOnclick(event){
		let dayTd = event.target
		console.log(dayTd)
		thisToday = 'D'+day
		thisTomorrow = 'D'+ (day+1)

		for(i = 1; i <= last_date; i++){
			set_date = document.getElementById('D'+[i])
			
			if(thisToday == set_date.getAttribute('id')){
				set_date.style.backgroundColor = 'white'
				set_date.style.color = 'black'
			}
			else if( thisTomorrow == set_date.getAttribute('id')){
				set_date.style.backgroundColor = 'white'
				set_date.style.color = 'black'
			}
		}
		console.log(dayTd.dataset.month)
		if(dayTd.dataset.month >= month && dayTd.dataset.day >= today){
			dayTd.style.backgroundColor = '#FF2B5C'
			dayTd.style.color = 'white'
		}
		
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
				dayOnclick(event)
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
	}