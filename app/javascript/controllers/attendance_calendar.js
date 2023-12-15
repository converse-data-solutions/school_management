function initValidate() {

   
  var calendarEl = document.getElementById('calendar');

   var jsa= [
    {
    "id": 17,
    "date": "2023-12-15",
    "status": "present",
    "attendable_type": "Student",
    "attendable_id": 9,
    "created_at": "2023-12-15T11:06:06.664Z",
    "updated_at": "2023-12-15T11:06:06.664Z",
    "color": "red"
    },
    {
    "id": 19,
    "date": "2023-12-14",
    "status": "present",
    "attendable_type": "Student",
    "attendable_id": 9,
    "created_at": "2023-12-15T13:02:16.717Z",
    "updated_at": "2023-12-15T13:02:16.717Z"
    }
    ]

  var calendar = new FullCalendar.Calendar(calendarEl, {
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
    events: jsa
  });

  calendar.render();
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
