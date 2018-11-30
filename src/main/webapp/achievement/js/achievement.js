// 点击预览图片
$(function () {
    // 点击弹出预览图
    var num;
    $(".thumbnail").click(function () {
        zoom(this)
        $(".preview").fadeIn(1000)
        num = $(this).attr('index')
    })

    //关闭预览图
    $('.close').click(function () {
        $('.preview').fadeOut(1000);
    })

    function zoom(that) {
        var imgsrc = $(that).find('img').attr('src');
        var text = $(that).find('p').text();
        $(".preview").find('img').attr({
            src: imgsrc
        });
        $('.preview').find('.text').text(text);
    }

    $('.left').click(function () {
        --num;
        if (num < 0) {
            num = $('.thumbnail').length - 1
        }
        var that = $('.thumbnail').eq(num)
        zoom(that)
    })

    $('.right').click(function () {
        ++num;
        if (num >= $('.thumbnail').length) {
            num = 0
        }
        var that = $('.thumbnail').eq(num)
        zoom(that)
    })
})