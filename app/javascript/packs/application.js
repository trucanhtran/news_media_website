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

function displayComment(data){
  var node = document.createElement("div");
  var textNode = document.createTextNode(data.content);
  console.log(data.content)
  node.appendChild(textNode);
  document.getElementById("id_list_comment").appendChild(node);

}

$(document).ready(function(){

  $(document).on("click", "#id_submit_comment", function(){
    const comment = $("#id_new_comment").val();
    const userId = $("#id_current_user").text();
    const articleId = $("#id_current_article").text();
      if(userId === ""){
        alert("Bạn cần đăng nhập để thực hiện chức năng này!");
      }
      else{
        $.post("/binh-luan", {comment: comment, userId: userId, articleId: articleId}, function(data){
          displayComment(data);
        })
      }

  })
})
