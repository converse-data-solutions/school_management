var staffAttendanceData = [];

function initValidate() {
  var calendarEl = document.getElementById("calendar");
  var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
      left: "prev,next today",
      center: "title",
      right: "dayGridMonth",
    },
    initialDate: new Date(),
    navLinks: true,
    businessHours: true,
    editable: true,
    selectable: true,
    events: staffAttendanceData,
  });
  calendar.render();

  function fetchData(selected_date) {
    $.ajax({
      url: "/staff/staff_attendance_views",
      method: "GET",
      data: { selected_date: selected_date },
      dataType: "json",
      success: function (data) {
        staffAttendanceData = data;
        calendar.render();
      },
      error: function () {
        console.error("Failed to fetch student attendance data");
      },
    });
    
  }

  $("form").on("submit", function (e) {
    let dateValue = $("#date").val();
    let err = $("#error-div");

    $(".error").text("");
    $(".error").css("color", "red");
    let errors = false;

    if (!validator.isDate(dateValue)) {
      $("#date-error").text("Please enter a valid Date.");
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

    fetchData(dateValue);

    return true;
  });
  
 
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
