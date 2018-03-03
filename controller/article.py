#!/usr/bin/env python
#encoding: utf-8
from flask import Blueprint, render_template

article = Blueprint('article', __name__, url_prefix='/article')
article_active = 'active'

@article.route('/')
def list():
    return render_template('article/index.html', **globals())

@article.route('/detail')
def detail():
    return render_template('article/detail.html', **globals())

