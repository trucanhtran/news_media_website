function displayData(data){
  document.getElementById("id_article_list").innerHTML="";
  for (var i = 0; i < data.length; i++){
    var node = document.createElement("div");
    var textNode = document.createTextNode(data[i].title);
    node.appendChild(textNode);
    document.getElementById("id_article_list").appendChild(node);
  }
}

$(document).ready(function(){
  $(document).on("keypress", "#id_search_input", function(event){
    const keyword = event.target.value;
    $.post("/search_items", {keyword: keyword}, function(data){
      displayData(data);
    })
  })
})
