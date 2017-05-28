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
});