function initValidate() {
  $("#promoteTable").dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#promoteTable").data("source"),
      data: function (d) {
        // Add the section_id and to_section_id parameters
        d.from_section_id = $("#from_section_id").val(); // Assuming your select element has the id 'section_id'
        d.to_section_id = $("#to_section_id").val(); // Assuming your select element has the id 'to_section_id'
        // Add other parameters if needed
      },
    },
    pagingType: "simple_numbers",
    language: {
      sLengthMenu: "_MENU_ records per page",
    },
    stateSave: false,
    columns: [
      { data: "admission_no", class: "admission_no" },
      { data: "id", class: "id" },
      { data: "name", class: "student_name" },
      { data: "id", class: "id" },
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
      url: "/students/from_getting_sections",
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
