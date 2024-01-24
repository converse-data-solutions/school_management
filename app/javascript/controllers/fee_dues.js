function genereteDues() {
  $("#feeDueTable").dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#feeDueTable").data("source"),
      data: function (d) {
        d.section_id = $("#section_id").val();
        d.academic_year = $("#academic_year").val();
      },
    },
    pagingType: "simple_numbers",
    language: {
      sLengthMenu: "_MENU_ records per page",
    },
    stateSave: false,
    columns: [
      { data: "serial_number", class: "serial_number" },
      { data: "standard_name", class: "section" },
      { data: "student_id", class: "student_id" },
      { data: "admission_no", class: "admission_no" },
      { data: "name", class: "student_name" },
      { data: "mobile_number", class: "due_date" },
      { data: "payable_fee", class: "due_amount" },
      { data: "total_payment", class: "paid_amount" },
      { data: "bending_payment", class: "balance" },
    ],
    stripeClasses: ["bg-[#F9F9F9]", "bg-[#FFFFFF]"],
    createdRow: function (row, data, dataIndex) {
      $("td:eq(0)", row).html(dataIndex + 1);
    },
    scrollX: true, // Enable horizontal scrolling
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
      url: "/fee_dues/find_academic_sections",
      type: "GET",
      data: { standard_id: standard_id },
      success: function (response) {},
      error: function (xhr, status, error) {},
    });
  });

  $("#payment-details").on("click", "#updown", function () {
    console.log("accordian");
    $(this).toggleClass("active");

    const accordianBody = $(this).parent().next();
    accordianBody.slideToggle();
  });
}

$(document).ready(function () {
  genereteDues();

  $(document).on("turbo:render", function () {
    genereteDues();
  });
});
