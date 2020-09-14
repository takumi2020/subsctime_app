$(function () {
  function buildHTML(comment) {
    let html = `<div class='showProduct-comment'>
                        <div class='b-left-wrapper'>
                          <a href=/products/${comment.user_id}>${comment.user_name}</a>:
                        </div>
                        <div class='b-left'>
                          ${comment.text}
                        </div>
                    </div>`
    return html;
    }
    $('#new_comment').on('submit', function (e) {
      e.preventDefault();
      let fromData = new FormData(this);
      let url = $(this).attr('action')
      $.ajax({
        url: url,
        type: "POST",
        data: fromData,
        dataType: 'json',
        processData: false,
        contentType: false,
      })
        .done(function (data) {
          let html = buildHTML(data);
          $('.comments').append(html);
          $('.showComment__text').val('');
          $('.showComment__btn').prop('disabled', false);
        })
        .fail(function () {
          alert('error');
        })
    })
});

