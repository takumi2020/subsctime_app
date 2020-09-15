var $input = $('.form-fieldset > input');

$input.blur(function (e) {
  $(this).toggleClass('filled', !!$(this).val());
});


$(function() {
  $('#passEye').click(function () {
    if ($(this).hasClass('fa-eye')) {
      $(this).removeClass('fa-eye').addClass('fa-eye-slash');
      $('.password').attr('type', 'text');
    } else {
      $(this).removeClass('fa-eye-slash').addClass('fa-eye');
      $('.password').attr('type', 'password');
    }
  });
})