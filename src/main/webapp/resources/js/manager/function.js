async function drawPieChart() {
	 const url = cpath + '/userNumber'
	 const opt = {
			 method : 'GET'
	 } 
	 const json = await fetch(url, opt).then(resp => resp.json())
	 	
	 let data = new google.visualization.DataTable()
	 
     data.addColumn('string', 'kind')
     data.addColumn('number', 'number of user')
     data.addRows([
       ['회원', +json.user],
       ['비회원', +json.notuser]
     ])

     let options = {'title':'회원 / 비회원 비율',
                    'slices': {0: {color: 'red'}, 1:{color: 'rgb(66, 133, 244)'}},
                    'width':500,
                    'height':400}

    let chart = new google.visualization.PieChart(document.querySelector('.piechart'))

    chart.draw(data, options)
}

async function drawLineChart() {
	const opt = {
			method : 'GET'
	} 

    var data = new google.visualization.DataTable()
    data.addColumn('number', 'Day')
    data.addColumn('number', '비회원')
    data.addColumn('number', '회원')
    data.addColumn('number', '전체')

    let rows = []
	
	for (let i = 6; i >= 0; i--) {
		
		const today = new Date()
		today.setTime(today.getTime() - (i*24*60*60*1000))
		const month = ('0' + (today.getMonth() + 1)).slice(-2)
		const day = ('0' + today.getDate()).slice(-2)
		const url = cpath + '/userTotal?month=' + month + '&day=' + day
		const json = await fetch(url, opt).then(resp => resp.json())
		rows.push([+day, +json.notuser, +json.user, +json.notuser + +json.user])
	}
	
    data.addRows(rows)

    var options = {
      chart: {
        title: '일주일 판매 현황(회원, 비회원, 전체)',
        subtitle: '만원 단위'
      },
      width: 600,
      height: 400
    }

    var chart = new google.charts.Line(document.querySelector('.linechart'))

    chart.draw(data, google.charts.Line.convertOptions(options))
}