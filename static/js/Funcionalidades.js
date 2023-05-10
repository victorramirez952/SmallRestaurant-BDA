$(document).ready(function () {
    $(".mesaCaja").click(function() {
        let mesa = $(this).find("div");
        // .toggleClass("bg-blue-600 border-blue-500");
        if (mesa.hasClass("bg-gray-300")) {
          $("#alertMesasSeleccionadas").text("");
          mesa.removeClass("bg-gray-300 border-gray-200");
          mesa.addClass("bg-green-600");
          $(this).attr('data-mesa-selected', 'true');
          } else {
              mesa.removeClass("bg-green-600");
              mesa.addClass("bg-gray-300 border-gray-200");
              $(this).attr('data-mesa-selected', 'false');
          }
      });

    //   ***************************************
    $(".btnMasProducto").click(function() {
        var input = $(this).siblings('input[type="number"]');
        var value = parseInt(input.val());
        input.val(value + 1);
      });

    //   ***************************************
    $(".btnMenosProducto").click(function() {
        var input = $(this).siblings('input[type="number"]');
        var value = parseInt(input.val());
        if(value != 0) input.val(value - 1);
      });

      //   ***************************************
    $(".btnCloseModalProducto").click(function() {
        $("#modalProducto").hide();
      });

      //   ***************************************
      //   ***************************************
      $(".platillo").click(function(event) {
        // Check if the clicked element is not a descendant of either excluded div
      if (!$(event.target).closest('.containerButtons, .btnAgregarCarrito').length) {
        // Do something if the click was not on an excluded div
        let platillo = $(this).find(".nombrePlatillo");
        let descripcion = $(this).find(".descripcionPlatillo");
        let precioPlatillo = $(this).find(".precioPlatillo");
        $("#modalProducto .modalNombrePlatillo").text(platillo.text());
        $("#modalProducto .modalDescripcionPlatillo").text(descripcion.text());
        $("#modalProducto .modalPrecioPlatillo").text(precioPlatillo.text());
        $("#modalProducto").css("display", "flex");
      }
      });

      //   ***************************************
      //   ***************************************
      $(".btnModalAgregarPedido").click(function() {
        $("#modalAgregarPedido").css("display", "flex");
      });

      $(".btnCloseModalAgregarPedido").click(function() {
        $("#modalAgregarPedido").hide();
      });

      //   ***************************************
      //   ***************************************
      var mesasIds = [];
      $("#btnContinuarMesas").click(function() {
        let selectedMesas = $('.containerMesas div[data-mesa-selected="true"]');
        selectedMesas.each(function() {
          mesasIds.push($(this).data('mesa-id'));
        });
        if(mesasIds.length != 0){
          $('#formMesas input[name="mesasSeleccionadas"]').val(mesasIds.join(','));
          mesasIds = [];
          $('#formMesas').submit();
        }
        else $("#alertMesasSeleccionadas").text("Selecciona al menos una mesa");
      });

      //   ***************************************
      //   ***************************************
      $(".btnCloseAlertLogin").click(function() {
        $(".alertLogin").hide();
      });

      //   ***************************************
      //   ***************************************
      $('#passwordB').on('input', function() {
        let passwordA = $("#passwordA").val();
        let passwordB = $(this).val();
        if(passwordA.length != 0 && passwordA != passwordB){
          $("#mensajeAlertSignUp").text("Las contraseñas no son iguales");
          $("#passwordB").addClass("bg-red-400");
        } else{
          $("#passwordB").removeClass("bg-red-400");
          $(".alertSignUp").removeClass("relative");
          $(".alertSignUp").addClass("hidden");
        }
      });

      $('#passwordA').on('input', function() {
        let passwordA = $(this).val();
        let passwordB = $("#passwordB").val();
        if(passwordB.length != 0 && passwordA != passwordB){
          $("#mensajeAlertSignUp").text("Las contraseñas no son iguales");
          $("#passwordB").addClass("bg-red-400");
        } else{
          $("#passwordB").removeClass("bg-red-400");
          $(".alertSignUp").removeClass("relative");
          $(".alertSignUp").addClass("hidden");
        }
      });

      $('#btnCrearCuenta').click(function() {
        let fullname = $('#formSignUp input[name="fullname"]').val();
        let correo = $('#formSignUp input[name="correo"]').val();
        let passwordA = $("#passwordA").val();
        let passwordB = $("#passwordB").val();
        let formularioCompleto = true;
        $.each([fullname, correo, passwordA, passwordB], function(index, variable) {
          if (!variable) {
            formularioCompleto = false;
            return false; // Detener la iteración
          }
        });
        if(!formularioCompleto){
          $("#mensajeAlertSignUp").text("Debe llenar todos los campos");
          $(".alertSignUp").removeClass("hidden");
          $(".alertSignUp").addClass("relative");
        } else if(passwordB.length != 0 && passwordA == passwordB){
          $.ajax({
            url: '/procesarFormulario',
            type: 'get',
            contentType: 'aplication/json',
            data:{
              correo: correo
            },
            success: function(response){
              if(response.existe == 'True'){
                $("#mensajeAlertSignUp").text("Usuario ya existente");
                $(".alertSignUp").removeClass("hidden");
                $(".alertSignUp").addClass("relative");
              } else {
                $("#formSignUp").submit();
              }
            },
            error: function(error){
              alert("Hubo un error");
            }
          })
        } else{
          $("#mensajeAlertSignUp").text("Las contraseñas no son iguales");
          $(".alertSignUp").removeClass("hidden");
          $(".alertSignUp").addClass("relative");
        }
      });

      $('.btnCloseAlertSignUp').click(function() {
        $(".alertSignUp").removeClass("relative");
        $(".alertSignUp").addClass("hidden");
      });

  });
  