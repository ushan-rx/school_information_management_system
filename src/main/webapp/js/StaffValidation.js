
var clickedButtonValue = null; // Initialize a variable to store the clicked button value

// Add a click event listener to all elements with class 'submit-btn'
var submitButtons = document.querySelectorAll(".submit-btn");
for (var i = 0; i < submitButtons.length; i++) {
    submitButtons[i].addEventListener("click", function(event) {
        clickedButtonValue = event.target.value; // Store the value of the clicked button
    });
}
function validation() {

    // Get all input fields with the class 'myInput'
    var inputFields = document.getElementsByClassName("notNull");

    if (clickedButtonValue === "insert" || clickedButtonValue === "update" ) {

        // Loop through the input fields
        for (var i = 0; i < inputFields.length; i++) {
            var inputValue = inputFields[i].value;

            // Check if the input is empty
            if (inputValue === '') {
                alert("Input fields cannot be empty.");
                return false; // Prevent form submission
            }
        }

        // validate for date to be on past
        var dateInput = document.getElementById("dateInput").value;
        var currentDate = new Date(); // Create a Date object for the current date
        var selectedDate = new Date(dateInput);  // Parse the input date as a Date object

        // Compare the input date with the current date
        if (selectedDate > currentDate) {
            alert("Please select a date in the past.");
            return false; // Prevent form submission
        }

        var phoneInput = document.getElementById("phoneinput").value;

        console.log(phoneInput);
        // Define a regular expression to match 10-digit numbers
        var phoneNumberPattern = /^\d{10}$/;

        // Test if the input matches the pattern
        if (!phoneNumberPattern.test(phoneInput)) {
            alert("Please enter a 10-digit phone number containing only numerical digits.");
            return false; // Prevent form submission
        }


    }else if(clickedButtonValue === "search" || clickedButtonValue === "delete"){
        var sid = document.getElementById("sid").value;
        if( sid === ''){
            alert("Staff ID cannot be empty.");
            return false; // Prevent form submission
        }
    }

    // If all inputs are not empty, allow form submission
    return true;
}