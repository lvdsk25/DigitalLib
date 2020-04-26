<%
String email=(String)session.getAttribute("email");
        
        //redirect user to login page if not logged in
        if(email==null){
        	response.sendRedirect("add.jsp");
        }
		else{
			%><!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="apple-touch-icon" type="image/png" href="https://static.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'>
<style>
body { margin:50px auto; width:600px;}

/* CSS for Credit Card Payment form */
.credit-card-box .panel-title {
    display: inline;
    font-weight: bold;
}
.credit-card-box .form-control.error {
    border-color: red;
    outline: 0;
    box-shadow: inset 0 1px 1px rgba(0,0,0,0.075),0 0 8px rgba(255,0,0,0.6);
}
.credit-card-box label.error {
  font-weight: bold;
  color: red;
  padding: 2px 8px;
  margin-top: 2px;
}
.credit-card-box .payment-errors {
  font-weight: bold;
  color: red;
  padding: 2px 8px;
  margin-top: 2px;
}
.credit-card-box label {
    display: block;
}
/* The old "center div vertically" hack */
.credit-card-box .display-table {
    display: table;
}
.credit-card-box .display-tr {
    display: table-row;
}
.credit-card-box .display-td {
    display: table-cell;
    vertical-align: middle;
    width: 50%;
}
/* Just looks nicer */
.credit-card-box .panel-heading img {
    min-width: 180px;
}
</style>
<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
</head>
<body translate="no">
<div class="container">
<div class="row">

<div class="col-xs-12 col-md-4">

<div class="panel panel-default credit-card-box">
<div class="panel-heading display-table">
<div class="row display-tr">
<h3 class="panel-title display-td">Payment Details</h3>
<div class="display-td">
<img class="img-responsive pull-right" src="http://i76.imgup.net/accepted_c22e0.png">
</div>
</div>
</div>
<div class="panel-body">
<form role="form" id="payment-form" action="cardregistration" autocomplete="off">
<div class="row">
<div class="col-xs-12">
<div class="form-group">
<label for="id">LIBRARY ID</label>
<div class="input-group">
<input type="text" class="form-control" name="id" placeholder="Enter your id"  required autofocus />
<span class="input-group-addon"><i class="fa fa-id-badge"></i></span>
</div>
<div class="form-group">
<label for="cardNumber">CARD NUMBER</label>
<div class="input-group">
<input type="text" class="form-control" name="card" placeholder="Valid Card Number"  required autofocus />
<span class="input-group-addon"><i class="fa fa-credit-card"></i></span>
</div>
</div>
</div>
</div>
<div class="row">
<div class="col-xs-7 col-md-7">
<div class="form-group">
<label for="cardExpiry"><span class="hidden-xs">EXPIRATION</span><span class="visible-xs-inline">EXP</span> DATE</label>
<input type="text" class="form-control" name="exp" placeholder="MM / YY"  required />
</div>
</div>
<div class="col-xs-5 col-md-5 pull-right">
<div class="form-group">
<label for="cardCVC">CVV CODE</label>
<input type="text" class="form-control" name="cvv" placeholder="CVC" required />
</div>
</div>
</div>
<div class="row">
<div class="col-xs-12">
<div class="form-group">
<label for="couponCode">COUPON CODE</label>
<input type="text" class="form-control" name="coupon" />
</div>
</div>
</div>
<div class="row">
<div class="col-xs-12">
<button type="submit"  value="Insert" class="btn btn-success btn-lg btn-block"  name="btn_add2">Start Subscription</button>
</div>
</div>
<div class="row" style="display:none;">
<div class="col-xs-12">
<p class="payment-errors"></p>
</div>
</div>
</form>
</div>
</div>

</div>
</div>
</div>

<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
</body>
<script src="https://static.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery.payment/1.2.3/jquery.payment.min.js'></script>
<script id="rendered-js">
var $form = $('#payment-form');
$form.on('submit', payWithStripe);

/* If you're using Stripe for payments */
function payWithStripe(e) {
  e.preventDefault();

  /* Visual feedback */
  $form.find('[type=submit]').html('Validating <i class="fa fa-spinner fa-pulse"></i>');

  var PublishableKey = 'pk_test_b1qXXwATmiaA1VDJ1mOVVO1p'; // Replace with your API publishable key
  Stripe.setPublishableKey(PublishableKey);

  /* Create token */
  var expiry = $form.find('[name=cardExpiry]').payment('cardExpiryVal');
  var ccData = {
    number: $form.find('[name=cardNumber]').val().replace(/\s/g, ''),
    cvc: $form.find('[name=cardCVC]').val(),
    exp_month: expiry.month,
    exp_year: expiry.year };


  Stripe.card.createToken(ccData, function stripeResponseHandler(status, response) {
    if (response.error) {
      /* Visual feedback */
      $form.find('[type=submit]').html('Try again');
      /* Show Stripe errors on the form */
      $form.find('.payment-errors').text(response.error.message);
      $form.find('.payment-errors').closest('.row').show();
    } else {
      /* Visual feedback */
      $form.find('[type=submit]').html('Processing <i class="fa fa-spinner fa-pulse"></i>');
      /* Hide Stripe errors on the form */
      $form.find('.payment-errors').closest('.row').hide();
      $form.find('.payment-errors').text("");
      // response contains id and card, which contains additional card details            
      console.log(response.id);
      console.log(response.card);
      var token = response.id;
      // AJAX - you would send 'token' to your server here.
      $.post('/account/stripe_card_token', {
        token: token })

      // Assign handlers immediately after making the request,
      .done(function (data, textStatus, jqXHR) {
        $form.find('[type=submit]').html('Payment successful <i class="fa fa-check"></i>').prop('disabled', true);
      }).
      fail(function (jqXHR, textStatus, errorThrown) {
        $form.find('[type=submit]').html('There was a problem').removeClass('success').addClass('error');
        /* Show Stripe errors on the form */
        $form.find('.payment-errors').text('Try refreshing the page and trying again.');
        $form.find('.payment-errors').closest('.row').show();
      });
    }
  });
}
/* Fancy restrictive input formatting via jQuery.payment library*/
$('input[name=cardNumber]').payment('formatCardNumber');
$('input[name=cardCVC]').payment('formatCardCVC');
$('input[name=cardExpiry').payment('formatCardExpiry');

/* Form validation using Stripe client-side validation helpers */
jQuery.validator.addMethod("cardNumber", function (value, element) {
  return this.optional(element) || Stripe.card.validateCardNumber(value);
}, "Please specify a valid credit card number.");

jQuery.validator.addMethod("cardExpiry", function (value, element) {
  /* Parsing month/year uses jQuery.payment library */
  value = $.payment.cardExpiryVal(value);
  return this.optional(element) || Stripe.card.validateExpiry(value.month, value.year);
}, "Invalid expiration date.");

jQuery.validator.addMethod("cardCVC", function (value, element) {
  return this.optional(element) || Stripe.card.validateCVC(value);
}, "Invalid CVC.");

validator = $form.validate({
  rules: {
    cardNumber: {
      required: true,
      cardNumber: true },

    cardExpiry: {
      required: true,
      cardExpiry: true },

    cardCVC: {
      required: true,
      cardCVC: true } },


  highlight: function (element) {
    $(element).closest('.form-control').removeClass('success').addClass('error');
  },
  unhighlight: function (element) {
    $(element).closest('.form-control').removeClass('error').addClass('success');
  },
  errorPlacement: function (error, element) {
    $(element).closest('.form-group').append(error);
  } });


paymentFormReady = function () {
  if ($form.find('[name=cardNumber]').hasClass("success") &&
  $form.find('[name=cardExpiry]').hasClass("success") &&
  $form.find('[name=cardCVC]').val().length > 1) {
    return true;
  } else {
    return false;
  }
};

$form.find('[type=submit]').prop('disabled', true);
var readyInterval = setInterval(function () {
  if (paymentFormReady()) {
    $form.find('[type=submit]').prop('disabled', false);
    clearInterval(readyInterval);
  }
}, 250);


/*
         https://goo.gl/PLbrBK
         */
//# sourceURL=pen.js
    </script>
</body>
</html>
<%
			
		}
%>
