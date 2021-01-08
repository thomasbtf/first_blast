from flask import Flask, request
from flask_restful import Resource, Api

print('hello world!\n')

class Greeting (Resource):
    def get(self):
        return 'Hello World!'

app = Flask(__name__)
api = Api(app)

api.add_resource(Greeting, '/') # Route_1

if __name__ == '__main__':
    app.run()

print('\ntschau world!')