function initValidate() {
  $("form").on("submit", function (e) {
    var email = $("#user_email").val();
    var password = $("#user_password").val();
    var name = $("#name").val();
    var username = $("#user_name").val();
    var mobile_number = $("#mobile-number").val();
    var address = $("#address").val();
    var profession = $("#profession").val();
    var gender = $('input[name="gender"]:checked').val();
    var err = $("#error-div");

    $(".error").text("");
    $(".error").css("color", "red");

    var errors = false;

    if (!email || !email.trim()) {
      $("#email-error").text("Please enter a valid email address.");
      errors = true;
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      $("#email-error").text("Please enter a valid email address.");
      errors = true;
    }

    if (!password || !password.trim()) {
      $("#password-error").text("Please enter a password.");
      errors = true;
    } else if (password.length < 6) {
      $("#password-error").text(
        "Please enter a password with at least 6 characters."
      );
      errors = true;
    }

    if (!name || !name.trim()) {
      $("#name-error").text("Please enter a name.");
      errors = true;
    } else if (!/^[a-zA-Z]+$/.test(name)) {
      $("#name-error").text("Name must contain only alphabets.");
      errors = true;
    }

    if (!username || !username.trim()) {
      $("#username-error").text("Please enter a username.");
      errors = true;
    }

    if (!mobile_number || !mobile_number.trim()) {
      $("#mobile-number-error").text("Please enter a mobile number.");
      errors = true;
    } else if (mobile_number < 1000000000 || mobile_number > 9999999999) {
      $("#mobile-number-error").text(
        "Please check your mobile number ,it should be positive and 10 digits."
      );
      errors = true;
    }

    if (!address || !address.trim()) {
      $("#address-error").text("Please enter an address.");
      errors = true;
    } else if (!/[a-zA-Z]/.test(address)) {
      $("#address-error").text("Address must contain  alphabet.");
      errors = true;
    }

    if (!profession || !profession.trim()) {
      $("#profession-error").text("Please enter a profession.");
      errors = true;
    }

    if (errors == true) {
      err.removeClass("hidden");
    } else {
      err.addClass("hidden");
    }

    if (errors) {
      e.preventDefault();
      return false;
    }

    return true;
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
