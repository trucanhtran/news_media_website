$(document).ready(function(){

  function handleDisplayUser(data){
    document.getElementById("id_user_list").innerHTML = "";
    for (var i = 0; i < data.length;i++){
      var node = document.createElement("tr");
      var rowName = document.createElement("td");
      var textNode = document.createTextNode(data[i].name);
      rowName.appendChild(textNode);
      node.appendChild(rowName);
      var rowEmail = document.createElement("td");
      var textNode = document.createTextNode(data[i].email);
      rowEmail.appendChild(textNode);
      node.appendChild(rowEmail);
      var rowTotal = document.createElement("td");
      var textNode = document.createTextNode(data[i].total_products);
      rowTotal.appendChild(textNode);
      node.appendChild(rowTotal);
      var rowDelete = document.createElement("td");
      var link = document.createElement("a");
      link.setAttribute('href',`${document.location.origin}/admin/delete_admin/24`);
      rowDelete.appendChild(link);
      var textNode = document.createTextNode('Xóa');
      link.appendChild(textNode);
      node.appendChild(rowDelete);
      console.log(node)
      document.getElementById("id_user_list").appendChild(node);
    }
  }

  $(document).on("change", "#id_account", function(event){
    const value = event.target.value;
    $.post("/admin/search_user_type",{user_type: value}, function(data, status){
      handleDisplayUser(data);
    });
  });

  $(document).on("change", "#id_created_at", function(event){
    const value = event.target.value;
    $.post("/admin/sort_by_date",{created_at: value}, function(data, status){
      handleDisplayUser(data);
    });
  });

  $(document).on("change", "#id_quantity", function(event){
    const value = event.target.value;
    $.post("/admin/sort_by_quantity",{quantity: value}, function(data, status){
      handleDisplayUser(data);
    });
  });


});
