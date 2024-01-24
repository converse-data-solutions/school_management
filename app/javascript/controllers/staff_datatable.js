function initValidate() {
  $("#staffTable").dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#staffTable").data("source"),
    },
    pagingType: "simple_numbers",
    language: {
      sLengthMenu: "_MENU_ records per page",
    },

    columns: [
      { data: "name" },
      { data: "username" , class: "user_name"},
      { data: "email" },
      { data: "mobile_number"},
      { data: "address" },
      { data: "profession" },
      { data: "gender" },
      { data: "staff_status"},
      { data: "staff_actions", class: "crud-action" },
    ],
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
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
