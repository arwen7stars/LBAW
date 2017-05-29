<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Create New Event</title>
	<!-- Bootstrap -->
	<link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
 	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="../../lib/bootstrap-3.3.7/css/bootstrap-select.min.css">
	<link href="../../css/default.css" rel="stylesheet">
	<link href="../../css/forms.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />

</head>

<body>

<div class="body-flex">

	{include file='header.tpl'}

	<div class="container">
		<div class="row">
			<div class="forms col-lg-1 col-centered">
				<h2>Create New Event</h2>
				<form id="create_event" method="post" action="../../actions/events/create_event.php">
					<fieldset>
						<p><label for="name">Event Name</label>
						<input type="text" class="form-control" id="name" name="event_name" placeholder="Event Name" required></p>

						{if isset({$wrong_dates}) && !empty({$wrong_dates})}
						<p><label for="event_start">Start Date</label>
						<input type="date" class="form-control error-input" id="event_start" name="event_start" min="{$now}" required>
						<div class="error-in">The start date shouldn't be after the end date!</div></p>
						{else}
						<p><label for="event_start">Start Date</label>
						<input type="date" class="form-control" id="event_start" name="event_start" min="{$now}" required></p>
						{/if}

						{if isset({$wrong_dates}) && !empty({$wrong_dates})}
						<p><label for="event_end">End Date</label>
						<input type="date" class="form-control error-input" id="event_end" name="event_end" min="{$now}" required>
						<div class="error-in">The end date shouldn't be before the start date!</div></p>
						{else}
						<p><label for="event_end">End Date</label>
						<input type="date" class="form-control" id="event_end" name="event_end" min="{$now}" required></p>
						{/if}

						<p><label for="event_description">Event Description</label>
						<input type="text" class="form-control" id="event_description" name="event_description" placeholder="Small description of the event"></p>

						<p><label for="location">Event Location</label>
						<select id="location" name="location" class="form-control">
							{if !empty($location)}
									{foreach $locations as $loc}
										{if $loc.id == $location.id}
										<option value="{$loc.id}" selected="selected">{$loc.city}, {$loc.country}</option>
										{else}
										<option value="{$loc.id}">{$loc.city}, {$loc.country}</option>
										{/if}
									{/foreach}
							{else}
									<option value="-1" selected="selected">Select location</option>
									{foreach $locations as $loc}
										<option value="{$loc.id}">{$loc.city}, {$loc.country}</option>
									{/foreach}
							{/if}
						</select></p>

						<p><label for="event_privacy">Event Privacy</label>
						<select name="event_privacy" class="form-control" id="event_privacy">
								<option id="event_public" value="true">Public</option>
								<option id="event_private" value="false">Private</option>
						</select></p>

						<p><button type="submit" class="submit btn btn-primary">Create Event</button></p>
					</fieldset>
				</form>
			</div>
		</div>
	</div>

	{include file='footer.tpl'}

	</div>
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap-select.min.js"></script>
	<script src="../../javascript/script.js"></script>
	<script src="../../javascript/search-bar.js"></script>
</body>
</html>
