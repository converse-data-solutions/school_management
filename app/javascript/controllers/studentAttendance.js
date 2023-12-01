function initValidate() {
  $("#standard_id").on("change", function (event) {
    event.preventDefault();

    var standard_id = $(this).val();
    console.log(standard_id);

    $.ajax({
      url: "/student_attendances/get_sections",
      type: "GET",
      data: { standard_id: standard_id },
      success: function (response) {
        console.log(response);
      },
      error: function (xhr, status, error) {
        console.error(xhr, status, error);
      },
    });
  });

  $("form").on("submit", function (e) {
    var dateValue = $("#date").val();
    var err = $("#error-div");
    var table = $("#table-div");

    $(".error").text("");
    $(".error").css("color", "red");
    var errors = false;

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
