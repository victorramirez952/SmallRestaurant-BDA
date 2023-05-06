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
  
  });
  