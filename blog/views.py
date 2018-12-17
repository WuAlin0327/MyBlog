from django.shortcuts import render, HttpResponse, redirect
from django.http import JsonResponse
from blog.utensil import verify_code, My_forms
from django.contrib import auth
from blog.models import *
import json

# Create your views here.


def index(request):
    article_list = Article.objects.all()
    return render(request, 'index.html',locals())


def verify_code_img(request):
    '''
    动态获取验证码图片
    :param request:
    :return:
    '''
    img = verify_code.get_verify_code_img(request)

    return HttpResponse(img)


def login(request):
    '''
    登陆
    :param request:
    :return:
    '''
    if request.method == 'POST':
        response = {
            'user': None,
            'msg': None
        }
        user = request.POST.get('user')
        pwd = request.POST.get('pwd')
        ver_code = request.POST.get('verify')
        verify = request.session.get('verify')
        if ver_code.upper() == verify.upper():
            user = auth.authenticate(username=user, password=pwd)
            if user:
                auth.login(request, user)
                response['user'] = user.username
            else:
                response['msg'] = '账号或者密码错误'
        else:
            response['msg'] = '验证码错误'

        res = json.dumps(response)
        return HttpResponse(res)
    return render(request, 'home.html')


def logout(request):
    '''
    注销
    :param request:
    :return:
    '''
    auth.logout(request)
    return redirect('/home/')


def register(request):
    '''
    注册
    :param request:
    :return:
    '''
    if request.method == 'POST':
        response = {'msg': None, 'user': None}
        form = My_forms.User(request.POST)
        if form.is_valid():
            response['user'] = form.cleaned_data.get('user')
            # 生成一条记录
            user = form.cleaned_data.get('user')
            pwd = form.cleaned_data.get('pwd')
            email = form.cleaned_data.get('email')
            file_obj = request.FILES.get('avatar')

            # 判断用户有没有上传文件，如果没有上传，则avatar是默认的路径
            extra = {}
            if file_obj:
                extra['avatar'] = file_obj
            UserInfo.objects.create_user(username=user, password=pwd, email=email, **extra)
            blog_title = request.POST.get('blog_title')
            Blog.objects.create(title=blog_title,site_name=user,theme=user+'的个人博客')
        else:
            response['msg'] = form.errors
        return JsonResponse(response)
    form = My_forms.User()
    return render(request, 'register.html', locals())
