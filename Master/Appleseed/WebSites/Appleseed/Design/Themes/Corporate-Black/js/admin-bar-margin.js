// move the page down a little bit because of the admin bar. 
$(document).ready(function () {
    if ($('.navbar-admin').css("display") == "block") {
        $(".DefaultLayoutDiv").css("margin-top", "50px");
    }
});