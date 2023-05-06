$(document).ready(function () {
    $(".mesaCaja").click(function() {
        let mesa = $(this).find("div");
        // .toggleClass("bg-blue-600 border-blue-500");
        if (mesa.hasClass("bg-gray-300")) {
            mesa.removeClass("bg-gray-300 border-gray-200");
            mesa.addClass("bg-green-600");
          } else {
              mesa.removeClass("bg-green-600");
              mesa.addClass("bg-gray-300 border-gray-200");
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
  
  });
  