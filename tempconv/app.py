from flask import Flask, request, abort

app = Flask(__name__)

@app.route('/')
def index():
    return '<p>Temperature Conversion App</p>'

@app.route('/<loc>')
def location(loc):
    return f'<p>Location: {loc}</p>'

@app.route('/convert/<func>')
def convert(func):
    try:
        degree = int(request.args.get('degree'))
    except:
        abort(404)
    if func == 'f_c':
        f = degree
        c = (f - 32) * 5 / 9
        return f'<p>{f} F = {c:.1f} C</p>'
    elif func == 'c_f':
        c = degree
        f = c * 9 / 5 + 32
        return f'<p>{c} C = {f:.1f} F</p>'

if __name__ == '__main__':
    app.run(debug=True)
