function getDom(json) {
	dom = ``		
	dom += `<img style="opacity: 1;" src="${json[0]}">`	
	for (let i = 1; i < json.length; i++) {
		dom += `<img style="opacity: 0;" src="${json[i]}">`		
	}
	dom += `<div style="opacity: 0.3;" class="prev"></div>`
	dom += `<div class="next"></div>`
	dom += `<div class="count">1 / ${json.length}</div>`
		
	return dom
}

function prevHandler(event) {
	const image = event.target.parentNode
	const count = image.children[image.children.length - 1]
	let now = count.innerText.split('/')[0].trim()
	let len = count.innerText.split('/')[1].trim()
	if (now != 1) {
		image.children[now-1].style.opacity = '0'
		image.children[now-2].style.opacity = '1'
		count.innerText = (+now - 1) + ' / ' + len
	}
	if (now == 2) {
		image.children[image.children.length - 3].style.opacity = '0.3'
	}
	if (now == len) {
		image.children[image.children.length - 2].style.opacity = '1'
	}
}

function nextHandler() {
	const image = event.target.parentNode
	const count = image.children[image.children.length - 1]
	let now = count.innerText.split('/')[0].trim()
	let len = count.innerText.split('/')[1].trim()
	if (now != len) {
		image.children[now-1].style.opacity = '0'
		image.children[now].style.opacity = '1'
		count.innerText = (+now + 1) + ' / ' + len
	}
	if (now == len-1) {
		image.children[image.children.length - 2].style.opacity = '0.3'
	}
	if (now == 1) {
		image.children[image.children.length - 3].style.opacity = '1'
	}
}

function reserveBtnHandler() {
	reserveBtn.classList.add('on')
	infoBtn.classList.remove('on')
	reviewBtn.classList.remove('on')
	
	document.querySelector('.rooms-reserves').classList.remove('hidden')
	document.querySelector('.rooms-info').classList.add('hidden')
	document.querySelector('.rooms-review').classList.add('hidden')
}

function infoBtnHandler() {
	reserveBtn.classList.remove('on')
	infoBtn.classList.add('on')
	reviewBtn.classList.remove('on')
	document.querySelector('.rooms-reserves').classList.add('hidden')
	document.querySelector('.rooms-info').classList.remove('hidden')
	document.querySelector('.rooms-review').classList.add('hidden')
}

function reviewBtnHandler() {
	reserveBtn.classList.remove('on')
	infoBtn.classList.remove('on')
	reviewBtn.classList.add('on')
	document.querySelector('.rooms-reserves').classList.add('hidden')
	document.querySelector('.rooms-info').classList.add('hidden')
	document.querySelector('.rooms-review').classList.remove('hidden')
}