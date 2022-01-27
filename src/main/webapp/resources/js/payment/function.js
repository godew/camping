function payReady() {
	
	let orderPrice
	let changedPoint
	let url
	let pointFlag = 1
	if (login) {
		orderPrice = priceVal - +point.value
		changedPoint = pointVal - +point.value	
		if (+point.value == 0) {
			pointFlag = 0
		}
		url = cpath + '/payment/ready?itemRoomId=' + itemRoomId + '&'
							        +'memberId=' + memberId + '&'
								    +'itemName=' + itemName + '&'
								    +'checkIn=' + checkIn + '&'
								    +'checkOut=' + checkOut + '&'
								    +'orderPrice=' + orderPrice + '&'				 
								    +'pointFlag=' + pointFlag + '&'				 
								    +'point=' + changedPoint
	} else {
		orderPrice = priceVal
		url = cpath + '/payment/notReady?itemRoomId=' + itemRoomId + '&'
									   +'itemName=' + itemName + '&'
									   +'checkIn=' + checkIn + '&'
									   +'checkOut=' + checkOut + '&'
									   +'orderPrice=' + orderPrice + '&'
									   +'notPhone=' + form.phone.value + '&'
									   +'notName=' + form.name.value
	}
	
	const opt = {
			method : 'GET'
	}
	fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			const left = Math.ceil(( window.screen.width - 500 )/2)
		    const top = Math.ceil(( window.screen.height - 600 )/2)
			kakaoWindow = window.open(json.next_redirect_pc_url, 
						'_blank', 
						'width=500, height=600, left=' + left +', top=' + top)
		})
}

function sendHandler(event) {
	event.preventDefault()
	if (sendBtn.innerText == '재전송') {
		clearInterval(interval)
	}
	const phone = form.phone
	const url = cpath + '/sms/send?phone=' + phone.value
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
				phone.disabled = 'disabled'
				phoneFlag = true
				detimer()
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
				authBtn.style.pointerEvents = 'none'
				authFlag = true
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
	if (event.target == phone && event.target.value.length >= 10) {
		const regPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
		const phoneMsg = document.querySelector('.phoneMsg') 
	    if (regPhone.test(phone.value) == true) {
	    	phoneMsg.innerText = ''
			sendBtn.disabled = ''
			sendBtn.style.cursor = 'pointer'
	        sendBtn.style.backgroundColor = '#f05'
	    } else {
	    	phoneMsg.innerText = '휴대폰 번호를 확인해 주세요.'
	    }
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


