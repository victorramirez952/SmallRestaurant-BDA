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
      $("#modalTablaEditarContent").append(genInput(headers[i], data[i]));
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

});
