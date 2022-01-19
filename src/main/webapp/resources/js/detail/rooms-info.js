const flex = document.querySelectorAll('.flex')
const standardBtn = document.querySelector('.standardBtn')	
const standard = document.querySelector('.standard')	
const serviceBtn = document.querySelector('.serviceBtn')
const service = document.querySelector('.service')

let flag1 = false
let flag2 = false

flex[0].onclick = function() {
	if (flag1 = !flag1){
		standardBtn.style.background = '#fff url(//image.goodchoice.kr/images/web_v3/ico_arr_3.png) 0 -8px no-repeat'
		standardBtn.style.backgroundSize = '12px auto'
		standard.classList.remove('hidden')
	} else {
		standardBtn.style.background = '#fff url(//image.goodchoice.kr/images/web_v3/ico_arr_3.png) 0 0 no-repeat'
		standardBtn.style.backgroundSize = '12px auto'
		standard.classList.add('hidden')
	}
}

flex[1].onclick = function() {
	if (flag2 = !flag2){
		serviceBtn.style.background = '#fff url(//image.goodchoice.kr/images/web_v3/ico_arr_3.png) 0 -8px no-repeat'
		serviceBtn.style.backgroundSize = '12px auto'
		service.classList.remove('hidden')
	} else {
		serviceBtn.style.background = '#fff url(//image.goodchoice.kr/images/web_v3/ico_arr_3.png) 0 0 no-repeat'
		serviceBtn.style.backgroundSize = '12px auto'
		service.classList.add('hidden')
	}
}