<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Profile</title>
    <!-- Bootstrap -->
    <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <!-- Default stylesheet -->
    <link href="../../css/profile.css" rel="stylesheet">
    <link href="../../css/default.css" rel="stylesheet">
    <link href="../../css/edit.css" rel="stylesheet">
</head>

<body>
	{include file='header_logged.tpl'}
	<div id="edit">
		<h2>Edit Profile</h2>
		<hr>
		<form><fieldset>
			<p class="formfield"><label>Name</label>
			<input class="form-control" type="username" id="name" value="Tear Grants" class="table-form"></p>
			<p class="formfield"><label>Birthday</label>
			<input class="form-control" type="date" id="dateofbirth" value="2001-05-13"></p>
			<p class="formfield"><label for="location">Location</label>
			<input class="form-control" type="username" id="location" value="Qliphoth"></p>
			<p class="formfield"><label for="about">About</label>
			<textarea class="form-control txtarea-comment" rows="3">Tear Grants, birth name Mystearica Aura Fende, is the main female protagonist in Tales of the Abyss. She is a Seventh Fonist in the military wing of the Order of Lorelei, the religion overseeing Yulia Jue's Score. She lost both parents when she was still an infant, and has been raised as a warrior ever since. Tear is staid and reserved, giving her a cold air, but when not chastising Luke, she is polite and respectful to all, particularly to those in...(line truncated)...
			</textarea>		
			<button type="submit" class="btn btn-primary">Submit</button>
		</fieldset></form>
	</div>

	<!-- Placed at the end of the document so the pages load faster -->
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="../../lib/jquery-3.1.1.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
</body>

</html>