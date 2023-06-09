$(document).ready(function () {
  // *******************************************
  $("tr").on("click", "button.btnModalTablaEditar", function () {
    var fila = $(this).closest("tr");
    var celdas = fila.find("td");
    var header = $(this).closest("table").find("thead tr th");

    var data = [];
    var headers = [];

    let i = 0;
    header.each(function (index, celda) {
      var valor = $(celda).text();
      if (valor != "Acciones" && valor != "Ingredientes") {
        headers.push(valor);
        data.push(celdas[i].innerHTML);
      }
      i++;
    });

    for (i = 0; i < data.length; i++) {
      $("#modalTablaEditarContent").append(genInput(headers[i], data[i].trim()));
    }

    // Show the modal
    $("#modalTablaEditar").css("display", "flex");
  });

  $(".btnCloseModalTablaEditar").click(function () {
    $("#modalTablaEditarContent").empty();
    $("#modalTablaEditar").hide();
  });

  // *******************************************
  //  Btn Eliminar
  $(".btnModalTablaEliminar").click(function () {
    var fila = $(this).closest("tr");
    var celdas = fila.find("td");
    var header = $(this).closest("table").find("thead tr th");
    var data = [];
    var headers = [];

    let i = 0;
    header.each(function (index, celda) {
      var valor = $(celda).text();
      if (valor != "Acciones" && valor != "Ingredientes") {
        headers.push(valor);
        data.push(celdas[i].innerHTML);
      }
      i++;
    });

    $("#idRegistro").attr('name', headers[0]).val(data[0]);
    
    // Show the modal
    $("#modalTablaEliminar").css("display", "flex");
  });

  $(".btnCloseModalTablaEliminar").click(function () {
    $("#modalTablaEliminar").hide();
  });

  // ***********************************************
   // Seleccionar el botón y agregar un evento click
   $("#btnTablaAgregar").on("click", function() {
    var headersResult = $(this).parent().parent().find("table thead tr th");
    var headers = [];
    headersResult.each(function(index, element) {
      let valor = $(element).text();
      if(valor != "Acciones" && valor != "Id" && valor != "Ingredientes"){
        headers.push(valor);
      }
    });

    for (i = 0; i < headers.length; i++) {
      $("#modalTablaAgregarContent").append(genInput(headers[i], ""));
    }

    // Show the modal
    $("#modalTablaAgregar").css("display", "flex");
  });

  $(".btnCloseModalTablaAgregar").click(function () {

    $("#modalTablaAgregarContent").empty();
    $("#modalTablaAgregar").hide();
  });

  // ***********************************************
  // *******************************************
  $("tr").on("click", "button.btnModalEditarEdoPedidoOnline", function () {
    var fila = $(this).closest("tr");
    var celdas = fila.find("td");
    var header = $(this).closest("table").find("thead tr th");

    var data = [];
    var headers = [];

    let i = 0;
    header.each(function (index, celda) {
      var valor = $(celda).text();
      let excludedHeaders = ["Id", "Fecha", "Hora", "Ubicación", "Acciones"];
      if (!excludedHeaders.includes(valor)) {
        headers.push(valor);
        data.push(celdas[i].innerHTML);
      }
      i++;
    });

    for (i = 0; i < data.length; i++) {
      $("#modalEditarEdoPedidoOnlineContent").append(genInput(headers[i], data[i]));
    }

    // Show the modal
    $("#modalEditarEdoPedidoOnline").css("display", "flex");
  });

  $(".btnCloseModalEditarEdoPedidoOnline").click(function () {
    $("#modalEditarEdoPedidoOnlineContent").empty();
    $("#modalEditarEdoPedidoOnline").hide();
  });

  // ***********************************************
  // ****************ELIMINAR CARRITO***************************
  var productId;
  $(".btnModalEliminarCarrito").click(function () {
    let idDetalleCarrito = $(this).closest('#containerProductoCarrito').find('.inputIdDetalleCarrito').val();
    let idProducto = $(this).closest('#containerProductoCarrito').find('.inputIdDetalleCarritoProducto').val();
    $("#modalIdDetalleCarrito").val(idDetalleCarrito)
    $("#modalIdDetalleCarritoProducto").val(idProducto)
    // productId = $(this).data('product-id');

    // Show the modal
    $("#modalCarritoEliminar").css("display", "flex");
  });

  $(".btnCloseModalCarritoEliminar").click(function () {
    $("#modalCarritoEliminar").hide();
  });

  // Funcionalidad movida en el archivo Fetchs.js
  // $(".btnAceptarEliminarCarrito").click(function () {
  // });

  // ***********************************************
  // ****************VACIAR CARRITO***************************
  $(".btnModalVaciarCarrito").click(function () {
    let idCarrito = $(this).closest('#containerPagar').find('.inputIdCarrito').val();
    $("#modalIdCarrito").val(idCarrito)
    $("#modalVaciarCarrito").css("display", "flex");
  });

  $(".btnCloseModalVaciarCarrito").click(function () {
    $("#modalVaciarCarrito").hide();
  });

  $(".btnAceptarVaciarCarrito").click(function () {
      $("#formVaciarCarrito").submit();
  });

  // ***********************************************
  // ****************AGREGAR AL  CARRITO***************************
  $("#btnModalAgregarProductoCarrito").click(function () {
    let idProducto = $('#formModalAgregarCarrito input[name="idProducto"]').val();
    let cantidad = $('#formModalAgregarCarrito input[name="cantidad"]').val();
    let comentarios = $('#formModalAgregarCarrito textarea[name="comentarios"]').val();
    $('#formModalAgregarCarrito')[0].reportValidity();
    if ($('#formModalAgregarCarrito')[0].checkValidity()) {
      $("#formModalAgregarCarrito").submit();  // Enviar el formulario si es válido
    }    
  });

        //   ***************************************
      //   ***************************************
      $(".btnAdminEditar").click(function(){
        let formulario = $(this).closest("form")
        formulario[0].reportValidity();
        if (formulario[0].checkValidity()) {
          formulario.submit();  // Enviar el formulario si es válido
        }
      });

      //   ***************************************
      //   ***************************************
      $(".btnAdminEliminar").click(function(){
        let formulario = $(this).closest("form")
        let nameA = $("#idRegistro").attr('name');
        let valueA = $("#idRegistro").val();
        formulario.find(".inputFormIdRegistro").attr('name', nameA).val(valueA);
        formulario.submit();
      });

      //   ***************************************
      //   ***************************************
      $(".btnAdminAgregar").click(function(event){
        event.preventDefault()
        let formulario = $(this).closest("form")
        let nameA = $("#idRegistro").attr('name');
        let valueA = $("#idRegistro").val();
        formulario.find(".inputFormIdRegistro").attr('name', nameA).val(valueA);
        formulario[0].reportValidity();
        if (formulario[0].checkValidity()) {
          formulario.submit();  // Enviar el formulario si es válido
        }
      });
});
