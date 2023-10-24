
function phonenumber(inputtxt)
    {
    var GPhoneNum = /^\d{10}$/;
    if ((inputtxt.value.match(GPhoneNum)))
        {
            alert("Enter valid phone-number");

}
}

function validateform(){
    var FName = document.forms.FName.value;
    var LName = document.forms.LName.value;

    if (FName == null){
        alert("FName can't be blank");
    }else if (LName == null){
        alert("LName can't be blank");
    }
}




    





