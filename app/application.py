from flask import Flask
from config import config
from flask_sqlalchemy import SQLAlchemy
from utils import redisdb

db = SQLAlchemy()
rdb = redisdb.RedisDB()

import bpurls

def create_app(config_name):
    app = Flask(__name__)
    app.config.from_object(config[config_name])
    config[config_name].init_app(app)

    # bootstrap.init_app(app)
    # mail.init_app(app)
    # moment.init_app(app)
    db.init_app(app)
    bpurls.init_app(app)

    return app