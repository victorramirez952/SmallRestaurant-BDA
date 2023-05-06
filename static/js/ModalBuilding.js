function genInput(header, valor) {
  let nums = [
    "Salario",
    "Stock",
    "Número",
    "Capacidad",
    "Precio",
    "Cantidad de personas",
    "Total",
  ];
  let selects = ["Disponibilidad", "Ingredientes", "Estado de la orden", "Estado de la entrega"];
  let dates = ["Fecha"];
  let times = ["Hora"];
  let tels = ["Telefono"];
  let emails = ["Correo"];

  if (nums.includes(header)) return inputNumber(header, valor);
  if (selects.includes(header)) return genSelect(header, valor);
  if (dates.includes(header)) return inputDate(header, valor);
  if (times.includes(header)) return inputTime(header, valor);
  if (tels.includes(header)) return inputTel(header, valor);
  if (emails.includes(header)) return inputEmail(header, valor);
  return inputText(header, valor);
}

function inputText(header, valor) {
  return `
          <div class="mt-2">
              <label for="${header}" class="block text-green-500 font-bold mb-2" id="valor-columna-1">${header}</label>
              <input type="text" name="${header}"" id="input-${header}"
                  class="shadow appearance-none border border-gray-300 rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline-green"
                  value="${valor}" required>
          </div>`;
}

function inputNumber(header, valor) {
  return `
            <div class="mt-2">
                <label for="${header}" class="block text-green-500 font-bold mb-2" id="valor-columna-1">${header}</label>
                <input type="number" name="${header}" id="input-${header}" min="1"
                    class="shadow appearance-none border border-gray-300 rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline-green"
                    value="${valor}" required>
            </div>`;
}

function genSelect(header, valor) {
  if (header == "Disponibilidad") {
    let select = `
          <div class="mt-4">
          <label for="${header}" class="block text-green-500 font-bold mb-2">${header}</label>
          <select name="${header}" id="input-${header}"
              class="shadow border border-gray-300 rounded w-full py-2 px-0 sm:px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline-blue">
              <option value="Disponible">Disponible</option>
              <option value="No Disponible">No disponible</option>
          </select>
      </div>`;
    return setSelected(select, valor)
  }

  if (header == "Estado de la orden") {
    let select = `
    <div class="mt-4">
        <label for="${header}" class="block text-green-500 font-bold mb-2">${header}</label>
        <select value="${valor}" name="${header}" id="input-${header}"
            class="shadow border border-gray-300 rounded w-full py-2 px-0 sm:px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline-blue">
            <option value="En preparación">En preparación</option>
            <option value="Listo">Listo</option>
        </select>
    </div>`;
    return setSelected(select, valor)
  }

  if (header == "Estado de la entrega") {
    let select = `
    <div class="mt-4">
        <label for="${header}" class="block text-green-500 font-bold mb-2">${header}</label>
        <select name="${header}" id="input-${header}"
            class="shadow border border-gray-300 rounded w-full py-2 px-0 sm:px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline-blue">
            <option value="En preparación">En preparación</option>
            <option value="Procesando">Procesando</option>
            <option value="En camino">En camino</option>
        </select>
    </div>`;
    return setSelected(select, valor)
  }
}

// Función utilizada en la función select
function setSelected(select, valor){
  let selectElement = document.createElement("div");
  selectElement.innerHTML = select;
  let selectOptions = selectElement.querySelectorAll("option");
  for (let i = 0; i < selectOptions.length; i++) {
    if (selectOptions[i].value == valor) {
      selectOptions[i].setAttribute("selected", "");
    }
  }
  return selectElement.innerHTML;
}

function inputPassword(header, valor) {
  return `
              <div class="mt-2">
                  <label for="${header}" class="block text-green-500 font-bold mb-2" id="valor-columna-1">${header}</label>
                  <input type="password" name="${header}" id="input-${header}" minlength="8"
                      class="shadow appearance-none border border-gray-300 rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline-green"
                      value="${valor}" required>
              </div>`;
}

function inputDate(header, valor) {
  return `
                <div class="mt-2">
                    <label for="${header}" class="block text-green-500 font-bold mb-2" id="valor-columna-1">${header}</label>
                    <input type="name" name="${header}" id="input-${header}"
                        class="shadow appearance-none border border-gray-300 rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline-green"
                        value="${valor}" required>
                </div>`;
}

function inputTime(header, valor) {
  return `
                  <div class="mt-2">
                      <label for="${header}" class="block text-green-500 font-bold mb-2" id="valor-columna-1">${header}</label>
                      <input type="time" name="${header}" id="input-${header}"
                          class="shadow appearance-none border border-gray-300 rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline-green"
                          value="${valor}" required>
                  </div>`;
}

function inputTel(header, valor) {
  return `
                    <div class="mt-2">
                        <label for="${header}" class="block text-green-500 font-bold mb-2" id="valor-columna-1">${header}</label>
                        <input type="tel" name="${header}" id="input-${header}"
                            class="shadow appearance-none border border-gray-300 rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline-green"
                            value="${valor}" required pattern="[0-9]{10,11}">
                    </div>`;
}

function inputEmail(header, valor) {
  return `
                      <div class="mt-2">
                          <label for="${header}" class="block text-green-500 font-bold mb-2" id="valor-columna-1">${header}</label>
                          <input type="email" name="${header}" id="input-${header}"
                              class="shadow appearance-none border border-gray-300 rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline-green"
                              value="${valor}" required>
                      </div>`;
}
