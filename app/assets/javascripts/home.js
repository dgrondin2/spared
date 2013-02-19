$(document).ready(function($) {
    $('.slide_hidden').hide();
    window.setInterval(nextImage, 4500);

    function nextImage() {
        var $current = $(".slide_shown"),
            $next = $(".slide_hidden");

        $current.fadeOut("slow");
        $next.show();
        $next.fadeIn("slow");

        $next.removeClass("slide_hidden");
        $current.removeClass("slide_shown");
        $next.addClass("slide_shown");
        $current.addClass("slide_hidden");
    }
});