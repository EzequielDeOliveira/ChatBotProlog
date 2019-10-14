from flask import Flask, render_template
from flask_socketio import SocketIO
import json as js
from pyswip import Prolog, Variable, call
from time import sleep

prolog = Prolog()
prolog.consult("../../main.pl")
app = Flask(__name__)
app.config['SECRET_KEY'] = 'vnkdjnfj1232'
socketio = SocketIO(app)


@app.route('/')
def sessions():
    return render_template('session.html')


def messageReceived(methods=['GET', 'POST']):
    print('message was received!!!')


@socketio.on('my event')
def handle_my_custom_event(json, methods=['GET', 'POST']):
    print('received my event: ' + str(json))
    if str(json) != "{'data': 'User Connected'}":
            res = prolog.query('pokemon(pikachu,X).')
            print(res)
    socketio.emit('my response', json, callback=messageReceived)

def prolog_response(question):
    print(list(prolog.query('pokemon(pikachu,X).')))


if __name__ == '__main__':
    socketio.run(app, debug=True)
