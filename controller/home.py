#!/usr/bin/env python
#encoding: utf-8
from flask import Blueprint, render_template

home = Blueprint('/', __name__, url_prefix='')

@home.route('/')
def index():
    is_home = True
    home_active = 'active'
    return render_template('index.html', **locals())

@home.route('/about')
def about():
    about_active = 'active'
    return render_template('about.html', **locals())
