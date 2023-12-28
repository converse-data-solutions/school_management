function initValidate() {
  $("#standard_id").on("change", function () {
    let standard_id = $(this).val();
    console.log(standard_id);
    $.ajax({
      url: "/academic_fees/find_academic_sections",
      type: "GET",
      data: { standard_id: standard_id },
    });
  });


  $("#academic-fee").on("change", "#selected_section", function () {
    console.log("hello after selected section");
    let section_id = $(this).val();
    console.log(section_id);
    $.ajax({
      url: "/academic_fees/find_students",
      type: "GET",
      data: { section_id: section_id },
    });
  });

  $("#academic-fee").on("change", "#student_id", function () {
    let student_id = $(this).val();
    console.log(student_id);
    $.ajax({
      url: "/academic_fees/find_student_details",
      type: "GET",
      data: { student_id: student_id },
    });
  })

  $("#admission_no").on("change", function () {
    let admission_no = $(this).val();
    console.log(admission_no);
    $.ajax({
      url: "/academic_fees/find_student_details",
      type: "GET",
      data: { admission_no: admission_no },
    });
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
