from django import template
from django.db.models.functions import TruncMonth
from django.db.models import Count

from blog.models import *

register = template.Library()
@register.simple_tag()
def multi_tag(x,y):
    return x*y

@register.inclusion_tag('class_tag.html')
def get_left_label(username):
    user = UserInfo.objects.filter(username=username).first()
    blog = user.blog
    cate_list = Category.objects.filter(blog=blog).values('pk').annotate(c=Count('article__title')).values('title', 'c')
    tag_list = Tag.objects.filter(blog=blog).values('pk').annotate(c=Count('article')).values('title', 'c')
    date_list = Article.objects.filter(user=user).annotate(month=TruncMonth('create_time')).values('month').annotate(c=Count('nid')).values('month', 'c')
    return {'user':user,'blog':blog,'cate_list':cate_list,'tag_list':tag_list,'date_list':date_list}