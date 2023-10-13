function addproduct(productid) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "ShopController/Click");
    xhr.setRequestHeader("Content-Type", "application/json");
    xhr.onreadystatechange = function () { }
    var data = JSON.stringify({ productid: productid });
    xhr.send(data);
}