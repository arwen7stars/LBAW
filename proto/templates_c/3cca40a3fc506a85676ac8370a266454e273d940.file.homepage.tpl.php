<?php /* Smarty version Smarty-3.1.15, created on 2017-04-28 14:55:09
         compiled from "/usr/users2/mieic2014/up201404587/public_html/proto/templates/homepage.tpl" */ ?>
<?php /*%%SmartyHeaderCode:17134449395901cc246fad02-32003879%%*/if(!defined('SMARTY_DIR')) exit('no direct access allowed');
$_valid = $_smarty_tpl->decodeProperties(array (
  'file_dependency' => 
  array (
    '3cca40a3fc506a85676ac8370a266454e273d940' => 
    array (
      0 => '/usr/users2/mieic2014/up201404587/public_html/proto/templates/homepage.tpl',
      1 => 1493387708,
      2 => 'file',
    ),
  ),
  'nocache_hash' => '17134449395901cc246fad02-32003879',
  'function' => 
  array (
  ),
  'version' => 'Smarty-3.1.15',
  'unifunc' => 'content_5901cc2484b387_64127944',
  'has_nocache_code' => false,
),false); /*/%%SmartyHeaderCode%%*/?>
<?php if ($_valid && !is_callable('content_5901cc2484b387_64127944')) {function content_5901cc2484b387_64127944($_smarty_tpl) {?><!DOCTYPE html>
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
  <link href="../../css/index.css" rel="stylesheet">

</head>

<body>

<?php echo $_smarty_tpl->getSubTemplate ('header.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


  <!-- SEARCH BAR -->
  <div class="container-fluid search-bar-wrap">
    <div class="row">
      <div class="col-md-8 col-md-offset-2">
        <form>
          <div class="form-group">
            <label class="sr-only" for="search-bar">Search bar</label>
            <div class="input-group">
              <input type="search" id="search-bar" class="form-control" placeholder="Search..." autocomplete="on">
              <span class="input-group-btn">
                <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
              </span>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>

<div class="container-fluid news-section-wrap">

    <div class="row">
	
      <div class="news-section col-md-10 col-md-offset-1">
        <h1>News</h1>
		
        <div class="news">
		
          <div class="news-body">
            <h2>Mauris a magna ante</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin eu enim augue. Quisque mollis nisi eget urna rutrum laoreet. Nunc vehicula arcu diam, vel elementum nisi pretium nec. Suspendisse sollicitudin neque sed lacus condimentum maximus. Sed id lacus eget velit luctus consequat. Etiam efficitur dui eget ante ornare, quis dapibus ipsum elementum. Ut sit amet iaculis turpis. Sed convallis mi sed libero vestibulum cursus. Sed ut neque urna. Duis sodales urna pellentesque tellus scelerisque lacinia. Quisque vitae enim condimentum, feugiat lectus id, eleifend sapien.</p>
          </div>
		  
          <div class="read-more"><a href="#">Read more...</a></div>
		  
        </div>
		
        <div class="news">
		
          <div class="news-body">
            <h2>Maecenas volutpat accumsan ornare</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean id blandit lacus. Nunc blandit tellus ut est tempor, vitae tristique tellus blandit. In lectus urna, euismod ac tristique non, vehicula id ipsum. Curabitur ultrices, urna vitae imperdiet imperdiet, nisi ligula vehicula ligula, vitae mattis dolor ante at elit. Fusce at elit ante. Aliquam porttitor maximus leo, quis rutrum quam ultrices vitae. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.</p>
          </div>
		  
          <div class="read-more">
			<a href="#">Read more...</a>
		  </div>
		  
        </div>
		
        <div class="news">
		
          <div class="news-body">
            <h2>Aliquam erat volutpat</h2>
            <p>Ut aliquam lorem id ultricies porta. Aliquam iaculis pulvinar venenatis. Donec vel ex vitae diam accumsan maximus vitae nec risus. Fusce et ex elit. Etiam laoreet magna et dui porta, id semper elit varius. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce sit amet interdum enim.</p>
          </div>
		  
          <div class="read-more">
			<a href="#">Read more...</a>
		  </div>
		  
        </div>
      </div>
    </div>
</div>

<?php echo $_smarty_tpl->getSubTemplate ('footer.tpl', $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, null, array(), 0);?>


</body>

	<!-- Placed at the end of the document so the pages load faster -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="../../lib/jquery-3.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->

</html>
<?php }} ?>
