class Config:
    SECRET_KEY = 'B!1w8NAt1T^%kvhUI*S^'


class DevelopmentConfig(Config):
    DEBUG = True
    MYSQL_HOST = 'localhost'
    MYSQL_USER = 'alfaUser'
    MYSQL_PASSWORD = 'omega'
    MYSQL_DB = 'pro'


config = {
    'development': DevelopmentConfig
}
