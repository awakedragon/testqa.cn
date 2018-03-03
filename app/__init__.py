import os
from .application import create_app, db, rdb

app = create_app(os.getenv('FLASK_CONFIG') or 'default')

from controller.error import *
