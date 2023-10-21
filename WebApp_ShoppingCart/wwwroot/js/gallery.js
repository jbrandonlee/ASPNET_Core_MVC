// Handles Cart Icon
let cartCount = document.getElementById("cartCount");

function UpdateCartCount(num) {
	if (num < 100) {
		cartCount.innerHTML = num;
	} else {
		cartCount.innerHTML = "99+";
	}
}

// Add 'Click' EventListeners to all AddToCart buttons
let addBtns = document.getElementsByClassName("btn-addCart");

for (let i = 0; i < addBtns.length; i++) {
	addBtns[i].addEventListener("click", function (e) {
		let xhr = new XMLHttpRequest();
		xhr.open("POST", "AddToCart");
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
		xhr.send("productId=" + addBtns[i].dataset.productId);

		xhr.onreadystatechange = function () {
			if (xhr.readyState === XMLHttpRequest.DONE) {
				if (xhr.status === 200) {
					// Succeed
					console.log("Product added to cart successfully.");
					UpdateCartCount(JSON.parse(this.responseText).cartCount);
				} else {
					// Report Error
					console.error("Error adding product to cart. Status code: " + xhr.status);
				}
			}
		};
	})
}