$(function () {
  $('#deleteBtn').click(function (e) {
    e.preventDefault();
    $('#overlay').fadeIn();
    $('#modal-close-btn').click(function () {
      $('#overlay').fadeOut();
    });
    $("#delete-comformation-btn").click(function () {
      let href = $('#deleteBtn').attr("href");
      location.href = href;
    });
  });
});