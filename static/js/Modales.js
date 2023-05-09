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
      if (valor != "Acciones" && valor != "Id" && valor != "Ingredientes") {
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
    var header = $(this).closest("table").find("thead tr th");

    var data = [];
    var headers = [];

    let i = 0;
    header.each(function (index, celda) {
      var valor = $(celda).text();
      if (valor != "Acciones" && valor != "Id" && valor != "Ingredientes") {
        headers.push(valor);
      }
      i++;
    });

    // for (i = 0; i < data.length; i++) {
    //   $("#modalEliminarContent").append(genInput(headers[i], data[i]));
    // }

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
    productId = $(this).data('product-id');

    // Show the modal
    $("#modalCarritoEliminar").css("display", "flex");
  });

  $(".btnCloseModalCarritoEliminar").click(function () {
    $("#modalCarritoEliminar").hide();
  });

  $(".btnAceptarEliminarCarrito").click(function () {
    if (productId) {
      location.href = "eliminarProductoCarrito/" + productId;
    }
  });

  // ***********************************************
  // ****************VACIAR CARRITO***************************
  $(".btnModalVaciarCarrito").click(function () {

    // Show the modal
    $("#modalVaciarCarrito").css("display", "flex");
  });

  $(".btnCloseModalVaciarCarrito").click(function () {
    $("#modalVaciarCarrito").hide();
  });

  $(".btnAceptarVaciarCarrito").click(function () {
      location.href = "vaciarCarrito";
  });
  
});
