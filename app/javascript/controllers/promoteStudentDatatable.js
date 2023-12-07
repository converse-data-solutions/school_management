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
      { data: "serial_number", class: "serial_number" },
      { data: "admission_no", class: "admission_no" },
      { data: "name", class: "student_name" },
      { data: "id", class: "id" },
      { data: "check_box", class: "check_box" },
    ],
    createdRow: function (row, data, dataIndex) {
      $("td:eq(0)", row).html(dataIndex + 1);
    },
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

  $(".all").on("click", function () {
    let $inputs = $("table").find("input");
    $inputs.prop("checked", "checked");
  });

  $("#frm-example").on("submit", function (e) {
    let from_standard = $("#standard_id").val();
    let from_section = $(".fsection").val();
    let to_standard = $("#to_standard_id").val();
    let to_section = $(".tsection").val();

    let err = $("#error-div");
    let isChecked;

    $(".error").text("");
    $(".error").css("color", "red");
    let errors = false;

    if ($("#students_:checked").length > 0) {
      isChecked = true;
    } else {
      isChecked = false;
    }

    if (!isChecked) {
      $("#student_error").text("Please select  student.");
      errors = true;
    }

    if (!from_standard || !to_standard) {
      $("#from_standard_error").text("Please Select Standard.");
      errors = true;
    }
    if (!from_section || !to_section) {
      $("#from_section_error").text("Please select Section.");
      errors = true;
    }

    if (errors == true) {
      err.removeClass("hidden");
    } else {
      err.addClass("hidden");
    }

    if (errors) {
      e.preventDefault();
      return false;
    }

    return true;
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
