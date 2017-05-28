<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Events</title>

	<!-- Bootstrap -->
    <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Default stylesheet -->
	<link rel="stylesheet" href="../../lib/font-awesome-4.7.0/css/font-awesome.min.css">
	<link href="../../css/default.css" rel="stylesheet">
	<link href="../../css/groups_events.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
</head>

<body>
	{include file='header.tpl'}
	
	<div id="group-event-box">
		<h2>Events</h2>
		<hr>
		<ul class="events-content list-group">
		{foreach $all_events as $event}
			<li class="list-group-item">
			<p><a href="../../pages/events/event_feed.php?event-id={$event.id}" id="event-title"><i class="fa fa-calendar"></i> {$event.name}</a></p>
			<dl>
				<dt>Duration</dt>
				<dd>{$event.start|date_format} - {$event.finish|date_format}</dd>
			</dl>
			</li>
		{/foreach}
		</ul>
	</div>
	
	{include file='footer.tpl'}
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>

</body>

</html>