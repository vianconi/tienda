# from flask_script import Manager // flask_script esta obsoleto
from flask import Flask
from app import inicializar_app
from config import config

configuracion = config['development']
app = inicializar_app(configuracion)

# manager = Manager(app) // obsoleto

if __name__ == '__main__':
    # manager.run() // obsoleto
    app.run(debug=True)