$(function () {
    $("#chapter-nav-btn").click(function() {
        $("#chapter-nav").toggle();
        if ($("#chapter-nav").is(":visible")) {
            $("#chapter-nav-chevron").removeClass("icon-chevron-down").addClass("icon-chevron-up");
        }
        else {
            $("#chapter-nav-chevron").removeClass("icon-chevron-up").addClass("icon-chevron-down");
        }
    })
});