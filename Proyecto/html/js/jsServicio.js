"use strict";

$(document).ready(function(){
var miarray = new Array ();






$.getJSON("../php/products.php", function(datos){

    $.each(datos.products, function(i, campo){
      // miarray = datos.products;
        if (campo.category_id==9) {
          miarray.push(datos.products[i]);

            console.log(campo.img);
            $("<div></div>").attr("class","descrip col-md-8").attr("id",campo.name+"descrip").css({"background-image": "url(.."+campo.img+")","background-repeat": "no-repeat","background-size": "100% 100%","margin":"0px"}).empty().appendTo(".servicios");
            $("<div></div>").attr("id",campo.name+"mapa").attr("class","mapa col-md-4 embed-responsive embed-responsive-16by9").appendTo(".servicios");
            $("<p></p>").attr("class","nombre").text("Nombre:").css({"margin-top":"4em","margin-left":"4em"}).appendTo("#"+campo.name+"descrip");
            $("<p></p>").attr("class","aforo").text("Aforo:").css({"margin-left":"4em"}).appendTo("#"+campo.name+"descrip");
            $("<p></p>").attr("class","aforo").text("Precio:").css({"margin-left":"4em"}).appendTo("#"+campo.name+"descrip");
            $("<button></button>").attr({"class":"col-6 offset-3 boton","type":"button","name":"button"}).text("Contratar").css({"margin-top":"4em","padding": "10px", "float": "right", "background-color": "#62D850", "border": "1px solid #62D850",
            "border-radius": "5px", "cursor":"pointer"}).appendTo("#"+campo.name+"descrip");

    };
});
console.log(miarray);
$.getJSON("../php/stores.php", function(datos){

  // console.log(datos);


    $.each(datos.stores, function(i, campo){ 
        // console.log(campo.mapa);
        console.log("#"+campo.name+" mapa");
            $(campo.mapa).appendTo("#"+campo.name+"mapa");
    });
  });
});


});
