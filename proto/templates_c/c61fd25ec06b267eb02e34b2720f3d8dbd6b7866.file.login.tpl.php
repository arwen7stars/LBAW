<?php /* Smarty version Smarty-3.1.15, created on 2017-04-28 15:16:34
         compiled from "/home/tirafesi/Downloads/proto/templates/login/login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:116055205659034ec20bc630-97669240%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'c61fd25ec06b267eb02e34b2720f3d8dbd6b7866' => 
    array (
      0 => '/home/tirafesi/Downloads/proto/templates/login/login.tpl',
      1 => 1493289718,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '116055205659034ec20bc630-97669240',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_59034ec20d26a1_48355663',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_59034ec20d26a1_48355663')) {function content_59034ec20d26a1_48355663($_smarty_tpl) {?><!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Homepage</title>
  <!-- Bootstrap -->
  <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link href="../../css/default.css" rel="stylesheet">
  <link href="../../css/forms.css" rel="stylesheet">

</head>

<body>

<?php echo $_smarty_tpl->getSubTemplate ('../header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


<div class="container">
	<div class="row">
		<div class="forms col-lg-1 col-centered">
			<h2>Login</h2>
			<form id="login" method="post" action="../../actions/users/login.php">
				<fieldset>
					<p><label for="username">Username</label>
					<input type="username" class="form-control" id="username" name="username" aria-describedby="emailHelp" placeholder="Username"></p>
					
					<p><label for="password">Password</label>
					<input type="password" class="form-control" id="password" name="password" placeholder="Password"></p>							

					<p><button type="submit" class="submit btn btn-primary">Login</button></p>
				</fieldset>
			</form>
		</div>
	</div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ('../footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


</body>

<!-- Placed at the end of the document so the pages load faster -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="../../lib/jquery-3.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>

</html>
<?php }} ?>
