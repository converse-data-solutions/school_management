function initValidate() {
  $("form").on("submit", function (e) {
    let admission_no = $("#admission_no").val();
    let name = $("#name").val();
    let standard_name = $("#standard_name").val();
    let section_name = $("#section_name").val();
    let roll_no = $("#roll_no").val();
    let err = $("#error-div");

    $(".error").text("");
    let errors = false;

    

   if (!validator.isNumeric(admission_no)) {
      $("#admission-no-error").text("Please enter a valid admission number.");
      errors = true;
    }else if(admission_no.length<6){
      $("#admission-no-error").text("Admission number should be atleast 6 digits.");
      errors = true;
    }

    if (!/^[a-zA-Z\s]+$/.test(name)) {
      $("#name-error").text("Name must contain only alphabets and white spaces.");
      errors = true;
    }

    if (!standard_name || !standard_name.trim()) {
      $("#standard-name-error").text("Please enter a standard name.");
      errors = true;
    }

    if (!section_name || !section_name.trim()) {
      $("#section-name-error").text("Please enter a section name.");
      errors = true;
    }

    if (!validator.isNumeric(roll_no)) {
      $("#roll-no-error").text("Please enter a valid roll number.");
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

    return true;
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
