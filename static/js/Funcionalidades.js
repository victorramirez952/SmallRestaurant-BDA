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

      $('#btnCrearCuenta').click(function(event) {
        event.preventDefault();
        let nombres = $('#formSignUp input[name="nombres"]').val();
        let apellidoPaterno = $('#formSignUp input[name="apellidoPaterno"]').val();
        let apellidoMaterno = $('#formSignUp input[name="apellidoMaterno"]').val();
        let telefono = $('#formSignUp input[name="telefono"]').val();
        let correo = $('#formSignUp input[name="correo"]').val();
        let passwordA = $("#passwordA").val();
        let passwordB = $("#passwordB").val();
        let estado = $('#selectEstados').find('option:selected').data('nombre')
        let municipio = $('#selectMunicipios').find('option:selected').data('nombre')
        let colonia = $('#selectColonias').find('option:selected').data('nombre')
        let calle = $('#formSignUp input[name="calle"]').val();
        let numeroExterior = $('#formSignUp input[name="numExterior"]').val();
        let numeroInterior = $('#formSignUp input[name="numInterior"]').val();
        let codigoPostal = $('#formSignUp input[name="codigoPostal"]').val();

        let formularioCompleto = true;
        let form = [nombres, apellidoPaterno, apellidoMaterno, telefono, correo, passwordA, passwordB, estado, municipio, colonia, calle, numeroExterior, codigoPostal]
        console.log(numeroInterior);
        $.each(form, function(index, variable) {
          if (!variable) {
            formularioCompleto = false;
            return false; // Detener la iteración
          }
        });
        if(!formularioCompleto){
          $("#mensajeAlertSignUp").text("Debe llenar todos los campos");
          $(".alertSignUp").removeClass("hidden");
          $(".alertSignUp").addClass("relative");
        } else if(codigoPostal.length > 9){
          $("#mensajeAlertSignUp").text("El codigo postal es demasiado largo");
          $(".alertSignUp").removeClass("hidden");
          $(".alertSignUp").addClass("relative");
        } else if(passwordB.length != 0 && passwordA == passwordB){
          $('#selectEstados').find('option:selected').val(estado)
          $('#selectMunicipios').find('option:selected').val(municipio)
          $('#selectColonias').find('option:selected').val(colonia)
          $("#formSignUp").submit();
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

      //   ***************************************
      //   ***************************************
      const estadosJsonUrl = 'static/json/México.min.json';
  
      let estados;

      $.getJSON(estadosJsonUrl, function(data) {
        estados = data;
        const estadosSelect = $('#selectEstados');
    
        $.each(estados, function(index, estado) {
          const optionElement = $('<option></option>').val(estado.clave).text(estado.nombre).data('nombre', estado.nombre);
          estadosSelect.append(optionElement);
        });
    
        estadosSelect.change(function() {
          const estadoClave = $(this).val();
          const municipios = estados.find(est => est.clave === estadoClave).municipios;
          const municipiosSelect = $('#selectMunicipios');
    
          municipiosSelect.empty();
    
          $.each(municipios, function(index, municipio) {
            const optionElement = $('<option></option>').val(municipio.clave).text(municipio.nombre).data('nombre', municipio.nombre);
            municipiosSelect.append(optionElement);
          });
    
          $('#selectColonias').empty();
        });
      }).fail(function(jqXHR, textStatus, errorThrown) {
        console.error('Error al obtener los estados:', textStatus, errorThrown);
      });
    
      $('#selectMunicipios').change(function() {
        const estadoClave = $('#selectEstados').val();
        const municipioClave = $(this).val();
        const municipios = estados.find(est => est.clave === estadoClave).municipios;
        const municipio = municipios.find(mun => mun.clave === municipioClave);
        const localidades = municipio.localidades;
        const localidadesSelect = $('#selectColonias');
    
        localidadesSelect.empty();
    
        $.each(localidades, function(index, localidad) {
          const optionElement = $('<option></option>').val(localidad.clave).text(localidad.nombre).data('nombre', localidad.nombre);
          localidadesSelect.append(optionElement);
        });
      });
  });
  