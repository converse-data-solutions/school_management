function initValidate() {

  $(".SelExample").select2({
    placeholder: "Select an Parent",
  });
  $(".SelExample").val("4").trigger("change");
  $("#but_read").click(function () {
    let username = $(".SelExample option:selected").text();
    let userid = $(".SelExample").val();
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
  $(document).on("change", "#student_standard_id", function () {
    let standard_id = $(this).val();
    $.ajax({
      url: "/students/find_sections",
      type: "GET",
      data: { standard_id: standard_id },
    });
  });
});