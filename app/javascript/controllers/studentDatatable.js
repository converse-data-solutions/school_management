function initValidate() {
  $("#studentTable").dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#studentTable").data("source"),
    },
    pagingType: "simple_numbers",
    language: {
      sLengthMenu: "_MENU_ records per page",
    },

    columns: [
      { data: "admission_no", class: "admission_no" },
      { data: "name", class: "student_name" },
      { data: "date_of_birth", class: "date_of_birth" },
      { data: "mobile_number", class: "mobile_number" },
      { data: "section_id", class: "section" },
      { data: "roll_no", class: "roll_no" },
      { data: "gender", class: "student_gender" },
      { data: "student_status", class: "parent_status" },
      { data: "student_actions", class: "parent_action" },
    ],
    oLanguage: {
      oPaginate: {
        sPrevious:
          '<span class="pagination-btn"><i class="fas fa-arrow-left"></i> Previous</span>',
        sNext:
          '<span class="pagination-btn">Next <i class="fas fa-arrow-right"></i></span>',
      },
    },
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    console.log("turbo rendered for parent table");
    initValidate();
  });
});
