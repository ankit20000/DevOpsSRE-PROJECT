from flask import Flask, redirect, url_for

app = Flask(__name__)

@app.route('/')
def hey():
    return redirect(url_for('hello'))

@app.route('/health')
def hello():
    return "hello world"

if __name__=='__main__':
    app.run(host='0.0.0.0', port=80)
