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
      var rowUser = document.createElement("td");
      var textNode = document.createTextNode(data[i].user_name);
      rowUser.appendChild(textNode);
      node.appendChild(rowUser);
      var rowCategory = document.createElement("td");
      var textNode = document.createTextNode(data[i].category_name);
      rowCategory.appendChild(textNode);
      node.appendChild(rowCategory);
      var rowHotNew = document.createElement("td");
      const hotNew = data[i].hot_new ? "Hot new" : "";
      var textNode = document.createTextNode(hotNew);
      rowHotNew.appendChild(textNode);
      node.appendChild(rowHotNew);
      var rowDelete = document.createElement("td");
      var link = document.createElement("a");
      link.setAttribute('href',`${document.location.origin}/admin/delete_admin/24`);
      rowDelete.appendChild(link);
      var textNode = document.createTextNode('Xóa');
      link.appendChild(textNode);
      node.appendChild(rowDelete);
    }
  }

  $(document).on("change", "#id_date", function(event){
    const value = event.target.value;
    const page = location.search.split('?page=')[1] ?? 1;
    $.post("/admin/articles/sort_by_date",{date: value, page: page}, function(data, status){
      handleDisplayUser(data);
    });
  });

});
