function initValidate() {
  $("#historyTable").dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#historyTable").data("source"),
    },
    pagingType: "simple_numbers",
    language: {
      sLengthMenu: "_MENU_ records per page",
    },
    stateSave: false,
    columns: [
      { data: "id", class: "id" },
      { data: "admission_no", class: "admission_no" },
      { data: "name", class: "student_name" },
      { data: "roll_no", class: "roll_no" },
      { data: "section_name", class: "section" },
      { data: "standard_name", class: "standard_name" },
      { data: "academic_year", class: "academic_year" },
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
    initValidate();
  });
});
