#!/usr/bin/env python
#encoding: utf-8
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponse, HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from testdoc import fun

def home(req):
    return render_to_response('myprofile/index.html', locals(), context_instance = RequestContext(req))
