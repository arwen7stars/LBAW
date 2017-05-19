$(document).ready(function () {
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		var target = this.href.split('#');
		$('.nav a').filter('a[href="#'+target[1]+'"]').tab('show');
	})
	
	$('#btnClick').on('click',function(){
		var clickedID = $(this).attr('class');
		
		$('.' + clickedID).show();
	})
	
	// Hide the extra content initially, using JS so that if JS is disabled, no problemo:
	$('.read-more-content').addClass('hide')
	$('.read-more-show, .read-more-hide').removeClass('hide')

	// Set up the toggle effect:
	$('.read-more-show').on('click', function(e) {
	  $(this).next('.read-more-content').removeClass('hide');
	  $(this).addClass('hide');
	  e.preventDefault();
	});

	// Changes contributed by @diego-rzg
	$('.read-more-hide').on('click', function(e) {
	  var p = $(this).parent('.read-more-content');
	  p.addClass('hide');
	  p.prev('.read-more-show').removeClass('hide'); // Hide only the preceding "Read More"
	  e.preventDefault();
	});
});