$(function () {
  // new Swiper('.swiper-container', {
  //   // Optional parameters
  //   direction: 'vertical',
  //   loop: true,
  
  //   // If we need pagination
  //   pagination: {
  //     el: '.swiper-pagination',
  //   },
  
  //   // Navigation arrows
  //   navigation: {
  //     nextEl: '.swiper-button-next',
  //     prevEl: '.swiper-button-prev',
  //   },
  
  //   // And if we need scrollbar
  //   scrollbar: {
  //     el: '.swiper-scrollbar',
  //   },
  // })
  new Swiper('.swiper-container', {
      navigation: {
        prevEl: '.swiper-button-prev', //左側にあるこれ「＜」
        nextEl: '.swiper-button-next', //右側にあるこれ「＞」
      },
    loop: true, //画像のループの有無
      effect: 'fade',
      
      speed: 3000, //スライドするスピード
      pagination: { //ページネーションの種類
        el: '.swiper-pagination',
        type: 'bullets',
        clickable: true, //クリック判定の有無
      },
      autoplay: { //自動スライド
        delay: 6000, //3秒ごとに
        disableOnInteraction: true
      },
    });
});


// var swiper = new Swiper('.swiper-container', {
//   navigation: {
//     prevEl: '.swiper-button-prev', //左側にあるこれ「＜」
//     nextEl: '.swiper-button-next', //右側にあるこれ「＞」
//   },
//   loop: true, //画像のループの有無
//   speed: 1000, //スライドするスピード
//   pagination: { //ページネーションの種類
//     el: '.swiper-pagination',
//     type: 'bullets',
//     clickable: true, //クリック判定の有無
//   },
//   autoplay: { //自動スライド
//     delay: 3000, //３秒ごとに
//     disableOnInteraction: true
//   },
// });
