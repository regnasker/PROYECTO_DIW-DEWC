addEventListener('DOMContentLoaded',function(){


  function ponFoco(e){
    e.target.style.outline = "purple solid 1px";
    //hay que cambiar esto para adecuarlo a nuestra guía de estilo
  }

  function quitaFoco(e){
    e.target.style.outline = "none";
    //OTRA FORMA:
    //si cambiamos el estilo del borde, podemos restaurarlo así:
    //e.target.style.outline ="none";
    //e.target.style.borderColor = "initial";
    //e.target.style.borderStyle = "inset";
  }

  //Selecciono los nodos inputs
  var inputs = document.getElementsByTagName("input");

  for (var i = 0; i < (inputs.length - 1); i++) {
    inputs[i].addEventListener('focus',ponFoco);
    inputs[i].addEventListener('blur',quitaFoco);
  }



  document.getElementById('formulario').addEventListener('submit',function(e){

    e.preventDefault();


    var ret = true;


    var nom = document.getElementsByName('nombre')[0].value;
    if ( !nom || !(/^\S+[\s?\S+]*$/.test(nom))){
         errList += "El nombre es erróneo <br/>"
         ret = false;
    }


    var apellidos = document.getElementsByName('apellidos')[0].value;
    if (apellidos == null || apellidos.length == 0 || !(/^\S+[\s?\S+]*$/.test(apellidos))){
      ret = false;
      errList += "Hay un error en los apellidos <br/>";
    }


    var email = document.getElementsByName("email")[0].value;
    if ( ! (/^\w+([\.\-\+]?\w+)*@\w+([\.\-]?\w+)*(\.\w{2,4})+$/.test(email)) ){
      errList += "El email es incorrecto <br/>";
      ret = false;
    }
    var emailRepe = document.getElementById("repetirEmail").value;
    if(email != emailRepe){
      errList += "El email repetido debe coincidir con el primer email que introdujo <br/>";
      ret = false;
    }




    //validamos la fecha:
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
      errList += "La fecha es errónea <br/>"
      ret = false;
    }else if (edad < 18){
      errList += "Debe ser mayor de edad para inscribirse <br/>"
      ret = false;
    }

    



    if (ret){
      //Si estoy aquí, voy a enviar el formulario y todo ha ido bien
      //Justo antes de enviar el formulario, puedes deshabilitar el botón de Envío para que no exista rebote
      document.getElementById("enviar").value = "Enviando...";
      document.getElementById("enviar").disabled = true;

      //Si todo va bien envío el formulario
      document.forms[0].submit();
    }else{
      err.style.color="red";
      err.innerHTML = errList;
    }

  });

});
