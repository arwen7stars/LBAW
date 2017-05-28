$(document).ready(function () {
	$("#click-edit-event").on('click', function(e) {
		$('#edit-event-box').css('display', 'block');
		$('#black').css('display', 'block');	
	})
	
	$('#close-edit-event').on('click', function(e) {
		$('#edit-event-box').css('display', 'none');
		$('#black').css('display', 'none');	
	})
	
	$("#click-delete-event").on('click', function(e) {
		$('#confirm-delete-event').css('display', 'block');
		$('#black').css('display', 'block');	
	})
	
	$('#close-delete-event').on('click', function(e) {
		$('#confirm-delete-event').css('display', 'none');
		$('#black').css('display', 'none');	
	})
	
	$("#click-leave-event").on('click', function(e) {
		$('#confirm-leave-event').css('display', 'block');
		$('#black').css('display', 'block');	
	})
	
	$('#close-leave-event').on('click', function(e) {
		$('#confirm-leave-event').css('display', 'none');
		$('#black').css('display', 'none');	
	})
});