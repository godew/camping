function payReady() {
	const url = cpath + '/payment/ready';
	const opt = {
			method : 'GET'
	}
	fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json.tid)
			window.open(json.next_redirect_pc_url)
		})
}

function payCancel() {
	const url = cpath + '/payment/cancel';
	const opt = {
			method : 'GET'
	}
	fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
		})
}

function sendHandler(event) {
	event.preventDefault()
	const phone = form.phone
	const url = cpath + '/sms/send?phone=' + phone.value;
	const opt = {
			method : 'GET'
	}
	
	fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			sendMsg.innerText = json.msg
			sendMsg.style.color = json.status == 'OK' ? 'blue' : 'red'
			if(json.status == 'OK') {
				authForm.classList.remove('hidden')
				form.auth.focus()
				
				second = 300
				timer.style.color = 'blue'
				authMsg.innerText = ''
				timer.innerText = ''
				sendBtn.innerText = '재전송'
				interval = setInterval(detimer, 1000)
			}
		})
}

function authHandler(event) {
	event.preventDefault()
	const auth = form.auth
	const url = cpath + '/sms/getAuthResult/' + auth.value + '/'
	const opt = {
		method : 'GET'
	}
	fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			authMsg.innerText = json.msg
			if(json.status == 'OK') {
				authMsg.style.color = 'blue'
				clearInterval(interval)
				timer.innerText = ''
				sendBtn.disabled = 'disabled'
				sendBtn.style.backgroundColor = '#cccccc'
				sendBtn.style.cursor = 'default'
				authBtn.disabled = 'disabled'
				authBtn.style.cursor = 'default'
			} else {
				authMsg.style.color = 'red'
				auth.select()
			}
		})
}

function detimer() {
    let min = Math.floor(second / 60)
    let sec = second % 60 

    if(min < 10) min = '0' + min
    if(sec < 10) sec = '0' + sec

    const format = min + ' : ' + sec
    timer.innerText = format

    if(second <= 0) {
        timer.style.color = 'red'
        clearInterval(interval)
        
   		const url = cpath + '/sms/timeout'
		const opt = {
			method : 'GET'
		}
        
        fetch(url, opt)
    }

    second -= 1
}

// input check method
function checkNumber(event) {
	event.target.value = event.target.value.replace(/[^0-9]/g, '')
	event.target.value = event.target.value.substring(0, 11)
	if (event.target == phone && event.target.value.length >= 11) {
		sendBtn.style.backgroundColor = '#f05'
	}
	
	if (event.target == point) {
		if (priceVal < pointVal && +event.target.value > priceVal) {
			event.target.value = priceVal
		} else if (+event.target.value > pointVal) {
			event.target.value = pointVal			
		}
		
		price.innerText = (priceVal - +point.value).toLocaleString() + '원'
	}
	
	
}


