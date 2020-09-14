$(window).bind("load", function(){
  if (document.URL.match(/cards/)) {
    var payjp = Payjp(gon.payjp_access_key)
    var elements = payjp.elements();
    var numberElement = elements.create('cardNumber');
    var expiryElement = elements.create('cardExpiry');
    var cvcElement = elements.create('cardCvc');
    numberElement.mount('#number-form');
    expiryElement.mount('#expiry-form');
    cvcElement.mount('#cvc-form');
    var submit_btn = $("#info_submit");
    submit_btn.click(function (e) {
      e.preventDefault();
      payjp.createToken(numberElement).then(function (response) {
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



