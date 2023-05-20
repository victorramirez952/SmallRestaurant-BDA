from flask import Flask, render_template, render_template_string, request, redirect, url_for, flash, session, jsonify
from flask_mysqldb import MySQL
from flask_wtf.csrf import CSRFProtect
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from werkzeug.security import generate_password_hash
import json, datetime

from config import config

from models.ModelUser import ModelUser

from models.entities.User import User

app = Flask(__name__)
app.secret_key = 'B!1w8NAt1T^%kvhUI*S^'

# Models:

csrf = CSRFProtect()
db = MySQL(app)
login_manager_app = LoginManager(app)

csrf.init_app(app)
app.config.from_object(config['development'])

# Define the status_401 function
def status_401(error):
    return redirect(url_for('/'))

# Register the error handler
@app.errorhandler(401)
def handle_401_error(error):
    return status_401(error)

# Entities:

@login_manager_app.user_loader
def load_user(idUsuario):
    return ModelUser.get_by_id(db, idUsuario)

# Define a global variable
anchorLogin = ""
anchorLogout = ""
anchorIndex = ""

# Add the variable to the template context
@app.context_processor
def inject_variables():
    return dict(
        anchorLogin=anchorLogin,
        anchorLogout=anchorLogout,
        anchorIndex=anchorIndex
    )

@app.context_processor
def utility_processor():
    def check_user_logged_in():
        return current_user.is_authenticated
    return dict(check_user_logged_in=check_user_logged_in)

@app.route('/', methods=['GET'])
def inicio():
    session['cart'] = [] # Inicializa el carrito vacío
    return redirect(url_for('index'))

@app.route('/index', methods=['GET'])
def index():
    session['previous_url'] = request.url
    return render_template('index.html')

@app.route('/procesarFormulario', methods=['GET'])
def procesarFormulario():
    correo = request.args.get('correo')
    cursor = db.connection.cursor()
    sql = """SELECT username FROM user 
            WHERE username = '{}'""".format(correo)
    cursor.execute(sql)
    row = cursor.fetchone()
    cursor.close()
    if(row):
        return jsonify({'existe': 'True'});
    return jsonify({'existe: ': 'False'})

@app.route('/signUp', methods=['GET'])
def signUp():
    global anchorLogin;
    if(anchorLogin == ''):
        return render_template('signUp.html', anchorLogin="/loginCliente")
    return render_template('signUp.html', anchorLogin=anchorLogin)

@app.route('/agregarCarrito', methods=['POST'])
def agregarCarrito():
    # cart = session.get('cart', [])
    try:
        global anchorLogin;
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexCliente"))
        idProducto = request.form['idProducto'];
        cantidad = request.form['cantidad'];
        print("cantidad:", cantidad)
        comentarios = request.form['comentarios'];
        if not comentarios: comentarios = None;

        print(idUsuario)
        print(idProducto)
        print(cantidad)
        print(comentarios)

        cursor = db.connection.cursor()
        cursor.callproc('RegistrarProductoCarrito', [idUsuario, idProducto, cantidad, comentarios, ...])
        # Obtener los resultados utilizando un cursor
        rows = cursor.fetchall()
        cursor.nextset()  # Mover al siguiente conjunto de resultados
        cursor.close()
        return redirect(url_for('carrito'))
        # if productId not in cart: # verifica si el ID del producto ya está en el carrito
        #     cart.append(productId)
        #     session['cart'] = cart
    except Exception as e:
            error_message = str(e.args[1])
            flash(error_message)
            return redirect(url_for('indexCliente'))

@app.route('/editarCantidadProductoCarrito', methods=['POST'])
def editarCantidadProductoCarrito():
    try:
        detalleCarrito = request.get_json()
        idDetalleCarrito = detalleCarrito['idDetalleCarrito']
        cantidad = 1
        suma = detalleCarrito['suma']
        cursor = db.connection.cursor()
        print(idDetalleCarrito)
        print(cantidad)
        print(suma)
        cursor.callproc('EditarCantidadProductoCarrito', [idDetalleCarrito, cantidad, suma])
        cursor.nextset()
        cursor.close()
        return jsonify("Exito")
    except Exception as e:
        error_message = str(e.args[1])
        # flash(error_message)
        return jsonify(error_message)

@app.route('/vaciarCarrito', methods=['POST'])
def vaciarCarrito():
    # session.pop('cart', None)
    try:
        idCarrito = request.form['idCarrito']
        cursor = db.connection.cursor()
        cursor.callproc('VaciarCarrito', [idCarrito])
        cursor.nextset()
        cursor.close()
        return redirect(url_for('carrito'))
    except Exception as e:
        error_message = str(e.args[1])
        # flash(error_message)
        return redirect(url_for('carrito'))

