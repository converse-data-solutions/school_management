function initValidate() {

  $('#myTable').dataTable({
    "processing": true,
    "serverSide": true,
    "ajax": {
      "url": $('#myTable').data('source')
    },
    "pagingType": "simple_numbers",
    "language": {
              "sLengthMenu": "_MENU_ records per page",
          },

    "columns": [
      { title: "Name", "data": "name", class: "parent_name" },
      { "data": "username", class: "parent_username" },
      { "data": "email", class: "parent_email" },
      { "data": "mobile_number", class: "parent_mobile" },
      { "data": "address", class: "parent_address" },
      { "data": "profession", class: "parent_profession" },
      { "data": "gender", class: "parent_gender" },
      { "data": "user_status", class: "parent_status" },
      { "data": "dt_actions", class: "parent_action" },
    ],
      "oLanguage": {
      "oPaginate": {
        "sPrevious": '<span class="pagination-btn"><i class="fas fa-arrow-left"></i> Previous</span>',
        "sNext": '<span class="pagination-btn">Next <i class="fas fa-arrow-right"></i></span>'
      }
    }
  });    
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    console.log("turbo rendered for parent table");
    initValidate();
  });
});