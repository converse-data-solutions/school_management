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

  $("form").validate({
    rules: {
      date: {
        required: true,
      },
    },
    messages: {
      date: {
        required: "Please enter a Date.",
      },
    },
    errorElement: "div",
    errorClass: "error",
    errorPlacement: function (error, element) {
      error.appendTo("#error-div");
    },
    highlight: function (element, errorClass, validClass) {
      $(element).addClass(errorClass).removeClass(validClass);
    },
    unhighlight: function (element, errorClass, validClass) {
      $(element).removeClass(errorClass).addClass(validClass);
    },
    submitHandler: function (form) {
      // Your form submission code here
      // For example: form.submit();
    },
  });
}
$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
