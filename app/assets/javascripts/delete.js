$(function () {
  $('#modal-open-btn').click(function (e) {
    e.preventDefault();
    $('#overlay').fadeIn();
    $('#modal-close-btn').click(function () {
      $('#overlay').fadeOut();
    });
    $("#delete-comformation-btn").click(function () {
      const href = $('a#deleteBtn').attr("href");
      location.href = href;
    });
  });
});