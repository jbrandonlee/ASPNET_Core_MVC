
function changeitem(Id,quantity,customer)
{
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/Cart/ChangeItem");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function ()
    {
        if (xhr.readyState === XMLHttpRequest.DONE)
        {
            if (xhr.status === 200)
            {
                // Succeed
                console.log("Change cart successfully.");
            }
            else
            {
                // Report Error
                console.error("Error changing cart. Status code: " + xhr.status);
            }
        }
    }
    var data = "Id=" +Id + "&quantity=" + quantity + "&customer=" + customer;

    xhr.send(data);
}


function deleteitem(customer,productId) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/Cart/DeleteItem");
    xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xhr.onreadystatechange = function () {
        if (xhr.readyState === XMLHttpRequest.DONE) {
            if (xhr.status === 200) {
                // Succeed
                console.log("Delete cart successfully.");
            }
            else {
                // Report Error
                console.error("Error deleting cart. Status code: " + xhr.status);
            }
        }
    }
    var data = "Id=" + productId + "&customer=" + customer;
    console.log(data);
    xhr.send(data);
}