@app.route('/eliminarProductoCarrito', methods=['POST'])
def eliminarProductoCarrito():
    # cart = session.get('cart', [])
    # if productId in cart:
    #     cart.remove(productId)
    #     session['cart'] = cart
    try:
        detalleCarrito = request.get_json()
        idDetalleCarrito = detalleCarrito['idDetalleCarrito']
        idProducto = detalleCarrito['idProducto']
        cursor = db.connection.cursor()
        cursor.callproc('EliminarProductoCarrito', [idDetalleCarrito, idProducto])
        cursor.nextset()
        cursor.close()
        return jsonify("Exito")
    except Exception as e:
        error_message = str(e.args[1])
        # flash(error_message)
        return jsonify(error_message)

@app.route('/pagarPedido')
def pagarPedido():
    session['cart'] = [];
    return redirect(url_for('listaPedidos'))

@app.route('/registrarUsuario', methods=['POST'])
def registrarUsuario():
    if request.method == 'POST':
        try:
            global anchorLogin;
            nombres = request.form['nombres'];
            apellidoPaterno = request.form['apellidoPaterno'];
            apellidoMaterno = request.form['apellidoMaterno'];
            telefonoContacto = request.form['telefono'];
            correo = request.form['correo'];
            contrasenia = request.form['password'];
            estado = request.form['estado'];
            municipio = request.form['municipio'];
            colonia = request.form['colonia'];
            calle = request.form['calle'];
            numeroExterior = request.form['numExterior'];
            numeroInterior = request.form['numInterior'];
            codigoPostal = request.form['codigoPostal'];

            if numeroInterior is None or numeroInterior == '':
                    numeroInterior = None;

            hashed_password = generate_password_hash(contrasenia);
            cursor = db.connection.cursor()
            # imagen por defecto sera "Cincos.jpg"
            # idTipoUsuario para cliente = 1
            cursor.callproc('RegistrarCliente', [correo, hashed_password, "Cincos.jpg", 1, estado, municipio, colonia, calle, numeroExterior, numeroInterior, codigoPostal, nombres, apellidoPaterno, apellidoMaterno, telefonoContacto, ...])
            resultados1 = cursor.fetchall()
            print(resultados1)
            cursor.nextset()
            cursor.close()
            urlLogin = anchorLogin[1:]
            if urlLogin == '' or  urlLogin is None:
                    urlLogin = 'loginCliente'
            return redirect(url_for(urlLogin))
        except Exception as e:
            error_message = str(e.args[1])  # Accede al primer argumento de la excepción
            flash(error_message)
            return redirect(url_for('signUp'))

@app.route('/registrarReservacion', methods=['POST'])
def registrarReservacion():
    if request.method == 'POST':
        try:
            idCliente = request.form['idCliente'];
            fecha = session['fecha'];
            horario = session['horario'];
            cantidadPersonas = session['noPersonas'];
            comentarios = request.form['solicitudEspecial'];
            confirmada = 0;
            if(idCliente == ''): idCliente = None;
            mesasSeleccionadas = session['mesasSeleccionadas'];
            if(comentarios == ''): comentarios = None;

            cursor = db.connection.cursor()
            idReserva = None
            cursor.callproc('RegistrarReservacion', [idCliente, fecha, horario, cantidadPersonas, comentarios, confirmada, ...])
            # Obtener los resultados utilizando un cursor
            rows = cursor.fetchall()
            cursor.nextset()  # Mover al siguiente conjunto de resultados
            if len(rows) > 0:
                idReserva = rows[0][0]
            
            for numMesa in mesasSeleccionadas:
                cursor.callproc('InsertarReservaMesa', [numMesa, idReserva])
                cursor.nextset()

            cursor.close()
            urlIndex = anchorIndex[1:]
            if urlIndex == '' or  urlIndex is None:
                    urlIndex = 'indexCliente'
            return redirect(url_for(urlIndex))
        except Exception as e:
            error_message = str(e.args[1])  # Accede al primer argumento de la excepción
            flash(error_message)
            return error_message

@app.route('/buscarHorarios', methods=['POST'])
def buscarHorarios():
    if request.method == 'POST':
        try:
            noPersonas = request.form['noPersonas'];
            fecha = request.form['fecha'];
            horario = request.form['horario'];
            session['noPersonas'] = noPersonas;
            session['fecha'] = fecha;
            horario += ":00";
            session['horario'] = horario;
            cursor = db.connection.cursor()
            cursor.callproc('ObtenerMesasDisponibles', [fecha, horario, noPersonas])
            mesas = cursor.fetchall()
            cursor.nextset()
            cursor.close()
            return render_template('clienteTemplates/mesasDisponibles.html', mesas=mesas)
        except Exception as e:
                error_message = str(e.args[1])  # Accede al primer argumento de la excepción
                # flash(error_message)
                return redirect(url_for('reservar'))

