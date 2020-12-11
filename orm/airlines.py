from flask import Flask, render_template, request, jsonify, redirect, url_for
from models import db, Passenger, Flight

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgres://tylwqhnnfjvqkh:74f6ef069aa300ca77fd037fe327c8862e8fce251a31e6d49c9ed9dad5caa477@ec2-35-169-184-61.compute-1.amazonaws.com:5432/d6cves5kbuk51t'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db.init_app(app)

@app.route('/passengers')
def passengers():
    passengers = Passenger.query.all()
    return render_template('passengers.html', passengers=passengers)

@app.route('/flights')
def flights():
    """List all flights."""
    flights = Flight.query.all()
    return render_template('flights.html', flights=flights)

@app.route('/flight/<int:flight_id>')
def flight(flight_id):
    flight = Flight.query.filter_by(id=flight_id).first_or_404()
    return render_template('flight.html', flight=flight)

@app.route('/addflight', methods=['GET', 'POST'])
def addflight():
    if request.method == 'POST':
        origin = request.form.get('origin')
        destination = request.form.get('destination')
        try:
            duration = int(request.form.get('duration'))
        except ValueError:
            duration = None
        if origin and destination and duration:
            flight = Flight(origin=origin, destination=destination, duration=duration)
            db.session.add(flight)
            db.session.commit()
            return redirect(url_for('flights'))
        else:
            return redirect(url_for('addflight'))
    return render_template('addflight.html')

@app.route('/api/flights/<int:flight_id>')
def api_flight(flight_id):
    flight = Flight.query.filter_by(id=flight_id).first()
    if flight:
        data = { 'origin': flight.origin, 'destination': flight.destination, 'duration': flight.duration }
    else:
        data = { 'error': 'Invalid flight_id' }
    return jsonify(data)
