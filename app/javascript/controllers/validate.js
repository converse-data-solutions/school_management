function initValidate() {
  $("form").on("submit", function (e) {
    let email = $("#user_email").val();
    let password = $("#user_password").val();
    let name = $("#name").val();
    let username = $("#user_name").val();
    let mobile_number = $("#mobile-number").val();
    let address = $("#address").val();
    let profession = $("#profession").val();
    let err = $("#error-div");

    $(".error").text("");
    $(".error").css("color", "red");

    let errors = false;

    if (validator.isEmail(email) == false) {
      $("#email-error").text("Please enter a valid email address.");
      errors = true;
    }

    if (!validator.isStrongPassword(password, { min: 6, max: 20 })) {
      $("#password-error").text(
        "Please enter a strong password, at least 6 characters."
      );
      errors = true;
    }

    if (!validator.isAlpha(name)) {
      $("#name-error").text("Name must contain only alphabets.");
      errors = true;
    }

    if (!username || !username.trim()) {
      $("#username-error").text("Please enter a username.");
      errors = true;
    }

    if (!validator.isMobilePhone(mobile_number, "en-IN")) {
      $("#mobile-number-error").text("Please enter a valid mobile number.");
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
