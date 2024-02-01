function initValidate() {
  $("#historyTable").DataTable({
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
      { data: "id" },
      { data: "student_id" },
      { data: "admission_no" },
      { data: "name" },
      { data: "roll_no" },
      { data: "standard_name" },
      { data: "section_name" },
      { data: "academic_year" },
      { data: "academic_action", class: "crud-action" },
    ],
    scrollX: "100%", // Enable horizontal scrolling
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

  window.addEventListener("popstate", function (event) {
    location.reload();
  });
});

$(document).on("turbo:render", function () {
  initValidate();
});
