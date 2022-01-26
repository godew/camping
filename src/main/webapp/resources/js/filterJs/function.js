// person
const filterMinus = document.querySelector('.filterMinus')
const filterPlus = document.querySelector('.filterPlus')
let filterResult = document.querySelector('.filterResult')
let personCnt = filterResult.innerText

filterMinus.onclick = function(event){
		if(personCnt > 2){
			personCnt = parseInt(personCnt) - 1
			return filterResult.innerText = personCnt
		}
}

filterPlus.onclick = function(event){
		if(personCnt == '10'){
			return
		}
		personCnt = parseInt(personCnt) + 1
		return filterResult.innerText = personCnt
}








// price 
const inputLeft = document.getElementById("input-left");
const inputRight = document.getElementById("input-right");
const thumbLeft = document.querySelector(".slider > .thumb.left");
const thumbRight = document.querySelector(".slider > .thumb.right");
const range = document.querySelector(".slider > .range");
const filterPriceList = document.querySelector('.filterPriceList')

function setLeftValue() {
	let _this = inputLeft,
		min = parseInt(_this.min),
		max = parseInt(_this.max);
		
	_this.value = Math.min(parseInt(_this.value), parseInt(inputRight.value) - 1);

	let percent = ((_this.value - min) / (max - min)) * 100;
	thumbLeft.style.left = percent + "%";
	range.style.left = percent + "%";		
}
setLeftValue();


function setRightValue() {
	let _this = inputRight,
		min = parseInt(_this.min),
		max = parseInt(_this.max);

	_this.value = Math.max(parseInt(_this.value), parseInt(inputLeft.value) + 1);

	let percent = ((_this.value - min) / (max - min)) * 100;

	thumbRight.style.right = (100 - percent) + "%";
	range.style.right = (100 - percent) + "%";
}
setRightValue();



inputLeft.addEventListener('click', leftPrice)
inputRight.addEventListener('click', leftPrice)

window.addEventListener('load', filterPrice)

function filterPrice(){
	filterPriceList.innerHTML = '1만원 이상'
}

function leftPrice(event){
	filterPriceList.innerHTML = ''
	let rP = filterPriceList.innerHTML = inputLeft.value + '만원 ~ ' + inputRight.value + '만원 이하'
	
	if(inputLeft.value == '1' && inputRight.value == '30'){
		filterPriceList.innerHTML = ''
		filterPriceList.innerHTML = '1만원 이상'
	}
	
}



inputLeft.addEventListener("input", setLeftValue);
inputRight.addEventListener("input", setRightValue);

inputLeft.addEventListener("mousedown", function() {
	thumbLeft.classList.add("active");
});

inputLeft.addEventListener("mouseup", function() {
	thumbLeft.classList.remove("active");
});

inputRight.addEventListener("mousedown", function() {
	thumbRight.classList.add("active");
});
inputRight.addEventListener("mouseup", function() {
	thumbRight.classList.remove("active");
});




