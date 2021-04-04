import json
from flask import Flask, request, jsonify
# name of aplication module, if single module, should use __name__
app = Flask(__name__)

@app.route('/hello')
def hello_world():
    return 'Hello, World!'


@app.route('/post', methods=['POST'])
def post():
    record = json.loads(request.data)
    user = record['user']
    print(f"user = {user}")
    return record
