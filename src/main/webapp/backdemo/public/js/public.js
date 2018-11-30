// 导航下拉菜单
$(function () {
    $(".sidebar-item").mouseenter(function () {

        $('.sidebar-item').removeClass('index')
        $('.sidebar-item').children('p').removeClass('active')
        $(this).addClass('index')
        $(this).children('p').addClass('active')
        $(this).children('.sidebar-ul').stop(true, false).slideDown(500)
    })

    $('.sidebar-item').mouseleave(function () {
        $(this).children('.sidebar-ul').stop(true, false).slideUp(500)

    })
    // $('.sidebar-item').mouseout(function () {
    //     $(this).children('.sidebar-ul').slideUp(500, function () {})
    // })

    // $div = $('#editor1').children('div');
    // console.log($div.length)
    // if($div.length>0){
    //     $('#editor1').children("div:nth-of-type("+$div.length+")").find('img').attr("src","/logistics/"+pa);
    //     $('#editor1').children("div:nth-of-type("+$div.length+")").find('img')..attr("width","auto");
    // }
})
