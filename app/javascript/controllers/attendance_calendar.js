var studentAttendanceData;

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
    events: studentAttendanceData,
  });
  calendar.render();

  function fetchData(student_id, selected_date) {
    $.ajax({
      url: "/parent/attendance_views",
      method: "GET",
      data: { student_id: student_id, selected_date: selected_date },
      dataType: "json",
      success: function (data) {
        studentAttendanceData = data;
        calendar.render();
      },
      error: function () {
        console.error("Failed to fetch student attendance data");
      },
    });
  }

  $("form").on("submit", function (e) {
    let student_id = $("#student_id").val();
    let dateValue = $("#date").val();
    let err = $("#error-div");

    $(".error").text("");
    let errors = false;

    if (!validator.isDate(dateValue)) {
      $("#date-error").text("Please enter a valid Date.");
      errors = true;
    }

    if (!student_id || !student_id.trim()) {
      $("#student-error").text("Please select a Student.");
      errors = true;
    }

    if (errors == true) {
      err.toggleClass("hidden");
      setTimeout(function () {
        err.toggleClass("hidden");
      }, 5000);
    }

    if (errors) {
      e.preventDefault();
      return false;
    }

    fetchData(student_id, dateValue);

    return true;
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
