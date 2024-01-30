function initValidate() {
  $("#myTable").dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#myTable").data("source"),
    },
    pagingType: "simple_numbers",
    language: {
      sLengthMenu: "_MENU_ records per page",
    },

    columns: [
      { data: "name" },
      { data: "username", class: "user_name" },
      { data: "email" },
      { data: "mobile_number" },
      { data: "address" },
      { data: "profession" },
      { data: "gender" },
      { data: "user_status" },
      { data: "dt_actions", class: "crud-action" },
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
  window.addEventListener("popstate", function (event) {
    location.reload();
  });

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
