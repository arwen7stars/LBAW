$(document).ready(function () {
	$('.friendship').on('click', function(e) {
		var id = $(this).attr('id').split("-")[2];
		$('#confirm-friendship-' + id).css('display', 'block');
		$('#black').css('display', 'block');	
	})
	
	$('.close-friendship').on('click', function(e) {
		var id = $(this).attr('id').split("-")[2];
		$('#confirm-friendship-' + id).css('display', 'none');
		$('#black').css('display', 'none');	
	})
	
	$('.event-invitation').on('click', function(e) {
		var id = $(this).attr('id').split("-")[3];
		$('#confirm-event-' + id).css('display', 'block');
		$('#black').css('display', 'block');	
	})
	
	$('.close-event').on('click', function(e) {
		var id = $(this).attr('id').split("-")[2];
		$('#confirm-event-' + id).css('display', 'none');
		$('#black').css('display', 'none');	
	})
	
});