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
      { data: "date_of_birth", class: "date_of_birth" },
      { data: "gender", class: "student_gender" },
      { data: "date_of_admission", class: "date_of_admission" },
      { data: "father_name", class: "father_name" },
      { data: "mother_name", class: "mother_name" },
      { data: "address", class: "address" },
      { data: "mobile_number", class: "mobile_number" },
      { data: "roll_no", class: "roll_no" },
      { data: "section_name", class: "section" },
      
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
