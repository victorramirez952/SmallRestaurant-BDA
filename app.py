from flask import Flask, render_template, request, redirect, url_for, flash, session, jsonify
from flask_mysqldb import MySQL
from flask_wtf.csrf import CSRFProtect
from flask_login import LoginManager, login_user, logout_user, login_required, current_user
from werkzeug.security import generate_password_hash

from config import config

app = Flask(__name__)

# Models:
from models.ModelUser import ModelUser

# Entities:
from models.entities.User import User

csrf = CSRFProtect()
db = MySQL(app)
login_manager_app = LoginManager(app)

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

@app.route('/agregarCarrito/<string:productId>', methods=['POST'])
def agregarCarrito(productId):
    cart = session.get('cart', [])
    if productId not in cart: # verifica si el ID del producto ya está en el carrito
        cart.append(productId)
        session['cart'] = cart
    return redirect(url_for('carrito'))

@app.route('/vaciarCarrito')
def vaciarCarrito():
    session.pop('cart', None)
    return redirect(url_for('carrito'))

@app.route('/eliminarProductoCarrito/<string:productId>')
def eliminarProductoCarrito(productId):
    cart = session.get('cart', [])
    if productId in cart:
        cart.remove(productId)
        session['cart'] = cart
    return redirect(url_for('carrito'))

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
            
    
# *********************ADMIN ************************************

@app.route('/loginAdmin', methods=['GET', 'POST'])
def loginAdmin():
    session['previous_url'] = request.url
    global anchorLogin, anchorLogout, anchorIndex;
    anchorLogin = "/loginAdmin";
    anchorLogout = "/logoutAdmin";
    anchorIndex = "/indexAdmin";
    if request.method == 'POST':
        user = User(0, request.form['correo'], request.form['password'])
        logged_user = ModelUser.login(db, user)
        if logged_user != None:
            if logged_user.password:
                login_user(logged_user)
                return redirect(url_for('indexAdmin'))
            else:
                flash("Invalid password...")
                return render_template('login.html')
        else:
            flash("User not found...")
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
    return render_template('adminTemplates/indexAdmin.html')

@app.route('/adminPersonal', methods=['GET'])
@login_required
def adminPersonal():
    return render_template('adminTemplates/adminPersonal.html')

@app.route('/adminProductosIngredientes', methods=['GET'])
@login_required
def adminProductosIngredientes():
    return render_template('adminTemplates/adminProductosIngredientes.html')

@app.route('/adminMesas', methods=['GET'])
@login_required
def adminMesas():
    return render_template('adminTemplates/adminMesas.html')

@app.route('/perfil', methods=['GET'])
@login_required
def perfil():
    return render_template('perfil.html')

@app.route('/adminIngredientes', methods=['GET'])
@login_required
def adminIngrdientes():
    return render_template('adminTemplates/adminIngredientes.html')

@app.route('/adminProductos', methods=['GET'])
@login_required
def adminProductos():
    return render_template('adminTemplates/adminProductos.html')

@app.route('/adminReservas', methods=['GET'])
@login_required
def adminReservas():
    return render_template('adminTemplates/adminReservas.html')

@app.route('/adminClientes', methods=['GET'])
@login_required
def adminClientes():
    return render_template('adminTemplates/adminClientes.html')


@app.route('/adminVentas', methods=['GET'])
@login_required
def adminVentas():
    return render_template('adminTemplates/adminVentas.html')

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

@app.route('/registrarPedido', methods=['GET'])
@login_required
def registrarPedido():
    return render_template('empleadoTemplates/registrarPedido.html')

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
    return render_template('clienteTemplates/menu.html')

@app.route('/carrito', methods=['GET'])
def carrito():
    cart = session.get('cart', [])
    return render_template('clienteTemplates/carrito.html', cart=cart)

@app.route('/metodoPago', methods=['GET'])
def metodoPago():
    return render_template('clienteTemplates/metodoPago.html')

@app.route('/listaPedidos', methods=['GET'])
def listaPedidos():
    return render_template('clienteTemplates/listaPedidos.html')

@app.route('/mesasDisponibles', methods=['GET'])
def mesasDisponibles():
    return render_template('clienteTemplates/mesasDisponibles.html')

@app.route('/reservar', methods=['GET'])
def reservar():
    return render_template('clienteTemplates/reservar.html')

def to_int_list(lst):
    return list(map(int, lst))
app.jinja_env.filters['to_int_list'] = to_int_list

@app.route('/procesarFormMesasDisponibles', methods=['POST'])
def procesarFormMesasDisponibles():
    mesasSeleccionadas = request.form['mesasSeleccionadas'];
    mesasIds = mesasSeleccionadas.split(',');
    mesasIdsFiltrados =  list(set(mesasIds));
    mesasIdsFiltrados = sorted(mesasIdsFiltrados, key=int);
    session['mesasIdsFiltrados'] = mesasIdsFiltrados;
    return redirect(url_for('formularioReservar'));

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