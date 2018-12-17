
from django import forms
from django.forms import widgets
from blog.models import UserInfo
from django.core.exceptions import ValidationError

class User(forms.Form):
    user = forms.CharField(min_length=6,label='用户名',
                           widget=widgets.TextInput(attrs={'class':'form-control'}),
                           error_messages={'required':'输入字段不能为空'})
    pwd = forms.CharField(min_length=6,label='密码',
                          widget=widgets.PasswordInput(attrs={'class':'form-control'}),
                          error_messages={'required': '输入字段不能为空'})
    r_pwd = forms.CharField(min_length=6,label='确认密码',
                            widget=widgets.PasswordInput(attrs={'class':'form-control'}),
                            error_messages={'required': '输入字段不能为空'})
    email = forms.EmailField(widget=widgets.EmailInput(attrs={'class':'form-control'}),
                             error_messages={'required': '输入字段不能为空'})

    def clean_user(self):
        name = self.cleaned_data.get('user')
        user = UserInfo.objects.filter(username=name).first()
        if user:
            raise ValidationError('该用户已存在！')
        else:
            return name
    def clean(self):
        pwd = self.cleaned_data.get('pwd')
        r_pwd = self.cleaned_data.get('r_pwd')
        if pwd and r_pwd:
            if pwd == r_pwd:
                return self.cleaned_data
            else:
                raise ValidationError('两次密码不一致！')
        else:
            return self.cleaned_data