@app.route('/getDatosCliente', methods=['POST'])
def getDatosCliente():
    try:
        idUsuario = request.get_json()
        cursor = db.connection.cursor()
        cursor.callproc('ConsultarCliente', [idUsuario['id']])
        cliente = cursor.fetchone()
        cursor.nextset()
        cursor.close()
        return jsonify(cliente)
    except Exception as e:
        error_message = str(e.args[1])
        # flash(error_message)
        return redirect(url_for('reservar'))

# *********************ADMIN ************************************

@app.route('/loginAdmin', methods=['GET', 'POST'])
def loginAdmin():
    global anchorLogin, anchorLogout, anchorIndex;
    anchorLogin = "/loginAdmin";
    anchorLogout = "/logoutAdmin";
    anchorIndex = "/indexAdmin";
    if request.method == 'POST':
        user = User(0, request.form['correo'], request.form['password'])
        logged_user = ModelUser.login(db, user)
        if logged_user != None:
            if logged_user.Contrasenia:
                login_user(logged_user)
                return redirect(url_for('indexAdmin'))
            else:
                flash("Contraseña incorrecta")
                return render_template('login.html')
        else:
            flash("Usuario no encontrado")
            return render_template('login.html')
    else:
        return render_template('login.html')

@app.route('/logoutAdmin')
def logoutAdmin():
    logout_user()
    return redirect(url_for('loginAdmin'))

@app.route('/indexAdmin', methods=['GET'])
@login_required
def indexAdmin():
    global anchorIndex;
    anchorIndex = "/indexAdmin";
    anchorLogout = "/logoutAdmin";
    return render_template('adminTemplates/indexAdmin.html')

@app.route('/adminPersonal', methods=['GET'])
@login_required
def adminPersonal():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    anchorLogout = '/logoutAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexAdmin"))
        cursor = db.connection.cursor()
        cursor.callproc('ConsultarPersonal')
        personal = cursor.fetchall();
        cursor.nextset()
        cursor.close()
        return render_template('adminTemplates/adminPersonal.html', personal=personal)
    except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/adminProductosIngredientes', methods=['POST'])
@login_required
def adminProductosIngredientes():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexAdmin"))
        idProducto = request.form['idProducto']
        print(idProducto)
        cursor = db.connection.cursor()
        cursor.callproc('ConsultarProductosIngredientes', [idProducto])
        ingredientes = cursor.fetchall();
        print(ingredientes)
        cursor.nextset()
        cursor.close()
        return render_template('adminTemplates/adminProductosIngredientes.html', ingredientes=ingredientes)
    except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/adminMesas', methods=['GET'])
@login_required
def adminMesas():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexAdmin"))
        cursor = db.connection.cursor()
        cursor.callproc('ConsultarMesas')
        mesas = cursor.fetchall();
        cursor.nextset()
        cursor.close()
        return render_template('adminTemplates/adminMesas.html', mesas=mesas)
    except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/perfil', methods=['GET'])
@login_required
def perfil():
    return render_template('perfil.html')

@app.route('/adminIngredientes', methods=['GET'])
@login_required
def adminIngredientes():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexAdmin"))
        cursor = db.connection.cursor()
        cursor.callproc('ConsultarIngredientes')
        ingredientes = cursor.fetchall();
        cursor.nextset()
        cursor.close()
        return render_template('adminTemplates/adminIngredientes.html', ingredientes=ingredientes)
    except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/adminProductos', methods=['GET'])
@login_required
def adminProductos():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexAdmin"))
        cursor = db.connection.cursor()
        cursor.callproc('ConsultarProductos')
        productos = cursor.fetchall();
        cursor.nextset()
        cursor.close()
        return render_template('adminTemplates/adminProductos.html', productos=productos)
    except Exception as e:
        error_message = str(e.args[1])
        print(error_message)
        return redirect(url_for('indexAdmin'))

@app.route('/adminReservas', methods=['GET'])
@login_required
def adminReservas():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexCliente"))
        cursor = db.connection.cursor()
        cursor.callproc('ConsultarReservas')
        reservas = cursor.fetchall();
        cursor.nextset()
        cursor.close()
        return render_template('adminTemplates/adminReservas.html', reservas=reservas)
    except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/adminClientes', methods=['GET'])
@login_required
def adminClientes():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexCliente"))
        cursor = db.connection.cursor()
        cursor.callproc('ConsultarClientes')
        clientes = cursor.fetchall();
        cursor.nextset()
        cursor.close()
        return render_template('adminTemplates/adminClientes.html', clientes=clientes)
    except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/adminVentas', methods=['GET'])
