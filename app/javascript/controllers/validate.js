function initValidate() {
  let typingTimer;

  $("#user_name").on("keyup", function () {
    clearTimeout(typingTimer);

    typingTimer = setTimeout(function () {
      let username = $("#user_name").val();

      $.ajax({
        url: "/admin/parent_users/check_username",
        type: "GET",
        data: { username: username },
        success: function (response) {
          $("#user_name").data(
            "validusername",
            !response.includes("Not available")
          );
        },
        error: function (xhr, status, error) {},
      });
    }, 1000);
  });

  $("form").on("submit", function (e) {
    let email = $("#user_email").val();
    let password = $("#user_password").val();
    let name = $("#name").val();
    let username = $("#user_name").val();
    let mobile_number = $("#mobile-number").val();
    let address = $("#address").val();
    let profession = $("#profession").val();
    let user_name_data = $("#user_name").data("validusername");
    let strongPasswordRegex =
      /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,20}$/;

    let err = $("#error-div");

    $(".error").text("");

    let errors = false;

    if (validator.isEmail(email) == false) {
      $("#email-error").text("Please enter a valid email address.");
      errors = true;
    }

    if (!strongPasswordRegex.test(password)) {
      $("#password-error").text(
        "Please enter a strong password, at least 6 characters with a mix of letters, numbers, and symbols."
      );
      errors = true;
    }

    if (!username || !username.trim()) {
      $("#username-error").text("Please enter a username.");
      errors = true;
    } else if (!user_name_data) {
      $("#username-available-error").text("Username is not available");
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
      $("#address-error").text("Address must contain an alphabet.");
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
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
