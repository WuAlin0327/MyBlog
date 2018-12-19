$(function () {
    // 基于ajax进行账号验证登陆
    $("#login_btn").click(function () {
        console.log(111);
        $.ajax({
            url: '/home/',
            type: 'post',
            data: {
                user: $('#user').val(),
                pwd: $('#pwd').val(),
                verify: $('#verify').val(),
                csrfmiddlewaretoken: $('[name=csrfmiddlewaretoken]').val()
            },
            success: function (data) {
                data = JSON.parse(data);
                if (data.msg) {
                    $('.error').html(data.msg).css({'color': 'red'}, 'margin-left', '10')
                    setTimeout(function () {
                        $('.error').html('')

                    }, 2000)
                } else {
                    window.location.href = '/index/'
                }

            }

        })
    });


    // 单击验证码图片可以对验证码进行刷新
    $('.verify_code_img').click(function () {
        this.src += '?'

    });
});