@login_required
def adminVentas():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    anchorLogout = '/logoutAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexCliente"))
        cursor = db.connection.cursor()
        cursor.callproc('ConsultarVentas')
        ventas = cursor.fetchall();
        cursor.nextset()
        cursor.close()
        return render_template('adminTemplates/adminVentas.html', ventas=ventas)
    except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/editarCliente', methods=['POST'])
def editarCliente():
    if request.method == 'POST':
        try:
            Idcliente = request.form['Id'];
            nombre = request.form['Nombre'];
            apellidoPaterno = request.form['Apellido Paterno'];
            apellidoMaterno = request.form['Apellido Materno'];
            correo = request.form['Correo'];
            telefonoContacto = request.form['TelefonoContacto'];
            print(Idcliente)
            print(nombre)
            print(apellidoPaterno)
            print(apellidoMaterno)
            print(correo)
            print(telefonoContacto)
            cursor = db.connection.cursor()
            cursor.callproc('ConsultarIdUsuarioIdCliente', [Idcliente])
            resultado = cursor.fetchone()[0];
            idUsuario = resultado;
            cursor.nextset()
            print(idUsuario);
            cursor.callproc('EditarCliente', [Idcliente, nombre, apellidoPaterno, apellidoMaterno, telefonoContacto, idUsuario]);
            cursor.nextset()
            cursor.close()
            return redirect(url_for('adminClientes'))
        except Exception as e:
                error_message = str(e.args[1])  # Accede al primer argumento de la excepción
                # flash(error_message)
                return redirect(url_for('indexAdmin'))

@app.route('/eliminarCliente', methods=['POST'])
def eliminarCliente():
    if request.method == 'POST':
        try:
            Idcliente = request.form['Id'];
            cursor = db.connection.cursor()
            cursor.callproc('ConsultarIdUsuarioIdCliente', [Idcliente])
            resultado = cursor.fetchone()[0];
            idUsuario = resultado;
            cursor.nextset()
            cursor.callproc('EliminarCliente', [Idcliente, idUsuario]);
            cursor.nextset()
            cursor.close()
            return redirect(url_for('adminClientes'))
        except Exception as e:
                error_message = str(e.args[1])  # Accede al primer argumento de la excepción
                # flash(error_message)
                return redirect(url_for('indexAdmin'))

@app.route('/editarIngrediente', methods=['POST'])
def editarIngrediente():
    if request.method == 'POST':
        try:
            IdIngrediente = request.form['Id'];
            ingrediente = request.form['Nombre Ingrediente'];
            stock = request.form['Stock Ingrediente'];
            tipoUnidad = request.form['Tipo Unidad'];
            cursor = db.connection.cursor()
            cursor.callproc('EditarIngrediente', [IdIngrediente, ingrediente, stock, tipoUnidad]);
            cursor.nextset()
            cursor.close()
            return redirect(url_for('adminIngredientes'))
        except Exception as e:
                error_message = str(e.args[1])  # Accede al primer argumento de la excepción
                print(error_message)
                return redirect(url_for('adminIngredientes'))

@app.route('/eliminarIngrediente', methods=['POST'])
def eliminarIngrediente():
    if request.method == 'POST':
        try:
            IdIngrediente = request.form['Id'];
            print(IdIngrediente)
            cursor = db.connection.cursor()
            cursor.callproc('EliminarIngrediente', [IdIngrediente]);
            cursor.nextset()
            cursor.close()
            return redirect(url_for('adminIngredientes'))
        except Exception as e:
                error_message = str(e.args[1])  # Accede al primer argumento de la excepción
                print(error_message)
                return redirect(url_for('indexAdmin'))

@app.route('/agregarIngrediente', methods=['POST'])
@login_required
def agregarIngrediente():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexAdmin"))
        ingrediente = request.form['Nombre Ingrediente'];
        stock = request.form['Stock Ingrediente'];
        tipoUnidad = request.form['Tipo Unidad'];
        print(ingrediente)
        print(stock)
        print(tipoUnidad)
        cursor = db.connection.cursor()
        cursor.callproc('RegistrarIngrediente', [ingrediente, stock, tipoUnidad, ...])
        ingredientes = cursor.fetchall();
        print(ingredientes)
        cursor.nextset()
        cursor.close()
        return redirect(url_for('adminIngredientes'))
    except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/editarMesa', methods=['POST'])
