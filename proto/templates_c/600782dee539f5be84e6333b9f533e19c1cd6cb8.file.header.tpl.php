<?php /* Smarty version Smarty-3.1.15, created on 2017-05-09 20:12:13
         compiled from "C:\xampp\htdocs\myfiles\LBAW\proto\templates\header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:159405912148d8e5d92-86054487%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '600782dee539f5be84e6333b9f533e19c1cd6cb8' => 
    array (
      0 => 'C:\\xampp\\htdocs\\myfiles\\LBAW\\proto\\templates\\header.tpl',
      1 => 1493559022,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '159405912148d8e5d92-86054487',
  'function' => 
  array (
  ),
  'variables' => 
  array (
    'BASE_DIR' => 0,
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5912148d957c59_48426203',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5912148d957c59_48426203')) {function content_5912148d957c59_48426203($_smarty_tpl) {?>
   <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container-fluid">
        <div class="navbar-header">
          <!-- Menu for mobile display -->
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!-- Website logo -->
          <a class="navbar-brand" href="<?php echo $_smarty_tpl->tpl_vars['BASE_DIR']->value;?>
index.php"><img alt="Brand" src="../../images/logo.png"></a>
        </div>

        <!-- Navbar content (collapsed in mobile view) -->
        <div id="navbar" class="navbar-collapse collapse">

          <!-- Float right -->
		  <ul class="nav navbar-nav navbar-right">
			<li><a href="../../pages/users/signup.php"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="../../pages/users/login.php"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
		</ul>
		  

          <!--  Search bar -->
          <form role="search">
            <div class="form-group">
              <label for="search-bar" class="sr-only">Search bar</label>
              <div class="input-group navbar-search-bar">
                <input type="search" class="form-control" placeholder="Search...">
                <span class="input-group-btn">
                  <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                </span>
              </div>
            </div>
          </form>
        </div>
      </div>
    </nav><?php }} ?>
