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
	if (event.data.charAt(0) != '{') {
		if(event.data.includes('ma-ws-send-msg-btn')) {
			document.querySelector('#userlist').innerHTML = event.data
		} else {
			wsContent.innerHTML = event.data
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
			
			const payload = {
				status : 'end',
				me : '${login.email}',
				store : wsContent.innerHTML
			}
			ws.send(JSON.stringify(payload))
		} else {
			dom = ``
			dom += `<div class="msglineL">`
			dom += `<span class="wsReceive">${JSON.parse(event.data).msg}</span>`
			dom += `</div>`
			
			const managerMsg = document.querySelector('div[data-name="' + JSON.parse(event.data).me + '"]')
			if (managerMsg.classList.contains('hidden')) {
				const user = document.querySelector('div[data-user="' + JSON.parse(event.data).me + '"]')
				user.dataset.cnt = +user.dataset.cnt + 1
				user.innerText = JSON.parse(event.data).me + ' (' + user.dataset.cnt + ')'
			}
			
			const maWsContent = document.querySelector('div[data-email="' + JSON.parse(event.data).me + '"]')
			maWsContent.innerHTML += dom
			maWsContent.scroll({top: maWsContent.scrollHeight, behavior: 'smooth'})
			
			const payload = {
				status : 'end',
				me : 'manager@naver.com',
				store : document.querySelector('#userlist').innerHTML
			}
			ws.send(JSON.stringify(payload))
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
			me : 'manager@naver.com',
			store : document.querySelector('#userlist').innerHTML
		}

		ws.send(JSON.stringify(payload))
		
		maContentWrapInput.value = ''
		maContentWrapInput.focus()
	}
}