#!/usr/bin/env python
#encoding: utf-8
from flask import Blueprint, render_template

qa = Blueprint('qa', __name__, url_prefix='/qa')
qa_active = 'active'

@qa.route('/')
def list():
    return render_template('qa/index.html', **globals())

@qa.route('/detail')
def detail():
    return render_template('qa/detail.html', **globals())
