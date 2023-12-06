function initValidate() {
  $("#promoteTable").dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#promoteTable").data("source"),
      data: function (d) {
        d.from_section_id = $("#from_section_id").val();
        d.to_section_id = $("#to_section_id").val();
      },
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
      { data: "check_box", class: "id", defaultContent: true }, // Set default value to true
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

  $("#standard_id").on("change", function (event) {
    event.preventDefault();
    let standard_id = $(this).val();
    $.ajax({
      url: "/students/getting_from_sections",
      type: "GET",
      data: { standard_id: standard_id },
      success: function (response) {},
      error: function (xhr, status, error) {},
    });
  });

  $("#to_standard_id").on("change", function (event) {
    event.preventDefault();

    let standard_id = $(this).val();
    $.ajax({
      url: "/students/getting_to_sections",
      type: "GET",
      data: { standard_id: standard_id },
      success: function (response) {},
      error: function (xhr, status, error) {},
    });
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
