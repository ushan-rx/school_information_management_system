function validateform() {
    var sub_name = document.subject.sub_name.value;
    var sub_grade = document.subject.sub_grade.value;
    var sub_hrs = document.subject.sub_hrs.value;

    if (sub_name == null || sub_name == "") {
        alert("Subject Name can't be blank");
        window.location.reload();
        return false;

    } else if (sub_hrs === null || sub_hrs === "" || sub_hrs === undefined) {
        alert("Teaching Hours can't be blank");
        window.location.reload();
        return false;
    } else if (!/^\d+$/.test(sub_hrs)) {
        alert("Teaching Hours must be a number.");
        window.location.reload();
        return false;

    } else if (document.getElementById('sub_grade').selectedIndex == 0) {
        alert("Please select Grade");
        window.location.reload();
        return false;
    }
    return true;
}

function scrh_del() {
    var sub_id = document.subject.sub_id.value;

    if (sub_id == null || sub_id == "") {
        alert("Subject ID can't be blank");
        window.location.reload();
        return false;

    }
}