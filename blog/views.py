from django.shortcuts import render,HttpResponse,redirect
from django.http import JsonResponse
from blog import verify_code

# Create your views here.


def index(request):
    return render(request,'index.html')


def verify_code_img(request):
    img = verify_code.get_verify_code_img(request)

    return HttpResponse(img)

def login(request):

    user = request.POST.get('user')
    pwd = request.POST.get('pwd')
    ver_code = request.POST.get('verify')
    verify = request.session.get('verify')
    if ver_code.upper() == verify.upper():
        pass
    else:
        pass
    return JsonResponse({'status':'ok'})