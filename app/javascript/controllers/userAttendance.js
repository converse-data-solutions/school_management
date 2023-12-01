function initValidate() {
  $("form").on("submit", function (e) {
    let dateValue = $("#date").val();
    let err = $("#error-div");

    $(".error").text("");
    $(".error").css("color", "red");
    let errors = false;

    if (!dateValue || !dateValue.trim()) {
      $("#date-error").text("Please enter a Date.");
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
