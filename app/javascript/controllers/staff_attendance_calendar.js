var staffAttendanceData;
function fetchData(selected_date, staffCalendar) {
  $.ajax({
    url: "/staff/attendances",
    method: "GET",
    data: { selected_date: selected_date },
    dataType: "json",
    success: function (data) {
      staffAttendanceData = data;
      staffCalendar.refetchEvents(); // Use refetchEvents to reload events
    },
    error: function () {
      console.error("Failed to fetch student attendance data");
    },
  });
}

function initCalendar() {
  var calendarEl = document.getElementById("staff-calendar");
  if (!calendarEl) {
    return;
  }
  var staffCalendar = new FullCalendar.Calendar(calendarEl, {
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
  staffCalendar.render();

  return staffCalendar;
}

function loadCalendar() {
  var calendar = initCalendar();

  $("form").on("submit", function (e) {
    let dateValue = $("#date").val();
    let err = $("#error-div");

    $(".error").text("");
    let errors = false;

    if (!validator.isDate(dateValue)) {
      $("#date-error").text("Please enter a valid Date.");
      errors = true;
    }

    if (errors) {
      e.preventDefault();
      err.removeClass("hidden");
    } else {
      err.addClass("hidden");
      fetchData(dateValue, calendar);
    }
  });
}

$(document).ready(function () {
  loadCalendar();

  $(document).on("turbo:render", function () {
    loadCalendar();
  });
});
