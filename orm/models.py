import os

from flask import Flask
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class Flight(db.Model):
    __tablename__ = 'flights'
    id = db.Column(db.Integer, primary_key=True)
    origin = db.Column(db.String)
    destination = db.Column(db.String)
    duration = db.Column(db.Integer)

    passengers = db.relationship('Passenger', backref='flight', lazy='dynamic')

    def __repr__(self):
        return f'Flight(id={self.id}, origin=\'{self.origin}\', destination=\'{self.destination}\', duration={self.duration})'

class Passenger(db.Model):
    __tablename__ = 'passengers'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String)
    flight_id = db.Column(db.Integer, db.ForeignKey("flights.id"))


    def __repr__(self):
        return f'Passenger(id={self.id}, name=\'{self.name}\', flight_id={self.flight_id})'
