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
    ask_active = 'active'
    return render_to_response('ask/index.html', locals(), context_instance = RequestContext(req))

def ask(req):
    setting = settings
    ask_active = 'active'
    return render_to_response('ask/ask.html', locals(), context_instance = RequestContext(req))