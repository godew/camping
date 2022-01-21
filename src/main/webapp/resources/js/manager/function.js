async function drawChart() {
	 const url = cpath + '/userNumber'
	 const opt = {
			 method : 'GET'
	 } 
	 const json = await fetch(url, opt).then(resp => resp.json())
	 	
	 let data = new google.visualization.DataTable();
	 
     data.addColumn('string', 'kind');
     data.addColumn('number', 'number of user');
     data.addRows([
       ['회원', +json.user],
       ['비회원', +json.notuser]
     ]);

     let options = {'title':'회원 / 비회원 비율',
                    'slices': {0: {color: 'red'}, 1:{color: 'skyblue'}},
                    'width':500,
                    'height':400};

    let chart = new google.visualization.PieChart(document.querySelector('.piechart'))

    chart.draw(data, options)
}