def editarMesa():
    if request.method == 'POST':
        try:
            numMesa = request.form['Número'];
            capacidad = request.form['Capacidad'];
            disponibilidad = request.form['Disponibilidad'];
            print(numMesa)
            print(capacidad)
            print(disponibilidad)
            cursor = db.connection.cursor()
            cursor.callproc('EditarMesa', [numMesa, capacidad, disponibilidad]);
            cursor.nextset()
            cursor.close()
            return redirect(url_for('adminMesas'))
        except Exception as e:
                error_message = str(e.args[1])  # Accede al primer argumento de la excepción
                print(error_message)
                return redirect(url_for('adminIndex'))

@app.route('/eliminarMesa', methods=['POST'])
def eliminarMesa():
    if request.method == 'POST':
        try:
            numMesa = request.form['Número'];
            cursor = db.connection.cursor()
            cursor.callproc('EliminarMesa', [numMesa]);
            cursor.nextset()
            cursor.close()
            return redirect(url_for('adminMesas'))
        except Exception as e:
                error_message = str(e.args[1])  # Accede al primer argumento de la excepción
                print(error_message)
                return redirect(url_for('indexAdmin'))

@app.route('/agregarMesa', methods=['POST'])
@login_required
def agregarMesa():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexAdmin"))
        numMesa = request.form['Número'];
        capacidad = request.form['Capacidad'];
        disponibilidad = request.form['Disponibilidad'];
        cursor = db.connection.cursor()
        cursor.callproc('InsertarMesa', [numMesa, capacidad, disponibilidad, ...])
        cursor.nextset()
        cursor.close()
        db.connection.commit()
        return redirect(url_for('adminMesas'))
    except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/editarPersonal', methods=['POST'])
def editarPersonal():
    if request.method == 'POST':
        try:
            nombre = request.form['Nombre'];
            apellidoPaterno = request.form['Apellido Paterno'];
            apellidoMaterno = request.form['Apellido Materno'];
            salario = request.form['Salario'];
            correo = request.form['Correo'];
            tipoUsuario = request.form['Tipo Usuario'];
            if tipoUsuario not in ['Mesero', 'Repartidor', 'Chef']:
                return redirect(url_for('indexAdmin'))
            cursor = db.connection.cursor()
            cursor.callproc('ConsultarIdUsuarioFullname', [nombre, apellidoPaterno, apellidoMaterno])
            resultado = cursor.fetchone()[0];
            idUsuario = resultado;
            cursor.nextset()
            cursor.close()
            print(idUsuario);
            cursor = db.connection.cursor()
            cursor.callproc('EditarPersonal', [idUsuario, nombre, apellidoPaterno, apellidoMaterno, salario, correo, tipoUsuario.strip()]);
            cursor.nextset()
            cursor.close()
            db.connection.commit()
            return redirect(url_for('adminPersonal'))
        except Exception as e:
            error_message = str(e.args[1])  # Accede al primer argumento de la excepción
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/eliminarPersonal', methods=['POST'])
def eliminarPersonal():
    if request.method == 'POST':
        try:
            idUsuario = request.form['Id'];
            print(idUsuario)
            cursor = db.connection.cursor()
            cursor.callproc('EliminarPersonal', [idUsuario]);
            cursor.nextset()
            cursor.close()
            return redirect(url_for('adminPersonal'))
        except Exception as e:
            error_message = str(e.args[1])  # Accede al primer argumento de la excepción
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/agregarPersonal', methods=['POST'])
@login_required
def agregarPersonal():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexAdmin"))
        nombre = request.form['Nombre'];
        apellidoPaterno = request.form['Apellido Paterno'];
        apellidoMaterno = request.form['Apellido Materno'];
        salario = request.form['Salario'];
        correo = request.form['Correo'];
        tipoUsuario = request.form['Tipo Usuario'];
        if tipoUsuario not in ['Mesero', 'Repartidor', 'Chef']:
            return redirect(url_for('indexAdmin'))
        cursor = db.connection.cursor()
        cursor.callproc('RegistrarPersonal', [nombre, apellidoPaterno, apellidoMaterno, salario, correo, tipoUsuario, ...])
        cursor.nextset()
        cursor.close()
        db.connection.commit()
        return redirect(url_for('adminPersonal'))
    except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/editarProducto', methods=['POST'])
def editarProducto():
    if request.method == 'POST':
        try:
            idProducto = request.form['Id'];
            producto = request.form['Producto'];
            comida = request.form['Comida'];
            precio = request.form['Precio'];
            descripcion = request.form['Descripcion'];
            imagen = request.form['Imagen'];
            print(idProducto)
            print(producto)
            print(comida)
            print(precio)
            print(descripcion)
            print(imagen)
            cursor = db.connection.cursor()
            cursor.callproc('EditarProducto', [idProducto, producto, comida, precio, descripcion, imagen]);
            cursor.nextset()
            cursor.close()
            db.connection.commit()
            return redirect(url_for('adminProductos'))
        except Exception as e:
                error_message = str(e.args[1])  # Accede al primer argumento de la excepción
                print(error_message)
                return redirect(url_for('indexAdmin'))

