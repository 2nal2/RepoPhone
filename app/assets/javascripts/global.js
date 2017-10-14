$(document).on('turbolinks:load', function(){
    $(".button-collapse").sideNav();
    $('.carousel.carousel-slider').carousel({fullWidth: true}); 

    $('.carousel-fixed-item.left').click(function(e){
        $('.carousel').carousel('prev');
    });

    $('.carousel-fixed-item.right').click(function(e){
        $('.carousel').carousel('next');
    });
});
