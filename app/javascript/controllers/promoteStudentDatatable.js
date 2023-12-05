function initValidate() {
  var table= $("#promoteTable").dataTable({
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
      { data: "check_box", class: "id" },
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


  $('#frm-example').on('submit', function(e) {
    var form = this;

    var rows = $(table.rows({
      selected: true
    }).$('input[type="checkbox"]').map(function() {
      return $(this).prop("checked") ? $(this).closest('tr').attr('data-id') : null;
    }));
    console.log(table.column(0).checkboxes.selected())
    // Iterate over all selected checkboxes
    rows_selected = [];
    $.each(rows, function(index, rowId) {
      console.log(rowId)
      // Create a hidden element 
      rows_selected.push(rowId);
      $(form).append(
        $('<input>')
        .attr('type', 'hidden')
        .attr('name', 'id[]')
        .val(rowId)
      );
    });

    // FOR DEMONSTRATION ONLY
    // The code below is not needed in production

    // Output form data to a console     
    $('#example-console-rows').text(rows_selected.join(","));

    // Output form data to a console     
    $('#example-console-form').text($(form).serialize());

    // Remove added elements
    $('input[name="id\[\]"]', form).remove();

    // Prevent actual form submission
    e.preventDefault();
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
