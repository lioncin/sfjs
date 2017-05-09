$(document).ready(function() {
    // $('.js_app').hover(function(){
    //  $(this).find('.js_app_bg').stop().fadeIn();
    // },function(){
    //  $(this).find('.js_app_bg').stop().fadeOut();
    // });


    function today() {
        $('.js_today').html('今天' + new Date());
        // console.log(new Date().getDate());
    };

    setInterval(today,1000);

});