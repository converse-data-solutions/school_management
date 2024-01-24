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
      err.toggleClass("hidden");
      setTimeout(function () {
        err.toggleClass("hidden");
      }, 5000);
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
