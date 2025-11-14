$(document).ready(function(){
    fetch('http://127.0.0.1:3000/items', {
        method: 'GET',
        headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
        },
    })
    .then(response => {
        if (!response.ok) {
        throw new Error('Could not connect to endpoint');
        }
        return response.json();
    })
    .then(data => {
        
        //Create table with locations
        let table = $("<table>")
        table.addClass("table");
        let thead = $("<thead>");
        let tbody = $("<tbody>");
        thead.append($("<tr>"));
        thead.append($("<th></th>"));
        for(let i=1; i<7; i++){
            thead.append($("<th>Shelf " + i + "</th>"));
        }
        thead.append($("</tr>"));
        
        for(let i=1; i<7; i++){
            tbody.append($("<tr>"));
            tbody.append($("<th> Level " + (7 - i) + "</th>"));
            for(let j=1; j<7; j++){
                tbody.append($("<td class='cell' id='" + j + " - " + (7-i) + "'> " + j  + " - " + (7 - i) + "</td>"));
            }
            tbody.append($("</tr>"));
        }

        table.append(thead);
        table.append(tbody);

        $("#itemsTable").append(table);

        //Add items to table
        for(let i=0; i<data.length; i++){
            let item = data[i];
            for(let j=0; j<$(".cell").length; j++){
                let cell = $(".cell")[j];

                if(cell.id === item.location){
                    //Location was found for element
                    //Create card
                    let card = `<div class='card' style='width: 18rem;'>
                                <div class='card-body'>
                                    <h5 class='card-title'>` + item.location + `: ` + item.name + `</h5>
                                    <ul>
                                        <li>Category: ` + item.category + `</li>
                                        <li>Quantity: ` + item.quantity + `</li>
                                        <li>Price: ` + item.price + `</li>
                                        <li>Barcode: ` + item.barcode + `</li>
                                    </ul>
                                </div>
                                </div>`
                    $(cell).html(card);
                }
            }
        }
    })
    .catch(error => {
        console.error('Error:', error);
    });

    $("#formCreateItem").submit(function(){

        event.preventDefault(); // Prevent page reload
        const formData = {
            name: $('#name').val(),
            category:  $('#category').val(),
            quantity:  $('#quantity').val(),
            location:  $('#location_row').val() + " - " + $("#location_level").val(),
            price:  $('#price').val(),
            barcode:  $('#barcode').val()
        };

        fetch('http://127.0.0.1:3000/items', {
            method: 'POST',
            headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => {
            if (!response.ok) {
            throw new Error('Could not connect to endpoint');
            }
            return response.json();
        })
        .then(data => {
            console.log('Success:', data);
        })
        .catch(error => {
            console.error('Error:', error);
        });
    });

    $("#modalSave").click(function(){
        location.reload();
    });
});