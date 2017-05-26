$(document).ready(function () {
	$('#about_txt').html(
		$('#about_txt').text().replace(/\n\r?/g, '<br />')
	);
	
	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
		var target = this.href.split('#');
		$('.nav a').filter('a[href="#'+target[1]+'"]').tab('show');
	})
	
	// open div pop-up for editing posts
	$('.edit').on('click', function(e) {
		var id = $(this).attr('id').split("-")[2];
		$('#edit-' + id).css('display', 'block');
		$('#black').css('display', 'block');		
	})
	
	// open div pop-up for editing comments
	$('.edit-comment').on('click', function(e) {
		var id = $(this).attr('id').split("-")[2];
		$('#edit-comment-' + id).css('display', 'block');
		$('#black').css('display', 'block');		
	})
	
	// close div pop-up for editing posts
	$('.close-edit').on('click', function(e) {
		var id = $(this).attr('id').split("-")[2];
		$('#edit-' + id).css('display', 'none');
		$('#black').css('display', 'none');	
	})
	
	// close div pop-up for editing comments
	$('.close-comment').on('click', function(e) {
		var id = $(this).attr('id').split("-")[2];
		$('#edit-comment-' + id).css('display', 'none');
		$('#black').css('display', 'none');	
	})
	
	// open div pop-up for deleting posts
	$('.delete').on('click', function(e) {
		var id = $(this).attr('id').split("-")[2];
		$('#confirm-' + id).css('display', 'block');
		$('#black').css('display', 'block');		
	})
	
	// open div pop-up for deleting comments
	$('.delete-comment').on('click', function(e) {
		var id = $(this).attr('id').split("-")[2];
		$('#confirm-comment-' + id).css('display', 'block');
		$('#black').css('display', 'block');		
	})
	
	// close div pop-up for deleting posts
	$('.close-delete').on('click', function(e) {
		var id = $(this).attr('id').split("-")[2];
		$('#confirm-' + id).css('display', 'none');
		$('#black').css('display', 'none');	
	})
	
	// close div pop-up for deleting comments
	$('.close-delete-comment').on('click', function(e) {
		var id = $(this).attr('id').split("-")[3];
		$('#confirm-comment-' + id).css('display', 'none');
		$('#black').css('display', 'none');	
	})
	
	$( ".error-input").focus(function() {
		$(this).css('border-color','red');
		$(this).next().hide();
	});
	
	$( ".error-input").blur(function() {
		$(this).css('border-color','red');
		$(this).next().show();
	});
});