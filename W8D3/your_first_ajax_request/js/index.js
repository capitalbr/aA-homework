console.log("Hello from the JavaScript console!");

$.ajax({
    type: 'GET',
    url: 'http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b',
    success(data) {
        console.log(data);
    }
        
})

console.log("it didn't tell me what to put here so I put this here")
// Your AJAX request here

// Add another console log here, outside your AJAX request


// your AJAX request
    // --> including a console.log for the data in the success callback

// another console.log down here
