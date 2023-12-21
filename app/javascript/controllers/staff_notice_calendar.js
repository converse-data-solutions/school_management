function initValidate() {

  console.log("entered notice");
  var calendarForStaffNotice = document.getElementById('staff-notice-calendar');



  var staffNoticeCalendar = new FullCalendar.Calendar(calendarForStaffNotice, {
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: ' dayGridMonth'  
    },
    
    initialDate: new Date(),
    navLinks: true, // can click day/week names to navigate views
    businessHours: true, // display business hours
    editable: true,
    selectable: true,
    events: [],

   
  });

  staffNoticeCalendar.render();
  console.log("rendered notice");
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
