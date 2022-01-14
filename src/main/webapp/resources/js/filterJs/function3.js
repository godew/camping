	const mapBtn = document.querySelector('.filter_mapBtn')
	const bodywrap = document.querySelector('.bodywrap')
//	const mapClose = document.querySelector('.mapClose')
	const overlay = document.querySelector('.mapOverlay')
	
	mapBtn.addEventListener('click', clickBtn)
	mapBtn.addEventListener('click', mapOpenHandler)
	
	function mapOpenHandler(event) {
		let mapModal = document.querySelector('.mapModal')
		mapModal.classList.remove('mapModalHidden')
		bodywrap.classList.add('not_scroll')
	}
	
	function mapCloseHandler(event) {
		let mapModal = document.querySelector('.mapModal')
		mapModal.classList.add('mapModalHidden')
		bodywrap.classList.remove('not_scroll')
	}
	
	
	mapBtn.onclick = mapOpenHandler
//	mapClose.onclick = mapCloseHandler
	overlay.onclick = mapCloseHandler
	