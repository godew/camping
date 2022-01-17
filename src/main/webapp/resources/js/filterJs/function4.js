	let date = new Date()
	let month = date.getMonth()+1
	let today = date.getDate()
	let tomorrow = today + 1
	let night = tomorrow - today
	const todayAndTomorrow = document.querySelector('.todayAndTomorrow')
	
	window.addEventListener('load', function() {
		todayAndTomorrow.innerHTML = '<div>' + month + '.' + today + ' ~ ' + month + '.' + tomorrow + ' · ' + night + '박' + '</div>'
	})
	