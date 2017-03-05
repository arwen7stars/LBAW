$('body').on('click', '.btn-group button', function (e) {
    $(this).addClass('active');
    $(this).siblings().removeClass('active');
});

$(".dropdown-menu li a").click(function(){
  var selText = $(this).html();
  $(this).parents('.btn-group').find('.dropdown-toggle').html(selText+' <span class="caret"></span>');
});