@app.route('/eliminarProducto', methods=['POST'])
def eliminarProducto():
    if request.method == 'POST':
        try:
            idProducto = request.form['Id'];
            print(idProducto)
            cursor = db.connection.cursor()
            cursor.callproc('EliminarProducto', [idProducto]);
            cursor.nextset()
            cursor.close()
            db.connection.commit()
            return redirect(url_for('adminProductos'))
        except Exception as e:
            error_message = str(e.args[1])  # Accede al primer argumento de la excepción
            print(error_message)
            return redirect(url_for('indexAdmin'))

@app.route('/agregarProducto', methods=['POST'])
@login_required
def agregarProducto():
    global anchorIndex;
    anchorIndex = '/indexAdmin';
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is None:
            return redirect(url_for("clienteTemplates/indexAdmin"))
        producto = request.form['Producto'];
        comida = request.form['Comida'];
        precio = request.form['Precio'];
        descripcion = request.form['Descripcion'];
        imagen = request.form['Imagen'];
        print(producto)
        print(comida)
        print(precio)
        print(descripcion)
        print(imagen)
        cursor = db.connection.cursor()
        cursor.callproc('InsertarProducto', [producto, comida, precio, descripcion, imagen, ...])
        cursor.nextset()
        cursor.close()
        db.connection.commit()
        return redirect(url_for('adminProductos'))
    except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('indexAdmin'))


# *******************CHEF****************************************

@app.route('/loginChef', methods=['GET', 'POST'])
def loginChef():
    session['previous_url'] = request.url
    global anchorLogin, anchorLogout, anchorIndex;
    anchorLogin = "/loginChef";
    anchorLogout = "/logoutChef";
    anchorIndex = "/indexChef";
    if request.method == 'POST':
        user = User(0, request.form['correo'], request.form['password'])
        logged_user = ModelUser.login(db, user)
        if logged_user != None:
            if logged_user.password:
                login_user(logged_user)
                return redirect(url_for('indexChef'))
            else:
                flash("Invalid password...")
                return render_template('login.html')
        else:
            flash("User not found...")
            return render_template('login.html')
    else:
        return render_template('login.html')

@app.route('/logoutChef')
def logoutChef():
    logout_user()
    return redirect(url_for('loginChef'))

@app.route('/indexChef', methods=['GET'])
@login_required
def indexChef():
    return render_template('chefTemplates/indexChef.html')

# ***********************EMPLEADO*************************************

@app.route('/loginEmpleado', methods=['GET', 'POST'])
def loginEmpleado():
    session['previous_url'] = request.url
    global anchorLogin, anchorLogout, anchorIndex;
    anchorLogin = "/loginEmpleado";
    anchorLogout = "/logoutEmpleado";
    anchorIndex = "/indexEmpleado";
    if request.method == 'POST':
        user = User(0, request.form['correo'], request.form['password'])
        logged_user = ModelUser.login(db, user)
        if logged_user != None:
            if logged_user.password:
                login_user(logged_user)
                return redirect(url_for('indexEmpleado'))
            else:
                flash("Invalid password...")
                return render_template('login.html')
        else:
            flash("User not found...")
            return render_template('login.html')
    else:
        return render_template('login.html')

@app.route('/logoutEmpleado')
def logoutEmpleado():
    logout_user()
    return redirect(url_for('loginEmpleado'))

@app.route('/indexEmpleado', methods=['GET'])
@login_required
def indexEmpleado():
    return render_template('empleadoTemplates/indexEmpleado.html')

@app.route('/confirmarReserva', methods=['GET'])
@login_required
def confirmarReserva():
    return render_template('empleadoTemplates/confirmarReserva.html')

@app.route('/actDispMesas', methods=['GET'])
@login_required
def actDispMesas():
    return render_template('empleadoTemplates/actDisponibilidadMesas.html')

