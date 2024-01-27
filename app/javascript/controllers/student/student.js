function callSections() {

  $(".student_form").on("change", "#student_standard_id", function () {
    let standard_id = $(this).val();
    $.ajax({
      url: "/students/find_sections",
      type: "GET",
      data: { standard_id: standard_id },
    });
  });
 
}

$(document).ready(function () {
  callSections();

  $(document).on("turbo:render", function () {
    callSections();
  });
  // $(document).on("change", "#student_standard_id", function () {
  //   let standard_id = $(this).val();
  //   $.ajax({
  //     url: "/students/find_sections",
  //     type: "GET",
  //     data: { standard_id: standard_id },
  //   });
  // });
});
