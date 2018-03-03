#!/usr/bin/env python
#  -*- coding: utf-8 -*-
import time

def now():
    return time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))

def mk_md5(s):
    import hashlib
    m = hashlib.md5()
    m.update(s)
    return m.hexdigest()