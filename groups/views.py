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
    groups_active = 'active'
    return render_to_response('groups/index.html', locals(), context_instance = RequestContext(req))

def group(req):
    setting = settings
    groups_active = 'active'
    return render_to_response('groups/group.html', locals(), context_instance = RequestContext(req))

