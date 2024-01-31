function initValidate() {
  $("#standard_id").on("change", function (event) {
    event.preventDefault();

    let standard_id = $(this).val();

    $.ajax({
      url: "/student_attendances/find_sections",
      type: "GET",
      data: { standard_id: standard_id },
      success: function (response) {},
      error: function (xhr, status, error) {},
    });
  });

  $("form").on("submit", function (e) {
    let dateValue = $("#date").val();
    let err = $(".error-div");

    $(".error").text("");
    let errors = false;

    if(!validator.isDate(dateValue)) {
      $("#date-error").text("Please enter a valid Date.");
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
