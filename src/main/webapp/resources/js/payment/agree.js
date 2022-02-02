const agrees = form.agree
agrees[0].onchange = function() {
	if (this.checked) {
		agrees.forEach(e => e.checked = true)			
	} else {
		agrees.forEach(e => e.checked = false)
	}
}
for (let i = 1; i < agrees.length; i++) {
	agrees[i].onchange = function() {
		if (this.checked) {
			if (agrees[1].checked && agrees[2].checked && agrees[3].checked && agrees[4].checked) {
				agrees[0].checked = true
			}
		} else {
			if (agrees[0].checked) {
				agrees[0].checked = false
			}
		}
	}
}

