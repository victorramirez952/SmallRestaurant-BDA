from flask import Flask, render_template
from flask_mysqldb import MySQL

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'alfaUser'
app.config['MYSQL_PASSWORD'] = 'omegalambda'
app.config['MYSQL_DB'] = 'small_restaurant'

mysql = MySQL(app)

print("Conexión exitosa")

@app.route('/', methods=['GET'])
def inicio():
    cur = mysql.connection.cursor()
    cur.execute('''SELECT Nombre, Apellido, Correo, TelefonoContacto FROM clientes''')
    Clientes = cur.fetchall()
    return render_template('index.html', Clientes=Clientes)

@app.route('/login', methods=['GET'])
def loginAdmin():
    return render_template('login.html')

@app.route('/indexAdmin', methods=['GET'])
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

if __name__ == '__main__':
    app.run(debug=True)
