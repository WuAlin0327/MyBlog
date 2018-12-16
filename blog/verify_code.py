import random
from PIL import Image, ImageDraw, ImageFont
from io import BytesIO


def random_str():
    '''
    生成随机字符
    :return:随机字符
    '''
    random_int = str(random.randint(0,9))
    random_up = chr(random.randint(65,90))
    random_down = chr(random.randint(97,122))
    retu_str = random.choice([random_int,random_up,random_down])
    return retu_str

def rndColor():
    '''
    生成随机颜色
    :return: 随机rbg颜色
    '''
    return (random.randint(0, 255), random.randint(10, 255), random.randint(64, 255))
def get_verify_code_img(request):



    # 创建图片与画笔
    img = Image.new(mode='RGB',size=(186,34),color=rndColor())
    draw = ImageDraw.Draw(img)
    verify = ''
    font = ImageFont.truetype(font='static/font/font1.ttf',size=20)
    for i in range(6):
        char = random_str()
        verify += char
        draw.text([i*20+50,5],char,font=font,fill=rndColor())

    request.session['verify'] = verify
    f = BytesIO()
    img.save(f,'png')
    data = f.getvalue()
    return data