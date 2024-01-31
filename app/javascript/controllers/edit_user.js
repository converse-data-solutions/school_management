function validateUser() {
  $("form").on("submit", function (e) {
    let email = $("#user_email").val();
    let name = $("#name").val();
    let mobile_number = $("#mobile-number").val();
    let address = $("#address").val();
    let profession = $("#profession").val();

    let err = $("#error-div");

    $(".error").text("");

    let errors = false;

    if (validator.isEmail(email) == false) {
      $("#email-error").text("Please enter a valid email address.");
      errors = true;
    }

    if (name && !/^[a-zA-Z\s]+$/.test(name)) {
      $("#name-error").text("Name must contain only alphabets.");
      errors = true;
    }

    if (mobile_number && !validator.isMobilePhone(mobile_number, "en-IN")) {
      $("#mobile-number-error").text("Please enter a valid mobile number.");
      errors = true;
    }

    if (address && (!/[a-zA-Z]/.test(address) || !address.trim())) {
      $("#address-error").text("Please enter a address.");
      errors = true;
    }

    if (profession && !profession.trim()) {
      $("#profession-error").text("Please enter a profession.");
      errors = true;
    }

    if (errors) {
      err.toggleClass("hidden");
      setTimeout(function () {
        err.toggleClass("hidden");
      }, 5000);
      e.preventDefault();
      return false;
    }

    return true;
  });
}

$(document).ready(function () {
  validateUser();

  $(document).on("turbo:render", function () {
    validateUser();
  });
});
