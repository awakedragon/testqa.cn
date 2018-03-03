from sqlalchemy import and_, or_, desc
from sqlalchemy import and_, or_, desc
from app.application import db
from model.Team import Team

def list():
    team = Team.query.order_by(desc(Team.id)).all()
    return team