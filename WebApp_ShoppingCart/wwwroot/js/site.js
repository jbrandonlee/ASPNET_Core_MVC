function addtocart(productid) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "AddToCart");
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // Succeed
                console.log("Product added to cart successfully.");
            } else {
                // Reporterror
                console.error("Error adding product to cart. Status code: " + xhr.status);
            }
        }
    };
    let data = { "Id": productid };
    xhr.send(JSON.stringify(data));
}