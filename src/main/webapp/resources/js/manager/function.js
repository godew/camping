async function drawPieChart() {
	 const url = cpath + '/userNumber'
	 const json = await fetch(url).then(resp => resp.json())
	 	
	 let data = new google.visualization.DataTable()
	 
     data.addColumn('string', 'kind')
     data.addColumn('number', 'number of user')
     data.addRows([
       ['회원', +json.user],
       ['비회원', +json.notuser]
     ])

     let options = {'title':'결제 회원 / 비회원 비율',
                    'slices': {0: {color: 'red'}, 1:{color: 'rgb(66, 133, 244)'}},
                    'width':500,
                    'height':400}

    let chart = new google.visualization.PieChart(document.querySelector('.piechart'))

    chart.draw(data, options)
}

async function drawLineChart() {

    var data = new google.visualization.DataTable()
    data.addColumn('string', 'Day')
    data.addColumn('number', '비회원')
    data.addColumn('number', '회원')
    data.addColumn('number', '전체')
	
	for (let i = 6; i >= 0; i--) {
		
		const today = new Date()
		today.setTime(today.getTime() - (i*24*60*60*1000))
		const month = ('0' + (today.getMonth() + 1)).slice(-2)
		const day = ('0' + today.getDate()).slice(-2)
		const url = cpath + '/userTotal?month=' + month + '&day=' + day
		const json = await fetch(url).then(resp => resp.json())
		rows.push([month+'/'+day, +json.notuser, +json.user, +json.notuser + +json.user])
	}
	
    data.addRows(rows)

    var options = {
    	'title' : '일주일 판매 현황(회원, 비회원, 전체)',
    	'width' : 930,
    	'height' : 400
    }

    var chart = new google.visualization.LineChart(document.querySelector('.chart'));
    chart.draw(data, options);
}

async function lineChart() {

    var data = new google.visualization.DataTable()
    data.addColumn('string', 'Day')
    data.addColumn('number', '비회원')
    data.addColumn('number', '회원')
    data.addColumn('number', '전체')
	
    data.addRows(rows)

    var options = {
    	'title' : '일주일 판매 현황(회원, 비회원, 전체)',
    	'width' : 930,
    	'height' : 400
    }

    var chart = new google.visualization.LineChart(document.querySelector('.chart'));
    chart.draw(data, options);
}

function columnChart() {

    var data = new google.visualization.DataTable()
    data.addColumn('string', 'Day')
    data.addColumn('number', '비회원')
    data.addColumn('number', '회원')
    data.addColumn('number', '전체')
	
    data.addRows(rows)

    var options = {
    	'title' : '일주일 판매 현황(회원, 비회원, 전체)',
    	'width' : 930,
    	'height' : 400
    }

    var chart = new google.visualization.ColumnChart(document.querySelector('.chart'));
    chart.draw(data, options);
}

