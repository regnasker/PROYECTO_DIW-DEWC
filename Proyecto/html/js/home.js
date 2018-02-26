$(document).ready(function() {

        if (sessionStorage.getItem("token")) {
          $(".login").hide();
          $("#log").css({"background-color":"#45b5c6","margin-left":"15px"}).append("¡Bienvenido/a!");
          $("<button></button>").attr("id","logOut").append("LogOut").appendTo("#log").css({"background-color":"white","border":"1px solid white","border-radius":"5px","padding":"10px","float":"right","cursor":"pointer"});
        }


        $("#login").click(function(e){
          e.preventDefault();
          console.log($("#usr").val());
          $.post("../php/login.php",{
            usr: $("#usr").val(), pass: $("#pass").val()
          },
          function(datos, st){
            sessionStorage.setItem("token", datos.token);
            if (sessionStorage.getItem("token")) {
              $(".login").hide();
              $("#log").css({"background-color":"#45b5c6","margin-left":"15px"}).append("¡Bienvenido/a! " + $("#usr").val());
              $("<button></button>").attr("id","logOut").append("LogOut").appendTo("#log").css({"background-color":"white","border":"1px solid white","border-radius":"5px","padding":"10px","float":"right","cursor":"pointer"});
            }

          });
        });
        $("#logOut").click(function () {
          sessionStorage.removeItem("token");
          $(".login").show();
          $("#log").hide();
        });


    	});
