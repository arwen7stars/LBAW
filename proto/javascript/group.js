$(document).ready(function () {
	$("#click-edit-group").on('click', function(e) {
		$('#edit-group-box').css('display', 'block');
		$('#black').css('display', 'block');	
	})
	
	$('#close-edit-group').on('click', function(e) {
		$('#edit-group-box').css('display', 'none');
		$('#black').css('display', 'none');	
	})
	
	$("#click-delete-group").on('click', function(e) {
		$('#confirm-delete-group').css('display', 'block');
		$('#black').css('display', 'block');	
	})
	
	$("#close-delete-group").on('click', function(e) {
		$('#confirm-delete-group').css('display', 'none');
		$('#black').css('display', 'none');	
	})
	
	$("#click-leave-group").on('click', function(e) {
		$('#confirm-leave-group').css('display', 'block');
		$('#black').css('display', 'block');	
	})
	
	$("#close-leave-group").on('click', function(e) {
		$('#confirm-leave-group').css('display', 'none');
		$('#black').css('display', 'none');	
	})
});