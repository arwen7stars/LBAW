/*
* Global variables
*/
var searchBar = null;
var searchResults = null;
var activeRequest = null;
var minLetters = 3;


/**
* Handler for keyup on search bar
*/
var searchHandler = function(event) {

  searchResults.html("");

  var query = searchBar.val();

  if (query.length < minLetters) {
    return;
  }

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
        searchResults.append("<li>" + data[i].name + "</li>");
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

});
