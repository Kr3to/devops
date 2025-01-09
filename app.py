from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello():
    return "This is a simple Flask app to demonstrate proper functioning of docker container."

@app.route('/contact')
def contact():
    return 'Contact: mateusz.kret@microsoft.wsei.edu.pl'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
