<?php /* Smarty version Smarty-3.1.15, created on 2017-04-23 16:12:41
         compiled from "/opt/lbaw/lbaw1624/public_html/proto/templates/header.tpl" */ ?>
<?php /*%%SmartyHeaderCode:122758245558fcc469a306c0-05300167%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    'a77466bfe87bbadf7d0923fffc99be963ef997f0' => 
    array (
      0 => '/opt/lbaw/lbaw1624/public_html/proto/templates/header.tpl',
      1 => 1492960342,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '122758245558fcc469a306c0-05300167',
  'function' => 
  array (
  ),
  'has_nocache_code' => false,
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_58fcc469a35da7_11798372',
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_58fcc469a35da7_11798372')) {function content_58fcc469a35da7_11798372($_smarty_tpl) {?><!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>Homepage</title>
  <!-- Bootstrap -->
  <link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
  <link href="../../css/feed.css" rel="stylesheet">

</head>

<body>

    <nav class="navbar navbar-inverse">
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
          <a class="navbar-brand" href="#"><img alt="Brand" src="../../images/logo.png"></a>
        </div>

        <!-- Navbar content (collapsed in mobile view) -->
        <div id="navbar" class="navbar-collapse collapse">

          <!-- Float right -->
		  <ul class="nav navbar-nav navbar-right">
			<li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			<li><a href="feed.html"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
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
