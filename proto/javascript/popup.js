$(document).ready(function () {
	// open div pop-up for deleting comments
	$('.popup-trigger').on('click', function(e) {
		$('#popup').css('display', 'block');
		$('#black').css('display', 'block');		
	})
	
	// close div pop-up for deleting comments
	$('.close').on('click', function(e) {
		$('#popup').css('display', 'none');
		$('#black').css('display', 'none');	
	})
});