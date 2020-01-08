var request = new XMLHttpRequest()
// Open a new connection, using the GET request on the URL endpoint
request.open('GET', '../assets/api/products.php', true)

request.onload = function() {
    var data = JSON.parse(this.response)

    if (request.status >= 200 && request.status < 400)
    {
        for(var product in data)
        {
            console.log(product, data[product]);
        }
    }
    else {
        console.log('error')
    }
}

request.send()
