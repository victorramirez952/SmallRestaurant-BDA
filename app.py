from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL
from flask_wtf.csrf import CSRFProtect
from flask_login import LoginManager, login_user, logout_user, login_required

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
def load_user(id):
    return ModelUser.get_by_id(db, id)

@app.route('/', methods=['GET'])
def inicio():
    # cur = mysql.connection.cursor()
    # cur.execute('''SELECT Nombre, Apellido, Correo, TelefonoContacto FROM clientes''')
    # Clientes = cur.fetchall()
    return render_template('index.html')

@app.route('/login', methods=['GET'])
def loginAdmin():
    return render_template('login.html')

@app.route('/loginAdmin', methods=['GET', 'POST'])
def login():
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
def logout():
    logout_user()
    return redirect(url_for('loginAdmin'))

@app.route('/indexAdmin', methods=['GET'])
@login_required
def indexAdmin():
    return render_template('adminTemplates/indexAdmin.html')

@app.route('/adminPersonal', methods=['GET'])
def adminPersonal():
    return render_template('adminTemplates/adminPersonal.html')

@app.route('/adminProductosIngredientes', methods=['GET'])
def adminProductosIngredientes():
    return render_template('adminTemplates/adminProductosIngredientes.html')

@app.route('/adminMesas', methods=['GET'])
def adminMesas():
    return render_template('adminTemplates/adminMesas.html')

@app.route('/perfil', methods=['GET'])
def perfil():
    return render_template('perfil.html')

@app.route('/adminIngredientes', methods=['GET'])
def adminIngrdientes():
    return render_template('adminTemplates/adminIngredientes.html')

@app.route('/adminProductos', methods=['GET'])
def adminProductos():
    return render_template('adminTemplates/adminProductos.html')

@app.route('/adminReservas', methods=['GET'])
def adminReservas():
    return render_template('adminTemplates/adminReservas.html')

@app.route('/adminClientes', methods=['GET'])
def adminClientes():
    return render_template('adminTemplates/adminClientes.html')


@app.route('/adminVentas', methods=['GET'])
def adminVentas():
    return render_template('adminTemplates/adminVentas.html')

@app.route('/indexChef', methods=['GET'])
def indexChef():
    return render_template('chefTemplates/indexChef.html')


@app.route('/indexEmpleado', methods=['GET'])
def indexEmpleado():
    return render_template('empleadoTemplates/indexEmpleado.html')

@app.route('/confirmarReserva', methods=['GET'])
def confirmarReserva():
    return render_template('empleadoTemplates/confirmarReserva.html')

@app.route('/actDispMesas', methods=['GET'])
def actDispMesas():
    return render_template('empleadoTemplates/actDisponibilidadMesas.html')

@app.route('/registrarPedido', methods=['GET'])
def registrarPedido():
    return render_template('empleadoTemplates/registrarPedido.html')

@app.route('/pedidosOnline', methods=['GET'])
def pedidosOnline():
    return render_template('empleadoTemplates/pedidosOnline.html')

@app.route('/indexCliente', methods=['GET'])
def indexCliente():
    return render_template('clienteTemplates/indexCliente.html')

@app.route('/menu', methods=['GET'])
def menu():
    return render_template('clienteTemplates/menu.html')

@app.route('/carrito', methods=['GET'])
def carrito():
    return render_template('clienteTemplates/carrito.html')

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

@app.route('/formularioReservar', methods=['GET'])
def formularioReservar():
    return render_template('clienteTemplates/formularioReservar.html')

@app.route('/consultarReserva', methods=['GET'])
def consultarReserva():
    return render_template('clienteTemplates/consultarReserva.html')

@app.route('/clientePerfil', methods=['GET'])
def clientePerfil():
    return render_template('clienteTemplates/clientePerfil.html')

def status_401(error):
    return redirect(url_for('login'))


def status_404(error):
    return "<h1>Página no encontrada</h1>", 404

if __name__ == '__main__':
    app.config.from_object(config['development'])
    csrf.init_app(app)
    app.register_error_handler(401, status_401)
    app.register_error_handler(404, status_404)
    app.run()