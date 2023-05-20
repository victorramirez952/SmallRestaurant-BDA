$(document).ready(function () {
    let mesasSeleccionadas = []
    $(".mesaCaja").click(function() {
        let mesa = $(this).find("div");
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
        let idProducto = $(this).find("input[name='idProducto']").val();
        let descripcion = $(this).find(".descripcionPlatillo");
        let precioPlatillo = $(this).find(".precioPlatillo");
        $("#formModalAgregarCarrito input[name='idProducto']").val(idProducto);
        $("#formModalAgregarCarrito .modalNombrePlatillo").text(platillo.text());
        $("#formModalAgregarCarrito .modalDescripcionPlatillo").text(descripcion.text());
        $("#formModalAgregarCarrito .modalPrecioPlatillo").text(precioPlatillo.text());
        $("#modalProducto").css("display", "flex");
      }
      });

      $(".btnMasProductoMenu").click(function() {
        let input = $(this).siblings('input[type="number"]');
        let value = parseInt(input.val());
        input.val(value + 1);
      });

    //   ***************************************
    $(".btnMenosProductoMenu").click(function() {
        let input = $(this).siblings('input[type="number"]');
        let value = parseInt(input.val());
        if(value > 0)input.val(value - 1);
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
          console.log(mesasIds);
        });
        if(mesasIds.length != 0){
          // $('#formMesasSeleccionadas input[name="mesasSeleccionadas"]').val(mesasIds.join(','));
          $('#mesasIdsHidden').val(JSON.stringify(mesasIds));
          mesasIds = [];
          $('#formMesasSeleccionadas').submit();
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
      $('#btnBuscarHorarios').on('click', function(event) {
        event.preventDefault();
        let noPersonas = $('#formularioReservacion select[name="noPersonas"]').val();
        let fecha = $('#formularioReservacion input[name="fecha"]').val();
        let horario = $('#formularioReservacion select[name="horario"]').val();
        if(!noPersonas || !fecha || !horario){
          $('#formularioReservacion')[0].reportValidity();
          return;
        }
        // Convertir el horario ingresado a un objeto de fecha
        let timeParts = horario.split(':'); // Dividir el horario en horas y minutos
        let selectedTime = new Date(); // Crear un objeto de fecha actual

        // Establecer las horas y minutos del objeto de fecha
        selectedTime.setHours(parseInt(timeParts[0]));
        selectedTime.setMinutes(parseInt(timeParts[1]));
        selectedTime.setSeconds(0); // Establecer los segundos a 0
        
        // Definir los límites de horarios
        let startTime = new Date();
        startTime.setHours(8);
        startTime.setMinutes(30);
        startTime.setSeconds(0);

        let endTime = new Date();
        endTime.setHours(22);
        endTime.setMinutes(30);
        endTime.setSeconds(0);
        
        // Definir la cantidad máxima de horarios más tempranos y más tardíos
        let maxHorariosTempranos = 2;
        let maxHorariosTardios = 2;
        
        // Definir el intervalo de tiempo en minutos
        let intervalMinutes = 30;
        
        // Calcular los horarios cercanos
        let nearbyTimes = [];
        
        // Obtener los horarios más tempranos
        let current = new Date(selectedTime);
        for (let i = 0; i < maxHorariosTempranos; i++) {
          current.setMinutes(current.getMinutes() - intervalMinutes);
          if (current >= startTime) {
            nearbyTimes.unshift(new Date(current));
          }
        }
        
        // Agregar el horario ingresado por el usuario
        nearbyTimes.push(selectedTime);
        
        // Obtener los horarios más tardíos
        current = new Date(selectedTime);
        for (let i = 0; i < maxHorariosTardios; i++) {
          current.setMinutes(current.getMinutes() + intervalMinutes);
          if (current <= endTime) {
            nearbyTimes.push(new Date(current));
          }
        }
        
        // Generar los botones en el contenedor
        let container = $('#contenedorResultadosHorarios');
        container.empty();
        
        $.each(nearbyTimes, function(index, time) {
          let formattedTime = time.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
          let button = $('<button>')
            .attr('type', 'button')
            .attr('data-horario', formattedTime)
            // .addClass('btnBuscarMesas')
            .click(clickBtnHorario = () => $("#formularioReservacion").submit())
            .addClass('bg-blue-500 text-white hover:bg-blue-700 px-4 py-2 rounded')
            .text(formattedTime);
          
          container.append(button);
        });
      });

      //   ***************************************
      //   ***************************************
      let startTime = new Date();
      startTime.setHours(8);
      startTime.setMinutes(30);
      startTime.setSeconds(0);
      
      let endTime = new Date();
      endTime.setHours(22);
      endTime.setMinutes(30);
      endTime.setSeconds(0);
      
      let intervalMinutes = 30;
      
      let selectHorario = $('#horarioBuscar');
      
      while (startTime <= endTime) {
        let formattedTime = startTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
        let option = $('<option>')
          .val(formattedTime)
          .text(formattedTime);
        
        selectHorario.append(option);
        
        startTime.setMinutes(startTime.getMinutes() + intervalMinutes);
      }

      //   ***************************************
      //   ***************************************
      $("#btnReservar").click(function(){
        let nombre = $('#formularioClienteReservacion input[name="nombre"]').val();
        let apellidoPaterno = $('#formularioClienteReservacion input[name="apellidoPaterno"]').val();
        let apellidoMaterno = $('#formularioClienteReservacion input[name="apellidoMaterno"]').val();
        let telefono = $('#formularioClienteReservacion input[name="telefono"]').val();
        let solicitudEspecial = $('#formularioClienteReservacion input[name="solicitudEspecial"]').val();

        let formularioCompleto = true;
        let form = [nombre, apellidoPaterno, apellidoMaterno, telefono]
        $.each(form, function(index, variable) {
          if (!variable) {
            formularioCompleto = false;
            return false;
          }
        });
        if(!formularioCompleto){
          $('#formularioClienteReservacion')[0].reportValidity();
          return;
        }
        $('#formularioClienteReservacion').submit();
      });

      //   ***************************************
      //   ***************************************
      $("#btnVerBebidas").click(function(){
       window.location.href = "getProductosComida";
      });

      //   ***************************************
      //   ***************************************
      $(".btnAgregarCarrito").click(function(){
        let formulario = $(this).closest(".formPlatillo")
        formulario[0].reportValidity();
        if (formulario[0].checkValidity()) {
          formulario[0].submit();  // Enviar el formulario si es válido
        }
      });

      $("#btnPagarPedido").click(function(){
        let formulario = $("#formularioPedido");
        formulario[0].reportValidity();
        if (formulario[0].checkValidity()) {
          formulario[0].submit();  // Enviar el formulario si es válido
        }
      });

      $(".btnProductosIngredientes").click(function(){
        // $(this).closest("form").submit();
      });

  });
  