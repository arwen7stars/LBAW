<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Feed</title>
	<!-- Bootstrap -->
	<link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
 	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
	<link href="../../css/feed.css" rel="stylesheet">
	<link href="../../css/forms.css" rel="stylesheet">

</head>

<body>

<div class="body-flex">

{include file='header.tpl'}

<div class="container">
	<div class="row">
		<div class="forms col-lg-1 col-centered">
			<h2>Create New Event</h2>
			<form id="login" method="post" action="../../actions/events/create_event.php">
				<fieldset>
					<p><label for="name">Event Name</label>
					<input type="text" class="form-control" id="event_name" name="event_name" aria-describedby="emailHelp" placeholder="Event Name"></p>
					
					<p><label for="start_date">Start Date</label>
					<input type="date" class="form-control" id="event_start" name="event_start"></p>

					<p><label for="end_date">End Date</label>
					<input type="date" class="form-control" id="event_end" name="event_end"></p>

					<p><label for="name">Event Name</label>
					<input type="text" class="form-control" id="event_name" name="event_name" aria-describedby="emailHelp" placeholder="Event Name"></p>
					
					<p><label for="name">Event Privacy</label>
					<select class="form-control" id="exampleSelect1">
							<option id="event_public" name="event_public" value="true">Public</option>
							<option id="event_public" name="event_private" value="false">Private</option>
					</select>

					<p><button type="submit" class="submit btn btn-primary">Create Event</button></p>
				</fieldset>
			</form>
		</div>
	</div>
</div>

{include file='footer.tpl'}

</div>

</body>

	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
	<!-- Latest compiled and minified JavaScript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
	<script src="../../javascript/script.js"></script>
</html>
