# MyBlog
### 功能设计
- 登陆
    - 不单独开登陆，登陆功能使用导航条弹出模态框形式弹出
    - 登陆与注册方式：ajax
- 注册
    - 使用forms组件渲染注册所需要的input框
    - 注册页面上传头像以及头像预览功能

- 设计首页布局以及对文章列表渲染
    - 将页面分成三分 -2  -8  -2
    - 左侧为文章分类等(暂时用其他元素填充)
    - 中间为文章显示区域（重点）
    
- 设计个人站点首页，渲染个人发表的文章以及文章分类，标签分类，时间归档等


- 设计文章详情页
    - 文章详情页只有内容区域不同，右侧的标签分类，时间归档，随笔分类等都是一样，所以创建了layout.html标签，用于页面布局，home_site(用户个人站点)与article_detail.html(文章详情页)都继承于layout.html,并且layout.html中的右侧标签分类等都是使用自定义标签进行渲染:从数据库中获取数据渲染到右侧
    - 自定义标签源代码：
    
这里用到了一个inclusion_tag()的装饰器，该装饰器括号中接收模板语法的html文件，然后函数执行后返回的数据渲染到html页面中，在html中执行该函数后拿到的是一堆html标签，拿到后渲染到页面上
```
from django import template
from django.db.models.functions import TruncMonth
from django.db.models import Count

from blog.models import *

register = template.Library()

@register.inclusion_tag('class_tag.html')
def get_left_label(username):
    user = UserInfo.objects.filter(username=username).first()
    blog = user.blog
    cate_list = Category.objects.filter(blog=blog).values('pk').annotate(c=Count('article__title')).values('title', 'c')
    tag_list = Tag.objects.filter(blog=blog).values('pk').annotate(c=Count('article')).values('title', 'c')
    date_list = Article.objects.filter(user=user).annotate(month=TruncMonth('create_time')).values('month').annotate(c=Count('nid')).values('month', 'c')
    return {'user':user,'blog':blog,'cate_list':cate_list,'tag_list':tag_list,'date_list':date_list}
```
在layout.html中渲染


```
{% block content %}
    <div class="container">
        <div class="row">
            <div class="col-lg-9">

            {% block layout %}
{#                这里是放文章详情页的#}
            {% endblock %}
            </div>

        <div class="col-lg-3">
            {% load my_tags %}
            {% get_left_label request.user.username %}

        </div>
        </div>

    </div>
{% endblock %}

```
       
    