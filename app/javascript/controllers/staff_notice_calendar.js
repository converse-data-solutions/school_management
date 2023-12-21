function initValidate() {
  var calendarForStaffNotice = document.getElementById("staff-notice-calendar");
  if (!calendarForStaffNotice) {
    return;
  }

  var staffNoticeCalendar = new FullCalendar.Calendar(calendarForStaffNotice, {
    headerToolbar: {
      left: "prev,next today",
      center: "title",
      right: " dayGridMonth",
    },

    initialDate: new Date(),
    navLinks: true, // can click day/week names to navigate views
    businessHours: true, // display business hours
    editable: true,
    selectable: true,
    events: [],
  });

  staffNoticeCalendar.render();
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
