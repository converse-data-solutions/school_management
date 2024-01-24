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
    stateSave: false,
    columns: [
      { data: "admission_no" },
      { data: "name" },
      { data: "date_of_birth" },
      { data: "mobile_number"},
      { data: "standard_name"},
      { data: "section_name"},
      { data: "roll_no" },
      { data: "gender" },
      { data: "student_status" },
      { data: "student_actions", class: "crud-action" },
    ],
    scrollX: "100%", // Enable horizontal scrolling
    oLanguage: {
      oPaginate: {
        sPrevious: '<span class="pagination-btn"><i class="fas fa-arrow-left"></i> Previous</span>',
        sNext: '<span class="pagination-btn">Next <i class="fas fa-arrow-right"></i></span>',
      },
    },
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
