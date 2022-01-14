const payBtn = document.querySelector('.pay')
// 	const cancelBtn = document.querySelector('.cancel')

const form = document.forms[0]
const sendBtn = document.querySelector('.sendBtn')
const pointBtn = document.querySelector('.pointBtn')
const sendMsg = document.querySelector('.sendMsg')
const authBtn = document.querySelector('.authBtn')
const authForm = document.querySelector('.authForm')
const authMsg = document.querySelector('.authMsg')
const timer = document.querySelector('.timer')

const payReadyBtn = document.querySelector('.payReadyBtn')

const point = form.point
const phone = form.phone
const price = document.querySelector('.total_price .price')

let phoneFlag = false
let authFlag = false

let second
let interval

// 	cancelBtn.onclick = payCancel
sendBtn.onclick = sendHandler
authBtn.onclick = authHandler
pointBtn.onclick = function(event) {
	event.preventDefault()
	console.log(priceVal)
	console.log(point.value)
	point.value = pointVal > priceVal ? priceVal : pointVal
	price.innerText = (priceVal - point.value).toLocaleString() + '원'
}
payReadyBtn.onclick = payReady


point.oninput = checkNumber
phone.oninput = checkNumber
phone.onkeydown = function(event) {
	if (event.key == 'Backspace') {
		sendBtn.style.backgroundColor = '#cccccc'
	}
}