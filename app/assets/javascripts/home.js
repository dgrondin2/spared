$(document).ready(function($) {

    function nextSlide() {
        var $current = $('.slideshow .active'),
            $next = $current.next('.slide');

        if (!$next.length) {
            $next = $('.slide').first();
        }

        $current.fadeOut('slow');
        $next.fadeIn('slow');

        $current.removeClass('active');
        $next.addClass('active');
    }

    if ($('.slideshow').length) {
        $(function() {
            setInterval(nextSlide, 5000);
        });
    }

    $('a.facebox-modal').facebox();
});