function onMessage(event) {
	if (event.data.length == 1) {
		dom = ``
		dom += `<div class="msglineN">`
		dom += `<span class="wsReceiveN"><관리자가 부재중 입니다></span>`
		dom += `</div>`

		wsContent.innerHTML += dom
		wsContent.scroll({top: wsContent.scrollHeight, behavior: 'smooth'})
		return
	}
	
	if (event.data.charAt(0) != '{') { // json type의 데이터가 아니면
		if(event.data.includes('ma-ws-send-msg-btn')) {
			if (document.querySelector('#userlist') != null) {
				if (event.data.charAt(0) == 'm') { // name
					const users = document.querySelectorAll('.user')
					for (let i = 0; i < users.length; i++) {
						if (event.data.includes(users[i].dataset.user)) {
							users[i].outerHTML = event.data.split("/:/")[1]
							break
						}
					}
				} else { // content html
					const managerMsgs = document.querySelectorAll('.manager-msg')
					for (let i = 0; i < managerMsgs.length; i++) {
						if (event.data.includes(managerMsgs[i].dataset.name)) {
							managerMsgs[i].outerHTML = event.data	
							break
						}
					}
				}
			}
		} else {
			if (event.data.charAt(0) == '관') {
				bottomMsgBtn.innerText = event.data
				cnt = bottomMsgBtn.innerText.includes("(") ? +bottomMsgBtn.innerText.split("(")[1].split(")")[0] : 0
			} else {				
				wsContent.innerHTML = event.data
			}
		}
	} else {
		if (JSON.parse(event.data).target != 'manager@naver.com') {
			dom = ``
			dom += `<div class="msglineL">`
			dom += `<span class="wsReceive">${JSON.parse(event.data).msg}</span>`
			dom += `</div>`
			
			if (contentWrap.classList.contains('hidden')) {
				cnt++
				bottomMsgBtn.innerText = '관리자 1대1 대화 (' + cnt + ')'
			}
			wsContent.innerHTML += dom
			wsContent.scroll({top: wsContent.scrollHeight, behavior: 'smooth'})
		} else {
			dom = ``
			dom += `<div class="msglineL">`
			dom += `<span class="wsReceive">${JSON.parse(event.data).msg}</span>`
			dom += `</div>`
			
			const managerMsg = document.querySelector('div[data-name="' + JSON.parse(event.data).me + '"]')
			if (managerMsg != null) {
				if (managerMsg.classList.contains('hidden')) {
					const user = document.querySelector('div[data-user="' + JSON.parse(event.data).me + '"]')
					user.dataset.cnt = +user.dataset.cnt + 1
					user.innerText = JSON.parse(event.data).me + ' (' + user.dataset.cnt + ')'
				}
			} else { // manager가 다른페이지(부재중)
				const payload = {
						target : JSON.parse(event.data).me,
						no : "N"
					}
				ws.send(JSON.stringify(payload))
				return
			}
			const maWsContent = document.querySelector('div[data-email="' + JSON.parse(event.data).me + '"]')
			if (maWsContent != null) {
				maWsContent.innerHTML += dom
				maWsContent.scroll({top: maWsContent.scrollHeight, behavior: 'smooth'})
			}
		}
	}
}	

function renderWsMsg(msg) {
	dom = ``
	dom += `<div class="msgline">`
	dom += `<span class="wsSend">${msg}</span>`
	dom += `</div>`
	return dom
}

function maWsMsgBtnHandler(event) {
	const tmp = event.target.dataset.name
	const maContentWrapInput = document.querySelector('input[data-name="' + tmp + '"]')
	const maWsContent = document.querySelector('div[data-email="' + tmp + '"]')
	
	if (maContentWrapInput.value != '') {
		maWsContent.innerHTML += renderWsMsg(maContentWrapInput.value)
		maWsContent.scroll({top: maWsContent.scrollHeight, behavior: 'smooth'})
		
		const msg = maContentWrapInput.value
		const payload = {
			msg : msg,
			target : tmp,
			me : 'manager@naver.com'
		}

		ws.send(JSON.stringify(payload))
		
		maContentWrapInput.value = ''
		maContentWrapInput.focus()
	}
}

function dbClickHandler(event) {
	const tmp = event.target.dataset.user
	const managerMsg = document.querySelector('div[data-name="' + tmp + '"]')
	const maContentWrapInput = document.querySelector('input[data-name="' + tmp + '"]')
	const maWsSendMsgBtn = document.querySelector('button[data-name="' + tmp + '"]')
	const user = document.querySelector('div[data-user="' + tmp + '"]')
	
	managerMsg.classList.remove('hidden')
	user.dataset.cnt = 0
	user.innerText = tmp
	maContentWrapInput.focus()
//	maWsSendMsgBtn.onclick = maWsMsgBtnHandler
//	maContentWrapInput.onkeydown = function(event) {
//		if (event.key == 'Enter') {
//			maWsMsgBtnHandler(event)
//		}
//	}
}		

function closeClickHandler(event) {
	const tmp = event.target.dataset.close
	const managerMsg = document.querySelector('div[data-name="' + tmp + '"]')
	managerMsg.classList.add('hidden')
}

function keydownHandler(event) {
	if (event.key == 'Enter') {
		maWsMsgBtnHandler(event)
	}
}