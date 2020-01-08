//

$(document).ready(function(){
    $('.sidenav').sidenav();
    $('.parallax').parallax();
});


/*================================================================================
  Item Name: Materialize - Material Design Admin Template
  Version: 2.1
  Author: GeeksLabs
  Author URL: http://www.themeforest.net/user/geekslabs
================================================================================*/

$(function() {
    /*Preloader*/
    $(window).load(function() {
        setTimeout(function() {
            $('body').addClass('loaded');
        }, 20);
    });

}); // end of document ready

//For tooltip

$(document).ready(function(){
    $('.tooltipped').tooltip();
});

//End of Tooltip