function payReady() {
	const url = cpath + '/ready';
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
	const url = cpath + '/cancel';
	const opt = {
			method : 'GET'
	}
	fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			console.log(json)
		})
}

function sendMailHandler(event) {
	
	const email = form.email
	const url = cpath + '/mailto/' + email.value + '/'
	const opt = {
		method : 'GET'
	}
	
	fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			sendMailMsg.innerText = json.msg
			sendMailMsg.style.color = json.status == 'OK' ? 'blue' : 'red'
			if(json.status == 'OK') {
				authMailForm.classList.remove('hidden')
				form.auth.focus()
				
				second = 300
				timer.style.color = 'blue'
				authMailMsg.innerText = ''
				timer.innerText = ''
				interval = setInterval(detimer, 1000)
			}
		})
}

function authMailHandler(event) {
	
	const auth = form.auth
	const url = cpath + '/getAuthResult/' + auth.value + '/'
	const opt = {
		method : 'GET'
	}
	fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			authMailMsg.innerText = json.msg
			if(json.status == 'OK') {
				authMailMsg.style.color = 'blue'
				clearInterval(interval)
				timer.innerText = ''
			} else {
				authMailMsg.style.color = 'red'
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
    console.log(format)
    timer.innerText = format

    if(second <= 0) {
        timer.style.color = 'red'
        clearInterval(interval)
        
   		const url = cpath + '/timeout'
		const opt = {
			method : 'GET'
		}
        
        fetch(url, opt)
    }

    second -= 1
}