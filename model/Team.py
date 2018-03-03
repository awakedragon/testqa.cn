from app.application import db
from datetime import datetime

class Team(db.Model):
    __tablename__ = 'ww_team'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(30), unique=True)
    description = db.Column(db.Text)
    creator = db.Column(db.Integer)
    icon = db.Column(db.String(255))
    status = db.Column(db.String(30), default="inactive")

    def __init__(self, name, description, creator, icon):
        self.name = name
        self.description = description
        self.creator = creator
        self.icon = icon

    def __repr__(self):
        return '<Team %r>' % self.name