$(document).ready(function () {
	// open div pop-up for deleting profile
	$('.popup-trigger').on('click', function(e) {
		$('#popup').css('display', 'block');
		$('#black').css('display', 'block');		
	})
	
	// close div pop-up for deleting profile
	$('.close-popup').on('click', function(e) {
		$('#popup').css('display', 'none');
		$('#black').css('display', 'none');	
	})
});