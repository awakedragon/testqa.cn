#!/usr/bin/env python
#encoding: utf-8
from flask import Blueprint, render_template, request

profile = Blueprint('profile', __name__, url_prefix='/profile')

@profile.route('/', methods=['POST', 'GET'])
def home(req):
    return render_template('profile/index.html', **locals())
