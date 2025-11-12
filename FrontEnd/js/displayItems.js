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
        console.log('Success:', data);
    })
    .catch(error => {
        console.error('Error:', error);
    });
});