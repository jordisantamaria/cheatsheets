from flask import Flask
# name of aplication module, if single module, should use __name__
app = Flask(__name__)

@app.route('/hello')
def hello_world():
    return 'Hello, World!'
