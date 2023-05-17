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