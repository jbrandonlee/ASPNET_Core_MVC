function addtocart(productId) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "AddToCart");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // Succeed
                console.log("Product added to cart successfully.");
            } else {
                // Report Error
                console.error("Error adding product to cart. Status code: " + xhr.status);
            }   
        }
    };
    xhr.send("username=" + "john" + "&productId=" + productId);

}

