
var clickedButtonValue = null;

// Add a click event listener to all elements with class 'submit-btn'
var submitButtons = document.querySelectorAll(".submit-btn");

for (var i = 0; i < submitButtons.length; i++) {
    submitButtons[i].addEventListener("click", function(event) {
        clickedButtonValue = event.target.value; // Store the value of the clicked button
    });
}
function validating() {

    // Get all input fields with the class 'myInput'
    var inputFields = document.getElementsByClassName("check");

    if (clickedButtonValue === "ins" || clickedButtonValue === "update" ) {

        for (var i = 0; i < inputFields.length; i++) {
            var inputValue = inputFields[i].value;

            // Check if the input is empty
            if (inputValue === '') {
                alert("Input fields cannot be empty.");
                return false;
            }
        }

        var phoneInput = document.getElementById("phone").value;

        console.log(phoneInput);
        // Define a regular expression to match 10-digit numbers
        var phoneNumberPattern = /^\d{10}$/;

        // Test if the input matches the pattern
        if (!phoneNumberPattern.test(phoneInput)) {
            alert("Please enter a 10-digit phone number containing only numerical digits.");
            return false;
        }


    }else if(clickedButtonValue === "srch" || clickedButtonValue === "del"){
        var SID = document.getElementById("SID").value;
        if( SID === ''){
            alert("Student ID cannot be empty.");
            return false;
        }
    }

    // If all inputs are not empty, allow form submission
    return true;
}


    





