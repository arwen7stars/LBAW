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
	
	var request;
	$("#invite_friend").submit(function(event)
	{
		event.preventDefault();

		if (request) {
			request.abort();
		}
		
		var $form = $(this);

		// Let's select and cache all the fields
		var $inputs = $form.find("email");

		// Serialize the data in the form
		var serializedData = $form.serialize();

		// Let's disable the inputs for the duration of the Ajax request.
		// Note: we disable elements AFTER the form data has been serialized.
		// Disabled form elements will not be serialized.
		$inputs.prop("disabled", true);

		// Fire off the request to /form.php
		request = $.ajax({
			url: "../../actions/users/invite.php",
			type: "post",
			data: serializedData
		});

		// Callback handler that will be called on success
		request.done(function (response, textStatus, jqXHR){
			document.getElementById("result").innerHTML = "Invite Sent";
		});

		// Callback handler that will be called on failure
		request.fail(function (jqXHR, textStatus, errorThrown){
			// Log the error to the console
			console.error(
				"The following error occurred: "+
				textStatus, errorThrown
			);
		});

		// Callback handler that will be called regardless
		// if the request failed or succeeded
		request.always(function () {
			// Reenable the inputs
			$inputs.prop("disabled", false);
		});

	});

	$('.group-invitation').on('click', function(e) {
		var id = $(this).attr('id').split("-")[3];
		$('#confirm-group-' + id).css('display', 'block');
		$('#black').css('display', 'block');	
	})
	
	$('.close-group').on('click', function(e) {
		var id = $(this).attr('id').split("-")[2];
		$('#confirm-group-' + id).css('display', 'none');
		$('#black').css('display', 'none');	
	})
});