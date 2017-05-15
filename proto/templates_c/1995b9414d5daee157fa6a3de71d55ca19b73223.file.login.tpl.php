<?php /* Smarty version Smarty-3.1.15, created on 2017-05-09 20:12:23
         compiled from "C:\xampp\htdocs\myfiles\LBAW\proto\templates\login\login.tpl" */ ?>
<?php /*%%SmartyHeaderCode:3140859121497cf78d4-07871860%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '1995b9414d5daee157fa6a3de71d55ca19b73223' => 
    array (
      0 => 'C:\\xampp\\htdocs\\myfiles\\LBAW\\proto\\templates\\login\\login.tpl',
      1 => 1493559022,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '3140859121497cf78d4-07871860',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_59121497ded041_07918055',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_59121497ded041_07918055')) {function content_59121497ded041_07918055($_smarty_tpl) {?><!DOCTYPE html>
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
