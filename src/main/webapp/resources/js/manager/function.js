async function drawPieChart() {
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
                    'slices': {0: {color: 'red'}, 1:{color: 'rgb(66, 133, 244)'}},
                    'width':500,
                    'height':400};

    let chart = new google.visualization.PieChart(document.querySelector('.piechart'))

    chart.draw(data, options)
}

//async function drawLineChart() {
//	const url = cpath + '/userNumber'
//	const opt = {
//			method : 'GET'
//	} 
//	const json = await fetch(url, opt).then(resp => resp.json())
//
//    var data = new google.visualization.DataTable();
//    data.addColumn('number', 'Day');
//    data.addColumn('number', '비회원');
//    data.addColumn('number', '회원');
//    data.addColumn('number', '전체');
//
//    data.addRows([
//      [1,  37.8, 80.8, 41.8],
//      [2,  30.9, 69.5, 32.4],
//      [3,  25.4,   57, 25.7],
//      [4,  11.7, 18.8, 10.5],
//      [5,  11.9, 17.6, 10.4],
//      [6,   8.8, 13.6,  7.7],
//      [7,   7.6, 12.3,  9.6],
//      [8,  12.3, 29.2, 10.6],
//      [9,  16.9, 42.9, 14.8],
//      [10, 12.8, 30.9, 11.6],
//      [11,  5.3,  7.9,  4.7],
//      [12,  6.6,  8.4,  5.2],
//      [13,  4.8,  6.3,  3.6],
//      [14,  4.2,  6.2,  3.4]
//    ]);
//
//    var options = {
//      chart: {
//        title: '날짜별 판매 현황(회원, 비회원, 전체)',
//        subtitle: '만원 단위'
//      },
//      width: 600,
//      height: 400
//    };
//
//    var chart = new google.charts.Line(document.querySelector('.linechart'));
//
//    chart.draw(data, google.charts.Line.convertOptions(options));
//}