@app.route('/registrarPedido', methods=['POST'])
@login_required
def registrarPedido():
    if request.method == "POST":
        try:
            idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
            if idUsuario is None:
                return redirect(url_for("clienteTemplates/indexCliente"))
            numeroTarjeta = request.form['noTarjeta'];
            fechaVencimiento = request.form['fechaVencimiento'];
            titular = request.form['titular'];
            idMetodoPago = request.form['idMetodoPago'];
            print("numeroTarjeta: ", numeroTarjeta)
            print("fechaVencimiento: ", fechaVencimiento)
            print("titular: ", titular)
            print("idMetodoPago: ", idMetodoPago)
            fecha_actual = datetime.date.today()
            hora_actual = datetime.datetime.now().time()
            hora_formateada = hora_actual.strftime("%H:%M:%S")
            print(fecha_actual)
            print(hora_formateada)

            cursor = db.connection.cursor()
            cursor.callproc('RegistrarPedidoEnLinea', [idUsuario, fecha_actual, hora_formateada, idMetodoPago, numeroTarjeta, fechaVencimiento, titular, ...])
            cursor.nextset()  # Mover al siguiente conjunto de resultados
            cursor.close()
            return redirect(url_for('listaPedidos'))
        except Exception as e:
                error_message = str(e.args[1])
                print(error_message)
                return redirect(url_for('indexCliente'))

@app.route('/pedidosOnline', methods=['GET'])
@login_required
def pedidosOnline():
    return render_template('empleadoTemplates/pedidosOnline.html')

# ***************************REPARTIDOR**********************************
@app.route('/loginRepartidor', methods=['GET', 'POST'])
def loginRepartidor():
    session['previous_url'] = request.url
    global anchorLogin, anchorLogout, anchorIndex;
    anchorLogin = "/loginRepartidor";
    anchorLogout = "/logoutRepartidor";
    anchorIndex = "/indexRepartidor";
    if request.method == 'POST':
        user = User(0, request.form['correo'], request.form['password'])
        logged_user = ModelUser.login(db, user)
        if logged_user != None:
            if logged_user.password:
                login_user(logged_user)
                return redirect(url_for('indexRepartidor'))
            else:
                flash("Invalid password...")
                return render_template('login.html')
        else:
            flash("User not found...")
            return render_template('login.html')
    else:
        return render_template('login.html')

@app.route('/logoutRepartidor')
def logoutRepartidor():
    logout_user()
    return redirect(url_for('loginRepartidor'))


@app.route('/indexRepartidor', methods=['GET'])
@login_required
def indexRepartidor():
    return render_template('repartidorTemplates/indexRepartidor.html')

# ***************************CLIENTE**********************************

@app.route('/loginCliente', methods=['GET', 'POST'])
def loginCliente():
    global anchorLogin, anchorLogout, anchorIndex;
    anchorLogin = "/loginCliente";
    anchorLogout = "/logoutCliente";
    anchorIndex = "/indexCliente";
    if request.method == 'POST':
        user = User(0, request.form['correo'], request.form['password'])
        logged_user = ModelUser.login(db, user)
        if logged_user != None:
            if logged_user.Contrasenia:
                login_user(logged_user)
                return redirect(url_for('indexCliente'))
            else:
                flash("Contraseña incorrecta")
                return render_template('login.html')
        else:
            flash("Usuario no encontrado")
            return render_template('login.html')
    else:
        return render_template('login.html')

@app.route('/logoutCliente')
def logoutCliente():
    logout_user()
    return redirect(url_for('indexCliente'))

@app.route('/indexCliente', methods=['GET'])
def indexCliente():
    return render_template('clienteTemplates/indexCliente.html')

@app.route('/menu', methods=['GET'])
def menu():
    try:
        global anchorLogin;
        cursor = db.connection.cursor()
        cursor.callproc('MostrarProductosPorComida', [1])
        resultados = cursor.fetchall()
        cursor.nextset()
        cursor.close()
        return render_template('clienteTemplates/menu.html', productos=resultados)
    except Exception as e:
        error_message = str(e.args[1])
        print(error_message)
        return redirect(url_for('indexCliente'))
    
@app.route('/getProductosBebidas', methods=['GET'])
def getProductosBebidas():
    try:
        global anchorLogin;
        macro1 = "ContenedorPlatillos";
        cursor = db.connection.cursor()
        cursor.callproc('MostrarProductosPorComida', [0])
        productos = cursor.fetchall()
        cursor.nextset()
        cursor.close()
        return render_template("clienteTemplates/menu.html", productos=productos)
    except Exception as e:
        error_message = str(e.args[1])
        print(error_message)
        return jsonify(error_message)

@app.route('/getProductosComidas', methods=['GET'])
def getProductosComidas():
    try:
        global anchorLogin;
        cursor = db.connection.cursor()
        cursor.callproc('MostrarProductosPorComida', [1])
        productos = cursor.fetchall()
        cursor.nextset()
        cursor.close()
        return render_template("clienteTemplates/menu.html", productos=productos)
    except Exception as e:
        error_message = str(e.args[1])
        print(error_message)
        return jsonify(error_message)

