#!/usr/bin/env python
#encoding: utf-8
import flask
from flask import Blueprint, render_template
from service import group as service

group = Blueprint('group', __name__, url_prefix='/group')
group_active = 'active'

@group.route('/')
def list():
    recomment = 'active'
    groups = service.list()
    return render_template('group/index.html', group_active=group_active, **locals())

@group.route('/hotest')
def hotest():
    hotest_active = 'active'
    groups = service.list()
    return render_template('group/index.html', group_active=group_active, **locals())

@group.route('/all')
def all():
    all_active = 'active'
    groups = service.list()
    return render_template('group/index.html', group_active=group_active, **locals())

@group.route('/search')
def search():
    groups = service.list()
    return render_template('group/index.html', group_active=group_active, **locals())

@group.route('/detail')
def detail():
    return render_template('group/detail.html', group_active=group_active, **locals())