$(document).ready(function () {
  $("tr").on("click", "button.btnEditar", function () {
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
      $("#modal-content").append(genInput(headers[i], data[i]));
    }

    // Show the modal
    $('#modal').css('display', 'flex');
  });

  $(".btnCloseModal").click(function () {
      $("#modal-content").empty();
      $("#modal").hide();
    });

    //  Btn Eliminar
    $(".btnEliminarRowTable").click(function () {
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
    $('#modalEliminar').css('display', 'flex');
  });


  $(".btnCloseModalEliminar").click(function () {
    $("#modalEliminar").hide();
  });


});