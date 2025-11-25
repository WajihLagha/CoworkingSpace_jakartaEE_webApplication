// Show/hide descriptions 
function toggleDesc(id) {
    var elem = document.getElementById("desc" + id);
    if (elem.style.display === "block") {
        elem.style.display = "none";
    } else {
        elem.style.display = "block";
    }
}
