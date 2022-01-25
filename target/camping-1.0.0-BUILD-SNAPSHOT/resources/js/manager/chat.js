function onOpen(event) {
	const payload = {
		message : username + '님이 입장하였습니다.',
		status : 'alarm'
	}
	ws.send(JSON.stringify(payload))
}

function onMessage(event) {
	
	let className
	if(JSON.parse(event.data).status == 'alarm') {
		className = 'alarm'
	} else {
		if(JSON.parse(event.data).username == username) {
			className = 'self'
		} else {
			className = 'other'
		}	
	} 
	
		
	let tag = `<div class=${className}>`
	tag += `<span class="name">${JSON.parse(event.data).username}</span>` 
	tag += `<span class="message">${JSON.parse(event.data).message}</span>`
	tag += `</div>`
	textarea.innerHTML += tag
	// 메시지가 길어지면 자동으로 아래로 스크롤
	textarea.scroll({top: textarea.scrollHeight, behavior: 'smooth'})
}

function onClose(event) {

}

// handler
function keyHandler(event) {
	if(event.key == 'Enter') { 
		sendHandler(event)
	}	
}

function sendHandler(event) {
	const message = send.value
	send.value = ''
	ws.send(JSON.stringify({
		username : username,
		message : message,
		status : 'msg'
	}))
	send.focus()
}

function quitHandler(event) {
	const payload = {
			status : 'alarm',
			message : username + '님이 퇴장하였습니다.'
		}
	ws.send(JSON.stringify(payload))
	ws.close()
	location.href = cpath + '/logout'
}

function showListHandler(event) {
	const url = cpath + '/list'
	const opt = {
		method : 'GET'
	}
	fetch(url, opt)
		.then(resp => resp.json())
		.then(json => {
			let userList = document.querySelector('.userList')
			userList.innerHTML = ``
			json.forEach(user => {
				userList.innerHTML += `<div>${user}</div>`
			})
		})
		
}