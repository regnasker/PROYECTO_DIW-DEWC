$(document).ready(function(){

  var idButton = "nada";
  $(".navegacion button").click(function () {
    if (idButton != this.id) {
      $("#"+idButton).css("border-color","#343434");
      $(this).css("border-color","#45b5c6");
      idButton = this.id;
    }
  });
});
