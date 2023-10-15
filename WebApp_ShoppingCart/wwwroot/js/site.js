let cartCount = document.getElementById("cartCount");

function UpdateCartCountTo(num) {
    if (num < 100) {
        cartCount.innerHTML = num;
    } else {
        cartCount.innerHTML = "99+";
    }
}