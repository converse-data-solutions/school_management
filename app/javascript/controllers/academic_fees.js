document.addEventListener("turbo:load", function () {
  const academicDetailsForm = $("#academic-fee");
  const academicFeeForm = $("#new_academic_fee");

  academicDetailsForm.on("change", "#standard_id", function () {
    let standard_id = $(this).val();
    $.ajax({
      url: "/academic_fees/find_academic_sections",
      type: "GET",
      data: { standard_id: standard_id },
    });
  });

  academicDetailsForm.on("change", "#selected_section", function () {
    let section_id = $(this).val();
    $.ajax({
      url: "/academic_fees/find_students",
      type: "GET",
      data: { section_id: section_id },
    });
  });

  academicDetailsForm.on("change", "#student_id", function () {
    let student_id = $(this).val();
    $.ajax({
      url: "/academic_fees/find_student_details",
      type: "GET",
      data: { student_id: student_id },
    });
  });

  academicDetailsForm.on("change", "#admission_no", function () {
    let admission_no = $(this).val();
    $.ajax({
      url: "/academic_fees/find_student_details",
      type: "GET",
      data: { admission_no: admission_no },
    });
  });

  $(document).on("change", "#academic_fee_discount", function () {
    let discount = $(this).val();
    let actual_fee = $("#actual_fee_input").val();
    let payable_fee = actual_fee - (discount / 100) * actual_fee;
    $("#payable_fee").val(payable_fee);
    let discount_amount = actual_fee - payable_fee;
    $("#discount_amount").val(discount_amount);
  });

  // $(document).ready(function () {
  //   $("#payment_form").submit(function (e) {
  //     $.ajax({
  //       url: "/academic_fees/pay_fee",
  //       type: "GET",
  //     });
  //   });
  // });
  $(document).ready(function () {
    $("#payment_form").submit(function (e) {
      // Prevent the form from submitting in the default way
      e.preventDefault();
  
      let paid_amount = $("#payment_paid_amount").val();
  
      // Check if the paid amount is greater than zero
      if (parseFloat(paid_amount) > 0) {
        // Perform your AJAX request here
        $.ajax({
          url: "/academic_fees/pay_fee",
          type: "GET",
          success: function (response) {
            // Handle the AJAX response if needed
  
            // Show the payment message with slide-down animation
            $("#paymentMessage").slideDown("slow");
  
            // After 5 seconds, hide the payment message with slide-up animation
            setTimeout(function () {
              $("#paymentMessage").slideUp("slow");
            }, 5000);
  
            // Disable and blur the submit button
            $("#payment_submit").prop("disabled", true).addClass("blurbutton");
          },
          error: function (error) {
            // Handle the AJAX error if needed
          },
        });
      } else {
        // If the paid amount is not greater than zero, display an error message or take appropriate action
        console.log("Paid amount should be greater than zero.");
      }
    });
  });
  
  
});
