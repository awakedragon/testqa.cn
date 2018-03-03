#!/usr/bin/env python
#encoding: utf-8
from flask import Blueprint, render_template, request
from service import auth

auth = Blueprint('auth', __name__, url_prefix='/auth')

@auth.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == 'GET':
        return render_template('login.html')
    else:
        username = request.form.get('username')
        password = request.form.get('password')
        result = auth.auth(username, password)
        if result:
            return {'redirect': "/"}
        else:
            return {}