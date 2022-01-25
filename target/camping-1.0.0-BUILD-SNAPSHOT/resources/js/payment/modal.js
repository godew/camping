const modal = document.querySelector('.pay-modal')
const infoModal = document.querySelector('.pay-info-modal')
const modalCancelBtn = document.querySelector('.modal-cancel-btn')
const infoModalCancelBtn = document.querySelector('.pay-info-modal-content > .btn > button')
const text = document.querySelector('.pay-modal-content > .text')

payBtn.onclick = function(event) {
	event.preventDefault()
	modal.classList.remove('hidden')
	
	if (form.name.value == '') {
		text.innerText = '예약자 이름을 입력해주세요.'
	} else if (form.phone.value == '') {
		text.innerText = '휴대폰 번호를 입력해 주세요.'
	} else if (!login && !phoneFlag) {
		text.innerText = '휴대폰 번호를 확인해 주세요.'
	} else if (!login && !authFlag) {
		text.innerText = '휴대폰 번호 미인증 되었습니다.'
	} else if (!form.agree[0].checked) {
		text.innerText = '필수 이용 동의 항목에 동의(체크)해주세요.'
	} else {
		modal.classList.add('hidden')
		infoModal.classList.remove('hidden')
	}
}
modalCancelBtn.onclick = function() {
	modal.classList.add('hidden')
}
infoModalCancelBtn.onclick = function() {
	infoModal.classList.add('hidden')
}
window.onclick = function(event) {
	if (event.target == modal) {
		modal.classList.add('hidden')
	} else if (event.target == infoModal){
		infoModal.classList.add('hidden')
	}
}