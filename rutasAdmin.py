from flask import Flask, Blueprint, render_template, request, redirect, url_for, flash, session
bp = Blueprint('rutasAdmin', __name__)
from flask_mysqldb import MySQL
from flask_wtf.csrf import CSRFProtect
from flask_login import LoginManager, login_user, logout_user, login_required, current_user

# Models:
from models.ModelUser import ModelUser

# Entities:
from models.entities.User import User

app = Flask(__name__)
csrf = CSRFProtect()
db = MySQL(app)
login_manager_app = LoginManager(app)

@login_manager_app.user_loader
def load_user(id):
    return ModelUser.get_by_id(db, id)

# Define a global variable
anchorLogin = ""
anchorLogout = ""

# Add the variable to the template context
@app.context_processor
def inject_variables():
    return dict(
        anchorLogin=anchorLogin,
        anchorLogout=anchorLogout,
    )

@app.context_processor
def utility_processor():
    def check_user_logged_in():
        return current_user.is_authenticated
    return dict(check_user_logged_in=check_user_logged_in)

@bp.route('/loginAdmin', methods=['GET', 'POST'])
def loginAdmin():
    session['previous_url'] = request.url
    global anchorLogin, anchorLogout;
    anchorLogin = "/loginAdmin";
    anchorLogout = "/logoutAdmin";
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

@bp.route('/logoutAdmin')
def logout():
    logout_user()
    return redirect(url_for('loginAdmin'))

@bp.route('/indexAdmin', methods=['GET'])
@login_required
def indexAdmin():
    return render_template('adminTemplates/indexAdmin.html')

@bp.route('/adminPersonal', methods=['GET'])
@login_required
def adminPersonal():
    return render_template('adminTemplates/adminPersonal.html')

@bp.route('/adminProductosIngredientes', methods=['GET'])
@login_required
def adminProductosIngredientes():
    return render_template('adminTemplates/adminProductosIngredientes.html')

@bp.route('/adminMesas', methods=['GET'])
@login_required
def adminMesas():
    return render_template('adminTemplates/adminMesas.html')

@bp.route('/perfil', methods=['GET'])
@login_required
def perfil():
    return render_template('perfil.html')

@bp.route('/adminIngredientes', methods=['GET'])
@login_required
def adminIngrdientes():
    return render_template('adminTemplates/adminIngredientes.html')

@bp.route('/adminProductos', methods=['GET'])
@login_required
def adminProductos():
    return render_template('adminTemplates/adminProductos.html')

@bp.route('/adminReservas', methods=['GET'])
@login_required
def adminReservas():
    return render_template('adminTemplates/adminReservas.html')

@bp.route('/adminClientes', methods=['GET'])
@login_required
def adminClientes():
    return render_template('adminTemplates/adminClientes.html')


@bp.route('/adminVentas', methods=['GET'])
@login_required
def adminVentas():
    return render_template('adminTemplates/adminVentas.html')