@app.route('/carrito', methods=['GET'])
def carrito():
    try:
        global anchorLogin;
        idUsuario = None
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        print(idUsuario)
        if idUsuario is not None:
            cursor = db.connection.cursor()
            cursor.callproc('ConsultarProductosCarrito', [idUsuario])
            productos = cursor.fetchall()
            print(productos)
            cursor.nextset()
            cursor.close()
            return render_template("clienteTemplates/carrito.html", carrito=productos)
        cart = session.get('cart', [])
        return render_template("clienteTemplates/carrito.html", carrito=cart)
    except Exception as e:
        error_message = str(e.args[1])
        print(error_message)
        return render_template('clienteTemplates/indexCliente.html')

@app.route('/calcularMontoTotal', methods=['GET'])
def calcularMontoTotal():
    try:
        global anchorLogin;
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is not None:
            cursor = db.connection.cursor()
            cursor.callproc('CalcularMontoTotal', [idUsuario])
            print(idUsuario)
            montoTotal = cursor.fetchone()
            print(montoTotal)
            cursor.nextset()
            cursor.close()
            return jsonify(montoTotal)
        return jsonify("No se proporcionó un idUsuario")
    except Exception as e:
        error_message = str(e.args[1])
        print(error_message)
        return jsonify(error_message)

@app.route('/metodoPago', methods=['GET'])
def metodoPago():
    return render_template('clienteTemplates/metodoPago.html')

@app.route('/listaPedidos', methods=['GET'])
def listaPedidos():
    try:
        idUsuario = current_user.id if current_user and hasattr(current_user, 'id') else None
        if idUsuario is not None:
            cursor = db.connection.cursor()
            cursor.callproc('ConsultarPedidosEnProceso', [idUsuario])
            pedidosEnProceso = cursor.fetchall()
            print(pedidosEnProceso)
            cursor.nextset()
            cursor.callproc('ConsultarPedidosEntregados', [idUsuario])
            pedidosEntregados = cursor.fetchall()
            print(pedidosEntregados)
            cursor.close()
            return render_template('clienteTemplates/listaPedidos.html', pedidosEnProceso=pedidosEnProceso, pedidosEntregados=pedidosEntregados)
        return jsonify("No se proporcionó un idUsuario")
    except Exception as e:
        error_message = str(e.args[1])
        print(error_message)
        return redirect(url_for('clienteTemplates/indexCliente.html'))

@app.route('/mesasDisponibles', methods=['GET'])
def mesasDisponibles():
    return render_template('clienteTemplates/mesasDisponibles.html')

@app.route('/reservar', methods=['GET'])
def reservar():
    return render_template('clienteTemplates/reservar.html')

def to_int_list(lst):
    return list(map(int, lst))
app.jinja_env.filters['to_int_list'] = to_int_list

@app.route('/procesarMesasSeleccionadas', methods=['POST'])
def procesarMesasSeleccionadas():
    if request.method == 'POST':
        try:
            mesasSeleccionadas = request.form.get('mesasIdsHidden')
            mesasSeleccionadas = json.loads(mesasSeleccionadas)
            print(mesasSeleccionadas)
            session['mesasSeleccionadas'] = mesasSeleccionadas;
            numMesas = []
            for numMesa in mesasSeleccionadas:
                cursor = db.connection.cursor()
                cursor.callproc('ConsultarMesa', [numMesa])
                resultado = cursor.fetchone()
                if resultado:
                    valores = [x for x in resultado]
                    numMesas.append(valores)
                cursor.nextset()
            print(numMesas)
            return render_template('clienteTemplates/formularioReservar.html', numMesas=numMesas);
        except Exception as e:
            error_message = str(e.args[1])
            print(error_message)
            return redirect(url_for('mesasDisponibles'))

@app.route('/formularioReservar', methods=['GET'])
def formularioReservar():
    mesasIdsFiltrados = session['mesasIdsFiltrados'];
    return render_template('clienteTemplates/formularioReservar.html', mesasIds=mesasIdsFiltrados);

@app.route('/consultarReserva', methods=['GET'])
def consultarReserva():
    return render_template('clienteTemplates/consultarReserva.html')

@app.route('/clientePerfil', methods=['GET'])
def clientePerfil():
    return render_template('clienteTemplates/clientePerfil.html')

# ***************************OTROS**********************************

def status_401(error):
    previous_url = session.get('previous_url')
    if previous_url:
        session.pop('previous_url')
        return redirect(previous_url)
    return redirect(url_for('index'))


def status_404(error):
    return "<h1>Página no encontrada</h1>", 404

if __name__ == '__main__':
    app.config.from_object(config['development'])
    csrf.init_app(app)
    app.register_error_handler(401, status_401)
    app.register_error_handler(404, status_404)
    app.run(debug=True)