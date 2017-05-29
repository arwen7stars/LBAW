/*
* Global variables
*/
var searchBar = null;
var searchResults = null;
var activeRequest = null;


/**
* Handler for keyup on search bar
*/
var searchHandler = function() {

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

      for (var i = 0; i < data.length; i++) {
        console.log(data[i]);
        var li = "<li><a href=../users/profile_feed.php?user-id=" + data[i].user_id + "><img src=\"" + data[i].char_img_url + "\" alt = \" character picture\"/>" + data[i].char_name + "</a></li>";
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
    searchResults.html("");
    searchBar.val("");
  });

  searchBar.click(function(event) {
    event.stopPropagation();
  });

});
