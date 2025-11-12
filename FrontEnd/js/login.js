document.getElementById('formLogin').addEventListener('submit', function(event) {
event.preventDefault(); // Prevent page reload

const formData = {
    number: $('#number').val(),
    code:  $('#code').val()
};

fetch('http://127.0.0.1:3000/employees/login', {
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