"""MyBlog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path
from blog import views
from django.views.static import serve
from MyBlog import settings
from django.conf.urls import url

urlpatterns = [
    path('admin/', admin.site.urls),
    path('index/', views.index),
    path('verify_code_img/', views.verify_code_img),
    path('home/', views.login, name='home'),
    path('digg/', views.digg),
    path('comment/', views.comment),
    re_path(r'^$', views.login, ),
    path('logout/', views.logout),
    path('register/', views.register),
    re_path('media/(?P<path>.*)$', serve, {'document_root': settings.MEDIA_ROOT}),
    re_path('(?P<username>\w+)/articles/(?P<article_id>\d+)/$', views.article_detail),
    # 个人站点URL
    re_path('(?P<username>\w+)/$', views.home_site),
    re_path('(?P<username>\w+)/(?P<condition>tag|category|archive)/(?P<param>.*)$', views.home_site),

]
