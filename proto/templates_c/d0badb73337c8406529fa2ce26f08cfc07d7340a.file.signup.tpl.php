<?php /* Smarty version Smarty-3.1.15, created on 2017-04-27 11:47:04
         compiled from "/usr/users2/mieic2014/up201404587/public_html/proto/templates/signup/signup.tpl" */ ?>
<?php /*%%SmartyHeaderCode:2744678405901cc289965d1-28705533%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'd0badb73337c8406529fa2ce26f08cfc07d7340a' => 
    array (
      0 => '/usr/users2/mieic2014/up201404587/public_html/proto/templates/signup/signup.tpl',
      1 => 1493289716,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '2744678405901cc289965d1-28705533',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5901cc28a41084_04408701',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5901cc28a41084_04408701')) {function content_5901cc28a41084_04408701($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

  <title>Sign Up</title>

  <!-- Bootstrap -->
  <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <!-- Default stylesheet -->
  <link href="../../css/default.css" rel="stylesheet">
  <link href="../../css/forms.css" rel="stylesheet">
  <link href="../../css/index.css" rel="stylesheet">
  
</head>

<body>

<?php echo $_smarty_tpl->getSubTemplate ('header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<div class="container">
	<div class="row">
	<div class="forms col-lg-1 col-centered">
		<h2>Register</h2>

		<form>
			<fieldset>
				<p><label for="username">Username (only letters and numbers)</label>
				<input type="username" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Type username"></p>


				<p><label for="name">Name (only letters and spaces)</label>
				<input type="password" class="form-control" id="name" placeholder="Type your name"></p>

				<p><label for="email">E-mail address</label>
				<input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="Type your e-mail address"></p>

				<p><label for="password">Password</label>
				<input type="password" class="form-control" id="password" placeholder="Type password"></p>							

				<p><label for="repeat_password">Repeat password</label>
				<input type="password" class="form-control" id="repeat_password" placeholder="Repeat password"></p>					

				<p><label for="dateofbirth">Birthday</label>
				<input type="date" class="form-control" id="dateofbirth" placeholder="Date of Birth"></p>

				<p><button type="submit" class="submit btn btn-primary">Register</button></p>
			</fieldset>
		</form>
	</div></div></div>
	
<?php echo $_smarty_tpl->getSubTemplate ('footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


</body>

<!-- Placed at the end of the document so the pages load faster -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="../../lib/jquery-3.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>

</html><?php }} ?>
