const roomInfoBtns = document.querySelectorAll('.roomInfoBtn')
const modal = document.querySelector('.detail-modal')
const cancelBtn = document.querySelector('.detail-modal .cancel')

roomInfoBtns.forEach(btn => {
	btn.onclick = function() {
		const url = cpath + '/product/detail/people?itemRoomId=' +  btn.dataset.idx
		const opt = {
				method : 'GET'
		}
		fetch(url, opt)
			.then(resp => resp.json())
			.then(json => {
				const people = document.querySelector('.people')
				people.innerHTML = `${json.standardPeople}인 기준 최대 ${json.maxPeople}인`
			})
			
		modal.classList.remove('hidden')
	}
})

cancelBtn.onclick = function() {
	modal.classList.add('hidden')
}

window.onclick = function(event) {
	if(event.target == modal) {
		modal.classList.add('hidden')
	}
}


