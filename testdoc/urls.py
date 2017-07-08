from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns('',

    url(r'^$', 'testdoc.views.home', name='home'),
    url(r'^ask/', include('ask.urls')),
    url(r'^article/', include('article.urls')),
    url(r'^groups/', include('groups.urls')),

    url(r'^userauth/', include('userauth.urls')),
    url(r'^myprofile/', include('myprofile.urls')),

    url(r'^about$', 'testdoc.views.about'),

    url(r'^admin/', include(admin.site.urls)),

)
