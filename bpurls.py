from controller.home import home
from controller.group import group
from controller.qa import qa
from controller.article import article

prefix = [home, group, qa, article]

def init_app(app):
    for i in prefix:
        app.register_blueprint(i)