document.getElementById('formRegistration').addEventListener('submit', function(event) {
event.preventDefault(); // Prevent page reload

const formData = {
    number: $('#empNumber').val(),
    code:  $('#code').val(),
    name:  $('#name').val(),
    lastname:  $('#lastname').val(),
    position:  $('#position').val()
};

console.log(formData);

fetch('http://127.0.0.1:3000/employees', {
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
    $("#msgBox").addClass("alert alert-success");
    $("#msgBox").html("Employee '" + data.name + " " + data.lastname + "' added to the database.");
})
.catch(error => {
    console.error('Error:', error);
    let msgBox = document.getElementById("msgBox");
    $("#msgBox").addClass("alert alert-danger");
    $("#msgBox").html("Error when adding employee to the database.");
});


});