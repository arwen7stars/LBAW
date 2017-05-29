/*
* Global variables
*/
var searchBar = null;
var searchResults = null;
var activeRequest = null;


/**
* Handler for keyup on search bar
*/
var searchHandler = function(event) {

  searchResults.html("");

  var query = searchBar.val();

  if (activeRequest !== null) {
    activeRequest.abort();
  }

  activeRequest = $.ajax({
    type: "get",
    url: "../../database/search-bar.php",
    dataType: 'json',
    data: {"query": query}
  }).done(function(data) {

      for (var i = 0; i < data[0].length; i++) {
        console.log(data[0][i]);
        var li = "<li class=\"search_res\"><a href=../users/profile_feed.php?user-id=" + data[0][i].user_id + "><img class = \" centered-and-cropped thumb-64px\" src=\"" + data[0][i].char_img_url + "\" alt = \" character picture\"/> " + data[0][i].char_name + "</a></li>";
        searchResults.append(li);
      }
	  
	  for (var i = 0; i < data[1].length; i++) {
		console.log(data[1][i]);
        var li = "<li class=\"search_res\"><a href=../groups/feed.php?group-id=" + data[1][i].group_id +">" +  data[1][i].group_name + "</a></li>";
        searchResults.append(li);
      }
	  
	   for (var i = 0; i < data[2].length; i++) {
        console.log(data[2][i]);
        var li = "<li class=\"search_res\"><a href=../events/event_feed.php?event-id=" + data[2][i].event_id +">" +  data[2][i].event_name + "</a></li>";
        searchResults.append(li);
      }


      activeRequest = null;
	  

  }).fail(function() {

  });

};


/**
* Main
*/
$(document).ready(function() {

	searchResults = $(".search-results-wrap ul");

  searchBar = $("#search-bar");

  searchBar.keyup(searchHandler);

  $("html").click(function() {
    console.log("OLa");
    searchResults.html("");
    searchBar.val("");
  });

  searchBar.click(function(event) {
    event.stopPropagation();
  });

});
