class Config:
    SECRET_KEY = 'B!1w8NAt1T^%kvhUI*S^'


class DevelopmentConfig(Config):
    DEBUG = True
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'alfaUser'
    MYSQL_PASSWORD = 'omegalambda'
    MYSQL_DB = 'proyecto_final'


config = {
    'development': DevelopmentConfig
}
