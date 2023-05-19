$(document).ready(function () {
    //   ***************************************
    //   ***************************************
    function actualizarMontoTotal(){
        $.ajax({
            url: '/calcularMontoTotal',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': csrfToken
            },
            success: function(data) {
                // Aquí puedes procesar los datos recibidos y guardarlos
                $("#montoTotal").text(data[0])
            },
            error: function(error) {
                // Manejar el error en caso de que la petición falle
                console.error(error);
            }
        });
    }
    actualizarMontoTotal();

    //   ***************************************
    $(".btnMasProducto").click(function() {
        let input = $(this).siblings('input[type="number"]');
        let value = parseInt(input.val());
        let idDetalleCarrito = $(this).closest('#containerProductoCarrito').find('.inputIdDetalleCarrito').val();
        input.val(value + 1);
        let suma = 1;
        $.ajax({
          url: '/editarCantidadProductoCarrito',
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
              'X-CSRFToken': csrfToken
          },
          data: JSON.stringify({ 
            idDetalleCarrito: idDetalleCarrito,
            cantidad: 1,
            suma: suma
          }),
          success: function(data) {
              // Aquí puedes procesar los datos recibidos y guardarlos
              actualizarMontoTotal();
          },
          error: function(error) {
              // Manejar el error en caso de que la petición falle
              console.error('Error:', error);
          }
        });
      });

    //   ***************************************
    $(".btnMenosProducto").click(function() {
        let input = $(this).siblings('input[type="number"]');
        let idDetalleCarrito = $(this).closest('#containerProductoCarrito').find('.inputIdDetalleCarrito').val();
        let value = parseInt(input.val());
        let suma = 0;
        if(value > 1) input.val(value - 1);
        $.ajax({
          url: '/editarCantidadProductoCarrito',
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
              'X-CSRFToken': csrfToken
          },
          data: JSON.stringify({ 
            idDetalleCarrito: idDetalleCarrito,
            cantidad: 1,
            suma: suma
          }),
          success: function(data) {
              // Aquí puedes procesar los datos recibidos y guardarlos
              actualizarMontoTotal();
          },
          error: function(error) {
              // Manejar el error en caso de que la petición falle
              console.error('Error:', error);
          }
        });
    });

    $(".btnAceptarEliminarCarrito").click(function () {
        let idDetalleCarrito = $('#modalIdDetalleCarrito').val();
        let idProducto = $('#modalIdDetalleCarritoProducto').val();
        $.ajax({
          url: '/eliminarProductoCarrito',
          method: 'POST',
          headers: {
              'Content-Type': 'application/json',
              'X-CSRFToken': csrfToken
          },
          data: JSON.stringify({ 
            idDetalleCarrito: idDetalleCarrito,
            idProducto: idProducto
          }),
          success: function(data) {
            location.href = "carrito";
            //   actualizarMontoTotal();
          },
          error: function(error) {
              console.error('Error:', error);
          }
        });
        // if (productId) {
        //   location.href = "eliminarProductoCarrito/" + productId;
        // }
      });
});
