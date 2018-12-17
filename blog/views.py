from django.shortcuts import render,HttpResponse,redirect
from django.http import JsonResponse
from blog.utensil import verify_code,My_forms
from django.contrib import auth
import json
from blog.models import *

# Create your views here.


def index(request):
    return render(request,'index.html')


def verify_code_img(request):
    img = verify_code.get_verify_code_img(request)

    return HttpResponse(img)

def login(request):
    if request.method == 'POST':
        response = {
            'user':None,
            'msg':None
        }
        user = request.POST.get('user')
        pwd = request.POST.get('pwd')
        ver_code = request.POST.get('verify')
        verify = request.session.get('verify')
        if ver_code.upper() == verify.upper():
            user = auth.authenticate(username=user,password=pwd)
            if user:
                auth.login(request,user)
                response['user'] = user.username
            else:
                response['msg'] = '账号或者密码错误'
        else:
            response['msg'] = '验证码错误'

        res = json.dumps(response)
        return HttpResponse(res)
    return render(request,'home.html')
def logout(request):
    auth.logout(request)
    return redirect('/home/')

def register(request):
    if request.method == 'POST':

        response = {'msg':None,'user':None}
        form = My_forms.User(request.POST)
        if form.is_valid():
            response['user'] = form.cleaned_data.get('user')

            # 生成一条记录
            user = form.cleaned_data.get('user')
            pwd = form.cleaned_data.get('pwd')
            email = form.cleaned_data.get('email')
            file_obj = request.FILES.get('avatar')
            UserInfo.objects.create_user(username=user,password=pwd,email=email,avatar=file_obj)

        else:

            response['msg'] = form.errors

        return JsonResponse(response)
    form = My_forms.User()
    return render(request,'register.html',locals())
