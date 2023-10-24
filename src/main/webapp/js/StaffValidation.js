function validation(){
    var email=document.staff.email.value;
    var telno=document.staff.telno.value;


    if (email==null || email==""){
        alert("email cant be blank");
        return false;
    }else if(telno.length < 11){
        alert("phone no must be 10 characters long.");
        return false;
    }
}

function search_delete() {

    var staff_id = document.staff.staff_id.value;

    if (staff_id == null || staff_id == "") {
        alert("Staff ID can't be blank");
        return false;
    }
}
