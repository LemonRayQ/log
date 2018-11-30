
//轮播图的初始化
$(document).ready(function () {
  var mySwiper = new Swiper('.swiper-container', {
    autoplay: true,
    // 如果需要分页器
    pagination: {
      el: '.swiper-pagination',
    },
    // 如果需要前进后退按钮
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },

  })
})

//回到顶部
var backButton = $('.back-header');
function backToTop() {
  $('html,body').animate({
    scrollTop: 0
  }, 800);
}
backButton.on('click', backToTop);
$(window).on('scroll', function () {/*当滚动条的垂直位置大于浏览器所能看到的页面的那部分的高度时，回到顶部按钮就显示 */
  if ($(window).scrollTop() > 50)
    backButton.fadeIn();
  else
    backButton.fadeOut();
});
$(window).trigger('scroll');/*触发滚动事件，避免刷新的时候显示回到顶部按钮*/
