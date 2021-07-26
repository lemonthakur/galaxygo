/*=========================================================================
     Any custom script you want to apply should be defined here
===========================================================================*/

/*========================================
      Advanced Search 
========================================*/

$('.advance-search-btn').on('click', function() {
     if($('.ic-advanced-search').hasClass('show')) {
          $('.ic-advanced-search').removeClass('show zoomIn');
          $('.ic-advanced-search').addClass('zoomOut');
          $('.advance-search-btn i').removeClass('flaticon-cancel');
          $('.advance-search-btn i').addClass('flaticon-plus');

     } else {
          $('.ic-advanced-search').addClass('show zoomIn');
          $('.ic-advanced-search').removeClass('zoomOut');
          $('.advance-search-btn i').addClass('flaticon-cancel');
          $('.advance-search-btn i').removeClass('flaticon-plus');
     }
     
});


/*========================================
    list gride view
========================================*/

// let gridWrap = $('.ic-grid-wrap');
// let listWrap = $('.ic-list-wrap');

$('.ic-grid-btn').on('click', function() {
     if($('.ic-grid-wrap').hasClass('active')) {
          $('.ic-grid-wrap').removeClass('active');
          $('.ic-list-wrap').addClass('active');
     } else {
          $('.ic-grid-wrap').addClass('active');
          $('.ic-list-wrap').removeClass('active');
     }
     
});

$('.ic-list-btn').on('click', function(){
     if($('.ic-list-wrap').hasClass('active')) {
          $('.ic-list-wrap').removeClass('active');
          $('.ic-grid-wrap').addClass('active');
     } else {
          $('.ic-list-wrap').addClass('active');
          $('.ic-grid-wrap').removeClass('active');
     }
});

