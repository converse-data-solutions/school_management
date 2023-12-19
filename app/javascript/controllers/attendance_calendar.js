var studentAttendanceData;
  function initValidate() {
    console.log("inside functon is called");
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth'
      },
      initialDate: new Date(),
      navLinks: true,
      businessHours: true,
      editable: true,
      selectable: true,
      events: studentAttendanceData
    });
    calendar.render();

    function fetchData() {
      var student_id=$("#student_id").val();
      var selected_date=$('#date').val();
        $.ajax({
        url: '/parent/parent_attendance_views',
        method: 'GET',
        data: { student_id: student_id , selected_date: selected_date},

        dataType: 'json',
        success: function(data) {
          studentAttendanceData = data;

          calendar.render();
        },
        error: function() {
          console.error('Failed to fetch student attendance data');
        }
      });
    }


    $('.getAttendanceData').on('click', function(e) {
      fetchData();
    });
  }

  $(document).ready(function () {
    initValidate();

    $(document).on("turbo:render", function () {
      initValidate();
    });
  });