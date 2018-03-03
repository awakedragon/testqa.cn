from app import db
from datetime import datetime

class User(db.Model):
    __tablename__ = 'user'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(30), unique=True)
    password = db.Column(db.String(128))
    email = db.Column(db.String(128))
    last_login = db.Column(db.DateTime, default=datetime.now())
    is_superuser = db.Column(db.Integer, default=0)
    is_staff = db.Column(db.Integer, default=0)
    first_name = db.Column(db.String(30), default=None)
    last_name = db.Column(db.String(30), default=None)
    status = db.Column(db.String(30), default="inactive")

    def __init__(self, username, password, email):
        self.username = username
        self.password = password
        self.email = email

    def __repr__(self):
        return '<User %r>' % self.username