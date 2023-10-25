
var clickedButtonValue = null;
// Add a click event listener to all submit buttons
var submitButtons = document.querySelectorAll(".submit-btn");
for (var i = 0; i < submitButtons.length; i++) {
    submitButtons[i].addEventListener("click", function(event) {
        clickedButtonValue = event.target.value;
    });
}
function validateForm() {

    var inputFields = document.getElementsByClassName("form-control1");

    if (clickedButtonValue === "ins" || clickedButtonValue === "update" ) {

    for (var i = 0; i < inputFields.length; i++) {
        var inputValue = inputFields[i].value;

        // Check if the input is empty
        if (inputValue === '') {
            alert("Input fields cannot be empty.");
            return false;
        }
    }
        // validate for numerical inputs
        var numInputs = document.getElementsByClassName("numericInput");

        for (var i = 0; i < numInputs.length; i++) {
            var numInput = numInputs[i].value;
            // check for numbers only
            if (!/^\d+$/.test(numInput)) {
                alert("Some input fields(Time duration, Total Marks) must contain numbers only.");
                return false;
            }
        }

        // validate for date to be on future
        var dateInput = document.getElementById("dateInput").value;
        var currentDate = new Date();
        var selectedDate = new Date(dateInput);

        // Compare the input date with the current date
        if (selectedDate <= currentDate) {
            alert("Please select a date in the future.");
            return false;
        }

    }else if(clickedButtonValue === "srch" || clickedButtonValue === "del"){
        // validate if exam id is null
        var exid = document.getElementById("exid").value;
        if( exid === ''){
            alert("Exam ID cannot be empty.");
            return false;
        }
    }
    return true;
}