addEventListener('DOMContentLoaded',function(){





  var inputs = document.getElementsByTagName("input");

  for (var i = 0; i < (inputs.length - 1); i++) {
    inputs[i].addEventListener('focus',ponFoco);
    inputs[i].addEventListener('blur',quitaFoco);
  }



  document.getElementById('formularioUsuario').addEventListener('submit',function(e){

    e.preventDefault();


    var ret = true;


    var nom = document.getElementsByName('nombre')[0].value;
    if ( !nom || !(/^\S+[\s?\S+]*$/.test(nom))){

         ret = false;
    }


    var apellidos = document.getElementsByName('apellidos')[0].value;
    if (apellidos == null || apellidos.length == 0 || !(/^\S+[\s?\S+]*$/.test(apellidos))){
      ret = false;

    }


    var email = document.getElementsByName("email")[0].value;
    if ( ! (/^\w+([\.\-\+]?\w+)*@\w+([\.\-]?\w+)*(\.\w{2,4})+$/.test(email)) ){

      ret = false;
    }
    var emailRepe = document.getElementById("repetirEmail").value;
    if(email != emailRepe){

      ret = false;
    }





    var fecha = (document.getElementsByName('fecha')[0].value).split('-');
    var ano=fecha[0];
    var mes=fecha[1];
    var dia=fecha[2];
    console.log(dia + " " + mes + " " + " " + ano);
    var nf= new Date(ano,(mes - 1),dia);
    console.log(nf);

    var hoy = new Date();
    var edad = hoy.getFullYear()- ano - 1;

    if (hoy.getMonth() + 1 - mes > 0){
      edad++;
    }

    if (hoy.getUTCDate() - dia >= 0){
      edad++;
    }

    console.log("Edad " + edad);

    if ( isNaN(nf) || dia < 1 || dia > 31 || mes < 1 || mes > 12 || ano < 0 || ano >= hoy.getFullYear()){

      ret = false;
    }else if (edad < 18){

      ret = false;
    }


    // if ($("#S").change()) {
    //   $("#instrumento").show();
    // }



    if (ret){

      document.getElementById("enviar").value = "Enviando...";
      document.getElementById("enviar").disabled = true;


      document.forms[0].submit();
    }else{
      err.style.color="red";

    }

  });

});
