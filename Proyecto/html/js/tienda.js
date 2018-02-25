$(document).ready(function () {
  $.getJSON("../php/products.php", function (data, st, xhr) {
    if (st == "success") {
        var array = new Array();
        $.each(data.products, function (i, campo){
         if (campo.category_id < 9) {
           array.push(data.products[i]);
         }
      });
      $.each(array, function (i, campo){
          if (i % 4 == 0) {
            $("<div></div>").attr({"class": "row productos","id":"productos"+i}).appendTo("#productosTienda");
            x = i;
          }
          $("<div></div>").attr({"class":"product col-md-2 col-5","id":"proID"+campo.product_id}).css({"background":"#dfdfdf","height":"300px","padding":"0px"}).appendTo("#productos"+x);
          $("<img></img>").attr({"src":".."+campo.img,"alt":campo.name,"class":"img-fluid"}).appendTo("#proID"+campo.product_id);
          $("<div></div>").attr({"class":"col-12","id":"capt"+campo.product_id}).appendTo("#proID"+campo.product_id);
          $("<p><strong>"+campo.name+"</strong></p>").appendTo("#capt"+campo.product_id);
          $("<p><strong>"+campo.price+" €</strong></p>").css("font-size","20px").appendTo("#capt"+campo.product_id);
          $("<button></button>")
            .attr({"id":"comp"+campo.product_id})
            .attr("class", "addToCart")
            .click(addToCart)
            .appendTo("#capt"+campo.product_id)
            .append("Comprar");
    });
    //EVENTOS DE FILTRO
    $("#filtro").click(function () {
      var check = $("input:checked").val();
      if ( check == "asc") {
        orderByPriceAsc(array);
      }else if(check == "desc"){
        orderByPriceDesc(array);
      }else if (check == "az") {
        orderByAz(array);
      }else if (check == "za") {
        orderByZa(array);
      }
      $("#productosTienda").empty();
      $.each(array, function (i, campo){
          if (i % 4 == 0) {
            $("<div></div>").attr({"class": "row productos","id":"productos"+i}).appendTo("#productosTienda");
            x = i;
          }
          $("<div></div>").attr({"class":"product col-md-2 col-5","id":"proID"+campo.product_id}).css({"background":"#dfdfdf","height":"300px","padding":"0px"}).appendTo("#productos"+x);
          $("<img></img>").attr({"src":".."+campo.img,"alt":campo.name,"class":"img-fluid"}).appendTo("#proID"+campo.product_id);
          $("<div></div>").attr({"class":"col-12","id":"capt"+campo.product_id}).appendTo("#proID"+campo.product_id);
          $("<p><strong>"+campo.name+"</strong></p>").appendTo("#capt"+campo.product_id);
          $("<p><strong>"+campo.price+" €</strong></p>").css("font-size","20px").appendTo("#capt"+campo.product_id);
          $("<button></button>").attr({"id":"comp"+campo.product_id}).appendTo("#capt"+campo.product_id).append("Comprar");
    });
    });
    }else{
      alert(xhr.statusText);
    }
  });
  function orderByPriceDesc(array) {
    array.sort(function (n1,n2){
        return n1.price - n2.price;
    });
  }
  function orderByPriceAsc(array) {
    array.sort(function (n1,n2){
        return n2.price - n1.price;
    });
  }
  function orderByAz(array){
  array.sort(function (a,b) {
    var alow = a.name.toLowerCase();
    var blow = b.name.toLowerCase();
    if (alow < blow) {
      return -1;
    }
    if (alow > blow) {
      return 1;
    }
    return 0;
  });
  }
  function orderByZa(array){
    array.sort(function (a,b) {
      var alow = a.name.toLowerCase();
      var blow = b.name.toLowerCase();
      if (alow < blow) {
        return 1;
      }
      if (alow > blow) {
        return -1;
      }
      return 0;
    });
  }

  function addToCart(item) {
    if (localStorage.itemsCart) {
      localStorage.itemsCart = Number(localStorage.itemsCart) + 1;
    } else {
      localStorage.itemsCart = 1;
    }
    renderMiniCart();
  }

  function renderMiniCart() {
    var items = localStorage.itemsCart;
    if(!items) {
      items = 0
    }
    $("#minicart").text(items)
  }

  renderMiniCart();
});
