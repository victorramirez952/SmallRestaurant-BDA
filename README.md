# ProyectoFinal-BDA

Pasos para replicar el proyecto en una instancia GCP

Si ya se tiene una instancia de GCP configurada, pasar al 7

## 1. Crear una nueva instancia CentOs en Google Cloud
---
## 2. Instalar MariaDB

Ejecutar los siguientes comandos:

Instalar mariadb-server
```
sudo dnf install mariadb-server
```

Levantar el servidor de MariaDB
```
sudo systemctl start mariadb.service
```

Habilitar MariaDB como un servicio
```
sudo systemctl enable mariadb.service
```

Asegurar la integridad del DBMS
```
sudo mariadb-secure-installation
```
Ingresar una contraseña para el root
Ingresar n, n, y, y, y, y (para las opciones pedidas)

## 3. Instalar flask

Instalar python
```
sudo yum install python
```

Instalar pip
```
sudo dnf install pip
```

Instalar Flask
```
pip install flask
```

## 4. Abrir puerto 5000 del firewall desde la consola
```
sudo firewall-cmd --zone=public --add-port=5000/tcp --permanent
sudo firewall-cmd --reload
```

## 5. Configurar Firewall en Google Cloud

Menú > Red de VPC > Firewall > Tres puntos (:) > Crear regla de Firewall
Ingresar nombre para la regla de firewall
Destinos: Todas las instancias de la red
Rangos de IPv4 de origen: 0.0.0.0/0
Seleccionar TCP
Puertos: 5000
Dar clic en Crear


## 6. Instalar driver de flask_mysql y los encabezados de Python

Comando para instalar las herramientas de desarrollo para el SO
```
sudo dnf groupinstall "Development Tools"
```

Comando para instalar los encabezados
```
sudo dnf install python-devel
```

Comando para instalar todo lo relacionado con mariadb.
```
sudo dnf install mariadb*
```

Comando para instalar el driver
```
pip install flask_mysqldb
```

## 7. Incorporar proyecto a la instancia

Hay dos formas de hacerlo

* Subiendo el archivo .zip
* Clonando el repositorio desde github

### Subiendo el archivo .zip
___
Subir el archivo .zip a la instancia utilizando la funcionalidad "Subir Archivo" de SSH

Descomprimir el archivo .zip mediante:
```
unzip 'Proyecto Final Pequeño Restaurante.zip
```

### Mediante git
___
Instalar git en la instancia
```
sudo dnf install git
```

Clonar el repositorio en la instancia
```
git clone 'https://github.com/victorramirez952/SmallRestaurant-BDA.git'
```

## 8. Restaurar la base de datos
Moverse hacia donde la carpeta principal del Proyecto (SmallRestaurant-BDA o SmallRestaurant-BDA-main)

Crear una nueva base de datos en MariaDB llamada pro mediante los siguientes comandos
```sql
mysql -u root -p
CREATE DATABASE pro;
GRANT ALL PRIVILEGES ON pro.* TO alfaUser@localhost IDENTIFIED BY 'omega';
FLUSH PRIVILEGES;
```

Salir de MariaDB

Ingresar el siguiente comando para hacer el restore
```
mysql -u root -p pro < BDv0.4.sql
```

## 9. Verificación de código
Verificar que en app.py, después de app = Flask(__name__) se tenga algo como:
```python
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

```
Si no lo tiene es necesario modificar app.py

## 10. Instalar requerimientos para la aplicación
```
pip install -r requeriments.txt
```

## 11. Exportar la aplicación
### Exportar y levantar la aplicación flask
```
export FLASK_APP=app.py
flask run --host=0.0.0.0
```