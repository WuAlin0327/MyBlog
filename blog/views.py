from django.shortcuts import render, HttpResponse, redirect
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from django.db.models import Avg, Count, Max, Min, F
from django.db import transaction
from blog.utensil import verify_code, My_forms
from django.contrib import auth
from django.core.mail import send_mail
from MyBlog import settings
from threading import Thread
from bs4 import BeautifulSoup
from blog.models import *
import json
import os


# Create your views here.


def index(request):
    article_list = Article.objects.all().order_by('-create_time')

    return render(request, 'index.html', locals())


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

            blog_title = request.POST.get('blog_title')
            blog = Blog.objects.create(title=blog_title, site_name=user, theme=user + '的个人博客')
            UserInfo.objects.create_user(username=user, password=pwd, email=email, **extra,blog_id =blog.nid)

        else:
            response['msg'] = form.errors
        return JsonResponse(response)
    form = My_forms.User()
    return render(request, 'register.html', locals())

@login_required
def home_site(request, username, **kwargs):
    '''
    个人站点视图函数
    :param request:
    :return:
    '''
    # 用户对象查询
    user = UserInfo.objects.filter(username=username).first()
    print(user)

    # 判断用户是否存在
    if not user:
        return render(request, 'not_font.html')

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
            year, month = param.split('-')
            article_list = article_list.filter(create_time__year=year, create_time__month=month)

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

    return render(request, 'home_site.html', locals())


@login_required
def article_detail(request, username, article_id):
    '''
    文章详细页视图
    :param request:
    :param username:
    :param article_id:
    :return:
    '''
    article = Article.objects.filter(pk=article_id).first()
    comment_content = Comment.objects.filter(article_id=article_id)

    return render(request, 'article_detail.html', locals())


def digg(request):
    '''
    点赞视图函数
    :param request:
    :return:
    '''

    article_id = request.POST.get('article_id')
    is_up = json.loads(request.POST.get('is_up'))
    user_id = request.user.pk
    # 判断点赞踩灭记录是否存在，如果存在则返回不能重复点赞，如果不存在则添加记录
    article_up_down = ArticleUpDown.objects
    is_exist = article_up_down.filter(user_id=user_id, article_id=article_id).first()

    response = {'msg': None, 'status': True}
    if is_exist:
        response['status'] = False
        response['handled'] = is_exist.is_up
    else:
        # 判断是点赞还是踩灭
        article_obj = Article.objects.filter(pk=article_id)
        if is_up:
            article_obj.update(up_count=F('up_count') + 1)
        else:
            article_obj.update(down_count=F('down_count') + 1)

        article_up_down.create(user_id=user_id, article_id=article_id, is_up=is_up)

    return JsonResponse(response)


def comment(request):
    '''
    文章评论功能
    :param request:
    :return:
    '''
    pid = request.POST.get('pid')
    content = request.POST.get('content')
    article_id = request.POST.get('article_id')
    user = request.user.pk
    article_obj = Article.objects.filter(pk=article_id)
    print(article_id)
    with transaction.atomic():
        article_obj.update(comment_count=F('comment_count') + 1)
        comment = Comment.objects.create(user_id=user, content=content, parent_comment_id=pid, article_id=article_id)

    response = {
        'username': request.user.username,
        'content': content,
        'create_time': comment.create_time.strftime('%Y-%m-%d %X')
    }
    if pid:
        response['parent_comment_user'] = comment.parent_comment.user.username
        response['parent_comment_content'] = comment.parent_comment.content
        response['parent_comment_create_time'] = comment.parent_comment.create_time.strftime('%Y-%m-%d %X')

    # 发送邮件
    '''
    在settings.py中配置以下内容
    EMAIL_HOST = 'smtp.exmail.qq.com'  
    EMAIL_PORT = 456
    EMAIL_HOST_USER = ''    # 账号
    EMAIL_HOST_PASSWORD = ''  #密码
    DEFAULT_FROM_EMAIL = EMAIL_HOST_USER
    EMAIL_USE_SSL = True  #证书
    
    '''

    # send_mail(
    #     '您的文章%s新增了一条评论'%article_obj[0].title,# 标题
    #           content,# 内容
    #     settings.EMAIL_HOST_USER,
    #     ['15083623778@163.com'] # 发送用户邮箱
    # )
    send = Thread(target=send_mail, args=(
        '您的文章%s新增了一条评论' % article_obj[0].title,
        content,
        settings.EMAIL_HOST_USER,
        ['15083623778@163.com']))
    send.start()
    return JsonResponse(response)


def manage_article(request, username):
    '''
    新增文章
    :param request:
    :param username:
    :return:
    '''
    if request.method == 'POST':
        print(request.POST)
        title = request.POST.get('title')
        content = request.POST.get('content')
        soup = BeautifulSoup(content, 'html.parser')
        for tag in soup.find_all():
            if tag.name == 'script':
                tag.decompose()
        desc = soup.text[0:150]
        category_id = request.POST.get('select_id')
        tag_id = request.POST.get('tag_id')

        article = Article.objects.create(title=title, content=str(soup), desc=desc, user=request.user, category_id=category_id)
        Article2Tag.objects.create(tag_id=tag_id, article_id=article.nid)
        return redirect('/%s/' % username)
    # 获取分类
    category = Category.objects.filter(blog_id=request.user.blog.nid)
    tag = Tag.objects.filter(blog_id=request.user.blog.nid)
    return render(request, 'article_manage.html', locals())


def upload(request):
    '''
    文本编辑器图片上传
    :param request:
    :return:
    '''
    print(request.FILES)
    img = request.FILES.get('imgFile')

    path = os.path.join(settings.MEDIA_ROOT, 'article_img', img.name)
    with open(path, 'wb') as f:
        for line in img:
            f.write(line)
    response = {
        'error': 0,
        'url': 'media/article_img/%s' % img.name
    }
    return JsonResponse(response)


def remove_article(request, username, article_id):
    '''
    删除文章
    :param request:
    :param username:
    :param article_id:
    :return:
    '''
    if request.user.username == username:
        Article.objects.filter(pk=article_id).delete()

        return redirect('/%s/' % username)

    return HttpResponse('无法删除他人文章')


def edit_article(request, username, article_id):
    '''
    编辑文章内容
    :param request:
    :param username:
    :param article_id:
    :return:
    '''
    if request.method == 'POST':
        title = request.POST.get('title')
        content = request.POST.get('content')
        soup = BeautifulSoup(content, 'html.parser')
        for tag in soup.find_all():
            if tag.name == 'script':
                tag.decompose()
        desc = soup.text[0:150]
        Article.objects.filter(pk=article_id).update(title=title, content=str(soup), desc=desc)

        return redirect('/%s/' % username)
    article = Article.objects.filter(pk=article_id).first()
    return render(request, 'edit_article.html', locals())


def add_category(request):
    '''
    新增分类
    :param request:
    :return:
    '''
    blog_id = request.POST.get('blog_id')
    title = request.POST.get('category_title')
    Category.objects.create(blog_id=blog_id, title=title)
    response = {
        'status': True,
        'user': request.user.username
    }
    return JsonResponse(response)


def add_tag(request):
    '''
    新增标签
    :param request:
    :return:
    '''
    blog_id = request.POST.get('blog_id')
    title = request.POST.get('tag_title')
    Tag.objects.create(blog_id=blog_id, title=title)
    response = {
        'status': True,
        'user': request.user.username
    }

    return JsonResponse(response)