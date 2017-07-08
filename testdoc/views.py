#!/usr/bin/env python
#encoding: utf-8
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from testdoc import fun

settings = {'title' : 'testdoc'}

def home(req):
    setting = settings
    home_active = 'active'
    is_home = True
    return render_to_response('index.html', locals(), context_instance = RequestContext(req))

def about(req):
    setting = settings
    about_active = 'active'
    return render_to_response('about.html', locals(), context_instance = RequestContext(req))
