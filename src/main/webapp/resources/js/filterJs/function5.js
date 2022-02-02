	let maindate = new Date()
	let mainmonth = maindate.getMonth() 
	let mainthisMonth = maindate.getMonth() +1
	let mainnextMonthDiv = maindate.getMonth() +1
	let maintoday = maindate.getDate()
	let maintomorrow = maintoday + 1
	
	let maintime = new Date() 
	let mainyear = maintime.getFullYear() // 년도
	let mainday = maintime.getDate() // 날짜 
	let mainfirst_date = new Date(mainyear,mainmonth,1).getDate(); // 달의 첫번째 일수 (1일)
	let mainlast_date = new Date(mainyear,mainmonth,0).getDate(); // 달의 마지막 일수(달은 0부터 시작하기 때문에 표시하는게 아니면 +1 해주지 않음 )
	let mainfirst_day = new Date(mainyear,mainmonth,1).getDay() // 달의 첫번째 요일 
	
	const calendarTableOut = document.getElementById('calendarTableOut')
	const calendarTableIn = document.getElementById('calendarTableIn')
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
	const mainFilterSubmit = document.querySelector('.mainFilterSubmit')
	const mainAreaSelect = document.querySelector('.mainAreaSelect')
	
	
	
//	function test1(event) {
//		console.log(10)
//		location.href = cpath + '/product/search?'
//		console.log(20)
//	}
	
	
	
	// 2월 달 last_date가 31로 나옴(2월달만 그럼)
	if(mainmonth == 1){
		mainlast_date = 28
	}

	let mainlt = ''
	let mainrt = ''
	
	let checkIn = ''
	let checkOut = ''
		
	if(+maintomorrow > +mainlast_date){
		maintomorrow = 1
		mainnextMonthDiv = mainthisMonth + 1
	}
	
		
	if(mainlt == '' && mainrt == ''){
		todayAndTomorrowIn.innerHTML = '<div>' + mainthisMonth + '월' + '\u00A0' + maintoday + '일'+'\u00A0' +'\u00A0' + '</div>'			
		todayAndTomorrowOut.innerHTML = '<div>' + mainnextMonthDiv + '월' + '\u00A0'+ maintomorrow + '일' +'\u00A0' + '\u00A0' + '</div>'
	}
	
	calendarSubmitIn.addEventListener('click', checkIO)
	calendarSubmitIn.addEventListener('click', closeCalendarHandler2)
	calendarSubmitOut.addEventListener('click', checkIO)
	calendarSubmitOut.addEventListener('click', closeCalendarHandler)
	
	
	function checkIO(event) {
		todayAndTomorrowIn.innerHTML = '<div>' + mainlt.dataset.month + '월' + '\u00A0' +
		mainlt.dataset.day + '일' +'\u00A0' + '\u00A0' + '</div>'
		
		if(+mainlt.dataset.month <= +mainrt.dataset.month){
			todayAndTomorrowOut.innerHTML = '<div>' + mainrt.dataset.month + '월' + '\u00A0' + 
			mainrt.dataset.day + '일' +'\u00A0' + '\u00A0' + '</div>'			
		}
		else if((+mainlt.dataset.month == +mainrt.dataset.month && +lt.dataset.day >= +mainrt.dataset.day) ||
				+mainlt.dataset.month > +mainrt.dataset.month || 
				(+mainlt.dataset.month == +mainrt.dataset.month && +lt.dataset.day == +mainrt.dataset.day)){
			todayAndTomorrowOut.innerHTML = ''
		}
		
		checkIn = ('0'+mainlt.dataset.month).slice(-2) + ('0'+mainlt.dataset.day).slice(-2)
		checkOut = ('0'+mainrt.dataset.month).slice(-2) + ('0'+mainrt.dataset.day).slice(-2)
		
		if(mainlt == '' && mainrt == ''){
			checkIn = ('0'+mainthisMonth).slice(-2) + ('0' + maintoday).slice(-2)
			checkOut = ('0'+mainnextMonthDiv).slice(-2) + ('0' + maintomorrow).slice(-2)
		}
		
		console.log(checkIn)
		console.log(checkOut)
		
	}
		
	
	
	function mainFilter(event){
		const area = document.querySelectorAll('.mainArea')
		let areacode = mainAreaSelect.value


			
		if(mainlt == '' && mainrt == ''){
			checkInDay = mainthisMonth + ('0'+maintoday).slice(-2)
			checkOutDay = mainnextMonthDiv + ('0'+maintomorrow).slice(-2)
		} else {
			checkInDay = mainlt.dataset.month + mainlt.dataset.day
			checkOutDay = mainrt.dataset.month + mainrt.dataset.day 
		}

		location.href = cpath + '/product/search?areacode='+areacode + '&checkInDay=' + checkInDay + '&checkOutDay='+checkOutDay
		
	}
		
	
	
	todayCalendarIn.addEventListener('click', openCalendarHandlerIn)
	todayCalendarIn.addEventListener('click', calendarTodayHandler1)
	todayCalendarOut.addEventListener('click', openCalendarHandlerOut)
	todayCalendarOut.addEventListener('click', calendarTodayHandler2)

	function openCalendarHandlerOut(event){
		filterCalendarOut.classList.remove('calendarHidden')
		calendarYearOut.innerText = mainyear+'년'+ '\u00A0' +  (mainmonth+1) +'월'
		const tds = document.querySelectorAll('td')
	}
	
	function openCalendarHandlerIn(event){
		filterCalendarIn.classList.remove('calendarHidden')
		calendarYearIn.innerText = mainyear+'년'+ '\u00A0' +  (mainmonth+1) +'월'
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
		
		for(i = 0; i < mainfirst_day; i++){
			cell = row.insertCell()
		}
		
		for(i=1; i <= mainlast_date; i++) {
			if(mainfirst_day != 7){
				cell = row.insertCell() 		
				cell.setAttribute('class', 'calendarTd') 	
				cell.setAttribute('id', 'D'+[i]) 	
				cell.setAttribute('data-day', [i]) 	 
				cell.setAttribute('data-month', mainmonth+1) 	
				cell.addEventListener('click', dayOnclick2)
				cell.addEventListener('click', calendarTodayHandler2)
				cell.innerHTML = [i] 			
				mainfirst_day += 1 					
			}
			else{
				row = calendarTableOut.insertRow()
				cell = row.insertCell()
				cell.setAttribute('class', 'calendarTd')
				cell.setAttribute('id', 'D'+[i])
				cell.setAttribute('data-day', [i])
				cell.setAttribute('data-month', mainmonth+1)
				cell.addEventListener('click', dayOnclick2)
				cell.addEventListener('click', calendarTodayHandler2)
				cell.innerHTML = [i]
				mainfirst_day = mainfirst_day -6;
			}
		} // for end
	}
	
	// 달력 그리기
	function makeCalendarIn() {
		row = calendarTableIn.insertRow()	
		
		for(i = 0; i < mainfirst_day; i++){
			cell = row.insertCell()
		}
		
		for(i=1; i <= mainlast_date; i++) {
			if(mainfirst_day != 7){
				cell = row.insertCell() 		
				cell.setAttribute('class', 'calendarTd') 	
				cell.setAttribute('id', 'D'+[i]) 	
				cell.setAttribute('data-day', [i]) 	 
				cell.setAttribute('data-month', mainmonth+1) 	
				cell.addEventListener('click', dayOnclick1)
				cell.addEventListener('click', calendarTodayHandler1)
				cell.innerHTML = [i] 			
				mainfirst_day += 1 					
			}
			else{
				row = calendarTableIn.insertRow()
				cell = row.insertCell()
				cell.setAttribute('class', 'calendarTd')
				cell.setAttribute('id', 'D'+[i])
				cell.setAttribute('data-day', [i])
				cell.setAttribute('data-month', mainmonth+1)
				cell.addEventListener('click', dayOnclick1)
				cell.addEventListener('click', calendarTodayHandler1)
				cell.innerHTML = [i]
				mainfirst_day = mainfirst_day -6;
			}
		}
	}
	
	window.addEventListener('load',makeCalendarOut)
	window.addEventListener('load',makeCalendarIn)
	
	function calendarTodayHandler1(){
		console.log(11)
		let mainthisToday = 'D'+ maintoday
		let mainthisTomorrow = 'D' + (maintoday+1)
		for(i = 1; i <= mainlast_date; i++) {
			set_date = document.getElementById('D'+[i]) 
			if(mainmonth < mainthisMonth && mainthisToday == set_date.getAttribute('id')){
				set_date.style.color = "#FF2B5C"
			}
			
			else if (mainmonth < mainthisMonth && set_date.dataset.day < maintoday) {
				set_date.style.color = '#DEE2E6'
				set_date.style.pointerEvents = 'none'
			}
		}
	}
	
	function calendarTodayHandler2(){
		console.log(22)
		let mainthisToday2 = 'D'+ maintoday
		for(i = 1; i <= mainlast_date; i++) {
			set_date2 = document.getElementById('D'+[i]) 
			if(mainmonth < mainthisMonth && mainthisToday2 == set_date2.getAttribute('id')){
				console.log(mainmonth < mainthisMonth && mainthisToday2 == set_date2.getAttribute('id'))
				set_date2.style.color = "#FF2B5C"
			}
			else if (mainmonth < mainthisMonth && set_date2.getAttribute('data-day') < maintoday) {
				console.log(mainmonth < mainthisMonth && set_date2.dataset.day < maintoday)
//				day = set_date.dataset.day
				console.log(set_date2)
				set_date2.style.color = '#DEE2E6'
				set_date2.style.pointerEvents = 'none'
			}
		}
	}
	
	// 날짜 클릭
	function dayOnclick1(event){
		let getDate = event.target
		if(getDate != ''){
			for(let i = 1; i <= mainlast_date; i++){
				set_date = document.getElementById('D'+[i])
				set_date.style.backgroundColor = 'white'
				set_date.style.color = 'black'
			}
			getDate.style.backgroundColor = 'pink'
			getDate.style.color = 'white'
		}
		mainlt = getDate
	}
	
	// 날짜 클릭
	function dayOnclick2(event){
		let getDate2 = event.target
		console.log(getDate2)
		
		if(getDate2 != ''){
			for(let i = 1; i <= mainlast_date; i++){
				set_date2 = document.getElementById('D'+[i])
				set_date2.style.backgroundColor = 'pink'
				set_date2.style.color = 'white'
			}
			getDate2.style.backgroundColor = 'pink'
			getDate2.style.color = 'white'
		}
		mainrt = getDate2
	}
	
	
	
	
	
	calendarNextIn.addEventListener('click', nextMonthIn)
	calendarPrevIn.addEventListener('click', prevMonthIn)
	calendarPrevOut.addEventListener('click', prevMonthOut)
	calendarNextOut.addEventListener('click', nextMonthOut)
	
	// out 이전 달 
	function prevMonthOut(event){
		if(mainthisMonth > mainmonth){
			return
		}
		
		else{
			while(calendarTableOut.rows.length > 2){
				calendarTableOut.deleteRow(calendarTableOut.rows.length-1)
			}
			
			mainmonth = mainmonth - 1
			
			if(month === -1){
				mainyear = mainyear - 1
				mainmonth = mainmonth + 12
			}
			calendarYearOut.innerText = year+'년'+ '\u00A0' +  (mainmonth+1) +'월'
			
			mainfirst_date = new Date(mainyear,mainmonth,1).getDate();
			mainlast_date = new Date(mainyear,mainmonth+1,0).getDate();
			mainfirst_day = new Date(mainyear,mainmonth,1).getDay();
			
			
			makeCalendarOut()
			
			if(mainthisMonth == mainmonth+1){
				calendarTodayHandler2()
			}
		}
		
		
		if (mainlt != '' && mainrt != '') {
			if (+mainlt.dataset.month < (mainmonth+1) && (mainmonth+1) < +mainrt.dataset.month) {
				for(i = 1; i <= mainlast_date; i++) {
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			} else if (+mainlt.dataset.month == (month+1)) {
				for(i = +mainlt.dataset.day; i <= mainlast_date; i++){
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			}
		}
		
	
	}
	
	// in 이전달
	function prevMonthIn(event){
		if(mainthisMonth > mainmonth){
			return
		}
		
		else{
			while(calendarTableIn.rows.length > 2){
				calendarTableIn.deleteRow(calendarTableIn.rows.length-1)
			}
			
			mainmonth = mainmonth - 1
			
			if(mainmonth === -1){
				mainyear = mainyear - 1
				mainmonth = mainmonth + 12
			}
			calendarYearIn.innerText = year+'년'+ '\u00A0' +  (mainmonth+1) +'월'
			
			mainfirst_date = new Date(mainyear,mainmonth,1).getDate();
			mainlast_date = new Date(mainyear,mainmonth+1,0).getDate();
			mainfirst_day = new Date(mainyear,mainmonth,1).getDay();
			
			
			makeCalendarIn()
			
			if(mainthisMonth == mainmonth+1){
				calendarTodayHandler1()
			}
		}
		
		
		if (mainlt != '' && mainrt != '') {
			if (+mainlt.dataset.month < (mainmonth+1) && (mainmonth+1) < +mainrt.dataset.month) {
				for(i = 1; i <= mainlast_date; i++) {
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			} else if (+mainlt.dataset.month == (mainmonth+1)) {
				for(i = +mainlt.dataset.day; i <= mainlast_date; i++){
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			}
		}
		
	
	}
	
	
	// out 다음 달 
	function nextMonthOut(event){
		if(mainthisMonth < mainmonth){
			return
		}
		while(calendarTableOut.rows.length > 2){
			calendarTableOut.deleteRow(calendarTableOut.rows.length-1)
		};
		
		mainmonth = mainmonth +1
		
		if(mainmonth === 12){
			mainyear = mainyear + 1
			mainmonth = mainmonth - 12
		}
		
		calendarYearOut.innerText = year+'년'+ '\u00A0' +  (mainmonth+1) +'월'
		
		mainfirst_date = new Date(mainyear,mainmonth,1).getDate();
		mainlast_date = new Date(mainyear,mainmonth+1,0).getDate()
		mainfirst_day = new Date(mainyear,mainmonth,1).getDay();
		
		makeCalendarOut()
		
		
		if (mainlt != '' && mainrt != '') {
			if (+mainlt.dataset.month < (mainmonth+1) && (mainmonth+1) < +mainrt.dataset.month) {
				for(i = 1; i <= mainlast_date; i++) {
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			} else if (+mainrt.dataset.month == (mainmonth+1)) {
				for(i = mainfirst_date; i <= +rt.dataset.day; i++){
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			}
		}
	}
	
	// in 다음 달 
	function nextMonthIn(event){
		if(mainthisMonth < mainmonth){
			return
		}
		while(calendarTableIn.rows.length > 2){
			calendarTableIn.deleteRow(calendarTableIn.rows.length-1)
		};
		
		mainmonth = mainmonth +1
		
		if(mainmonth === 12){
			year = year + 1
			month = month - 12
		}
		
		calendarYearIn.innerText = year+'년'+ '\u00A0' +  (mainmonth+1) +'월'
		
		mainfirst_date = new Date(mainyear,mainmonth,1).getDate();
		mainlast_date = new Date(mainyear,mainmonth+1,0).getDate()
		mainfirst_day = new Date(mainyear,mainmonth,1).getDay();
		
		makeCalendarIn()
		
		
		if (mainlt != '' && mainrt != '') {
			if (+mainlt.dataset.month < (mainmonth+1) && (mainmonth+1) < +mainrt.dataset.mainmonth) {
				for(i = 1; i <= mainlast_date; i++) {
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			} else if (+rt.dataset.month == (mainmonth+1)) {
				for(i = mainfirst_date; i <= +mainrt.dataset.day; i++){
					set_date = document.getElementById('D'+[i])
					set_date.style.backgroundColor = 'pink'
					set_date.style.color = 'white'
				}
			}
		}
	}