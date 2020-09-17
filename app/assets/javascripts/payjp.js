$(window).bind("load", function(){
  if (document.URL.match(/cards/)) {
    var payjp = Payjp('pk_test_92a7d8f9bdc9e0c5575bdbb0')
    var style = {
      base: {
        color: '#07689f',
        '::placeholder': {
          color: '#7e8a97',
          fontFamily: 'sans-serif',
          fontSize: '15px',
        }
      },
      invalid: {
        color: '#ec0101',
      }
    }
      // Payjp('gon.payjp_access_key') Payjp('pk_test_92a7d8f9bdc9e0c5575bdbb0')
    var elements = payjp.elements();
    var cardElement = elements.create('card', {style: style})
    cardElement.mount('#payjp-form');
    var submit_btn = $("#pay_submit");
    submit_btn.click(function (e) {
      e.preventDefault();
      payjp.createToken(cardElement).then(function (response) {
        if (response.error) {        // = 通信に失敗したとき
          alert(response.error.message)
          regist_card.prop('disabled', false)
        } else {
          alert("登録が完了しました");
          $("#card_token").append(
            `<input type="hidden" name="payjp_token" value=${response.id}>
            <input type="hidden" name="card_token" value=${response.card.id}>`
          );
          $('#card_form')[0].submit();
          // document.inputForm.submit();
          $("#card_number").removeAttr("name");
          $("#cvc-from").removeAttr("name");
          $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name");
        };
      });
    }); 
  }
});



