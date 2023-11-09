from flask import Flask
app = Flask(__name__)

@app.route("/")
def hello():
    return "Default Page"

@app.route('/health')
def health():
    health_status = True
    if health_status:
        resp= "Server is Healthy"
        status_code = 200
    else:
        resp = "Server is Unhealthy"
        status_code = 500

    return resp,status_code


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)