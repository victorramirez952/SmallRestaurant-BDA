from .entities.User import User


class ModelUser():

    @classmethod
    def login(self, db, user):
        try:
            cursor = db.connection.cursor()
            cursor.callproc('IniciarSesion', [user.Correo])
            # sql = """SELECT idUsuario, Correo, Contrasenia, idTipoUsuario FROM usuarios 
            #         WHERE Correo = '{}'""".format(user.Correo)
            # cursor.execute(sql)
            row = cursor.fetchone()
            if row != None:
                user = User(row[0], row[1], User.check_password(row[2], user.Contrasenia), row[3])
                return user
            else:
                return None
        except Exception as ex:
            raise Exception(ex)

    @classmethod
    def get_by_id(self, db, id):
        try:
            cursor = db.connection.cursor()
            sql = "SELECT idUsuario, Correo, Contrasenia, idTipoUsuario FROM usuarios WHERE idUsuario = {}".format(id)
            cursor.execute(sql)
            row = cursor.fetchone()
            print(row)
            if row != None:
                return User(row[0], row[1], None, row[2])
            else:
                return None
        except Exception as ex:
            raise Exception(ex)
