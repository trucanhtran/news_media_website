// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
//add fontawesome
import "@fortawesome/fontawesome-free/css/all.css"

require("jquery");
require("packs/search");


Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")

// function getSearchBar(searchBar, searchWidth){
//   const isClosed = searchBar.clientWidth === searchWidth;
//   console.log(isClosed);
//   if (isClosed){
//     searchBar.style.width = "200px";
//   }
//   else {
//     searchBar.style.width = "4px";
//   }

// }


// $(document).ready(function(){

// var searchBar = document.getElementById("id_search_bar")
// var searchWidth = searchBar.clientWidth

//   $(document).on("click", "#id_search", function(){

//     getSearchBar(searchBar, searchWidth);
//   })
// })

