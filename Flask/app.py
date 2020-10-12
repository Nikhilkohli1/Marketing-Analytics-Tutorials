from flask import Flask,request

app = Flask(__name__)

@app.route('/')
def welcome():
    return "Hello World, This is my first Flask application!"

@app.route('/second')
def secondpage():
    return "This is my second page!"
    
    
@app.route('/method',methods =['GET','POST'])
def method():
    if request.method == 'POST':
        return "It is a post request"
    else:
        return "It is a get request"

app.run()
