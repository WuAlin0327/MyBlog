from django.shortcuts import render, HttpResponse, redirect
from django.db.models.functions import TruncMonth
from django.http import JsonResponse
from django.db.models import Avg,Count,Max,Min
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


def home_site(request,username,**kwargs):
    '''
    个人站点视图函数
    :param request:
    :return:
    '''

    print('kwargs',kwargs)
    # 用户对象查询
    user = UserInfo.objects.filter(username=username).first()

    # 判断用户是否存在
    if not user:
        return render(request,'not_font.html')

    # 个人站点文章
    article_list = Article.objects.filter(user=user)
    if kwargs:
        condition = kwargs.get('condition')
        param = kwargs.get('param')
        if condition == 'category':
            article_list = article_list.filter(category__title=param)
        elif condition == 'tag':
            article_list = article_list.filter(tags__title=param)
        else:
            year,month = param.split('-')
            article_list = article_list.filter(create_time__year=year,create_time__month=month)


    # 个人站点查询
    blog = user.blog
    #
    #
    # # 查询当前站点的每一个分类名称以及对应的文章数
    # cate_list = Category.objects.filter(blog=blog).values('pk').annotate(c=Count('article__title')).values('title','c')
    #
    #
    # # 查询当前站点的每一个标签名称以及对应的文章数
    # tag_list = Tag.objects.filter(blog=blog).values('pk').annotate(c=Count('article')).values('title','c')
    #
    #
    # # 查询当前站点每一个年月的名称以及对应的文章数
    #
    # # 日期归档查询方式1
    # # extra方法构建新的字段，可以在里面写类似与sql的语句
    # date_list = Article.objects.filter(user=user).extra(select={'y_m_date':'date_format(create_time,"%%Y-%%m")'}).values('y_m_date').annotate(c = Count('title')).values('y_m_date','c')
    #
    #
    # # 日期归档查询方式2
    # from django.db.models.functions import TruncMonth
    # # 使用方式2实现方式1
    # date_list = Article.objects.filter(user=user).annotate(month=TruncMonth('create_time')).values('month').annotate(c=Count('nid')).values('month','c')

    return render(request,'home_site.html',locals())

def article_detail(request,username,article_id):
    '''
    文章详细页视图
    :param request:
    :param username:
    :param article_id:
    :return:
    '''
    return render(request,'article_detail.html',locals())