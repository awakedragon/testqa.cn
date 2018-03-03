import functools
import flask
from flask import request

def require(*required_args):
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args, **kw):
            for arg in required_args:
                if arg not in request.json:
                    return flask.abort(400)
            return func(*args, **kw)
        return wrapper
    return decorator

def singleton(className):
    def wrapped():
        it =  className.__dict__.get('__it__')
        if it is not None:
            return it

        className.__it__=className()
        return className.__it__
    return wrapped

def handle_uploaded_file(f):
    destination = open('static/upload/%s' % f.name,'wb')
    for chunk in f.chunks():
        destination.write(chunk)
    destination.close()
    return True

def warp_data(data):
    data = dict(data)
    for k,v in data.items():
        if isinstance(v, list):
            if len(v)>1:
                data[k] = ','.join(v)
            elif len(v)==1:
                data[k] = v[0]
            else:
                data[k] = ''
        else:
            data[k] = ''
    return data