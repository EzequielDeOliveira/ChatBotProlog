from flask import Flask, render_template, request
import random
app = Flask(__name__)

phrase = []

@app.route("/")
def index():
    return render_template('index.html')

@app.route('/response', methods=['POST'])
def response():
    if request.method == 'POST':
        name = request.form.get("name")
        phrase.append(name)
    return render_template('index.html',phrase=phrase)

if __name__ == "__main__":
    app.config['TEMPLATE_AUTO_RELOAD'] = True
    app.run()