<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>Anibook - Homepage</title>
	<!-- Bootstrap -->
	<link href="../../lib/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<link href="../../css/default.css" rel="stylesheet">
	<link href="../../css/homepage.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Open+Sans" />
</head>

<body>

{include file='header.tpl'}

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
				<div class="search-results-wrap">
					<ul>
					</ul>
				</div>
      </div>
    </div>
  </div>

<div class="container-fluid news-section-wrap">

    <div class="row">

      <div class="news-section col-md-10 col-md-offset-1">
        <h1 id="news-title">News</h1>
		{foreach $news as $recentNews}
        <div class="news">
          <div class="news-body">
            <a href="{$recentNews.moreInfo}"><h2>{$recentNews.title}</h2></a>
            <p>{$recentNews.body}</p>
          </div>
          <div class="read-more"><a href="{$recentNews.moreInfo}"><h4>Read more...</h4></a></div>
        </div>
		{/foreach}

      </div>
    </div>
</div>

{include file='footer.tpl'}

  <!-- Placed at the end of the document so the pages load faster -->
  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="../../lib/jquery-3.1.1.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
  <script src="../../lib/bootstrap-3.3.7/js/bootstrap.min.js"></script>
  <!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="../../javascript/search-bar.js"></script>
</body>

</html>
