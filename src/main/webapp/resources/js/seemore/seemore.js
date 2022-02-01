async function ajaxRequest(host, body, headers = {}, method = "POST") {
	const url = host;
	const options = {
			method: method,
			headers: {
				"Content-Type": "application/json",
				...headers,
			},
			body: JSON.stringify(body),
	};
	const res = await fetch(url, options);
	const data = await res.json();
	if (res.ok) {
		return data;
	} else {
		throw Error(data);
	}
}

function getFormData(idBox = [], formTagId){

	const obj = {};
	const formId = "#" + formTagId + " ";

	for(let i = 0; i< idBox.length; i++){
		const id = idBox[i];
		if(id){
			let value = $(formId + "#" + id).val();
			obj[id] = value;
		}
	}

	return obj;
}

function setPagination(location, totalCount, pageIdx = 1) {
	
	const totalPage = Math.ceil(totalCount / 10);
	const pageRange = Math.ceil(pageIdx / 5) * 5;
	const startPageRange = pageRange - 4; 
	const endPageRange = pageRange < totalPage ? pageRange : totalPage;
	
	const paginationInfo = [];
	if(startPageRange !== 1) paginationInfo.push(`<button class="prev">이전</button>`); 
	for(let i = startPageRange; i <= endPageRange; i++) {
		if(i == pageIdx) {
			paginationInfo.push(`<button class="on">${i}</button>`);
		} else {
			paginationInfo.push(`<button>${i}</button>`);
		}
	}
	if(endPageRange !== totalPage) paginationInfo.push(`<button class="next">다음</button>`);
	const strHtml = `
		<div class="paging">
			{{__paginationInfo__}}
		</div>
	`;
	
	$('#' + location).html( strHtml.replace('{{__paginationInfo__}}', paginationInfo.join('')) );
}
