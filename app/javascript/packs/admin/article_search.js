$(document).ready(function(){

  function handleDisplayUser(data){
    document.getElementById("id_articles_list").innerHTML = "";
    for (var i = 0; i < data.length;i++){
      var node = document.createElement("tr");
      var rowTitle = document.createElement("td");
      var textNode = document.createTextNode(data[i].title);
      rowTitle.appendChild(textNode);
      node.appendChild(rowTitle);
      document.getElementById("id_articles_list").appendChild(node);
    }
  }

  $(document).on("change", "#id_date", function(event){
    const value = event.target.value;
    $.post("/admin/articles/sort_by_date",{date: value}, function(data, status){
      handleDisplayUser(data);
    });
  });

});
