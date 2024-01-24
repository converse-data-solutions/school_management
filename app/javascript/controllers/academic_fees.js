function initValidate() {
  const academicDetailsForm = $("#academic-fee");

  academicDetailsForm.on("change", "#standard_id", function() {
      let standard_id = $(this).val();
      $.ajax({
          url: "/academic_fees/find_academic_sections",
          type: "GET",
          data: {
              standard_id: standard_id
          },
      });
  });

  academicDetailsForm.on("change", "#selected_section", function() {
      let section_id = $(this).val();
      $.ajax({
          url: "/academic_fees/find_students",
          type: "GET",
          data: {
              section_id: section_id
          },
      });
  });

  academicDetailsForm.on("change", "#student_id", function() {
      let student_id = $(this).val();
      $.ajax({
          url: "/academic_fees/find_student_details",
          type: "GET",
          data: {
              student_id: student_id
          },
      });
  });

  academicDetailsForm.on("change", "#admission_no", function() {
      let admission_no = $(this).val();
      $.ajax({
          url: "/academic_fees/find_student_details",
          type: "GET",
          data: {
              admission_no: admission_no
          },
      });
  });

  $("#academic_fee_details_form").on(
      "change",
      "#academic_fee_discount",
      function() {
          let discount = $(this).val();
          let actual_fee = $("#actual_fee_input").val();
          let payable_fee = actual_fee - (discount / 100) * actual_fee;
          $("#payable_fee").val(payable_fee);
          let discount_amount = actual_fee - payable_fee;
          $("#discount_amount").val(discount_amount);
      }
  );

  //  payment changes form
  paymentChangeForm();

  //   payment-fee form
  paymentFeeForm();
};

function paymentFeeForm() {
  $("#payment_details_form").on("submit", "#payment_form", function(e) {
      let paid_amount = $("#payment_paid_amount").val();

      if (parseFloat(paid_amount) > 0) {
          $.ajax({
              url: "/academic_fees/pay_fee",
              type: "GET",
              success: function(response) {
                  setTimeout(function() {
                      $("#paymentMessage").removeClass("hidden");
                  }, 5000);
                  $("#paymentMessage").slideDown("slow");

                  setTimeout(function() {
                      $("#paymentMessage").slideUp("slow");
                      $("#paymentMessage").addClass("hidden");
                  }, 5000);
              },
              error: function(error) {
                  console.log(error);
              },
          });
      } else {
          e.preventDefault();
      }
  });
}

function paymentChangeForm() {
  $("#academic_fee_details_form").on(
      "submit",
      "#academic_fee_details_form",
      function(e) {
          $.ajax({
              url: "/academic_fees/changed_fee",
              type: "GET",
              success: function(response) {
                  setTimeout(function() {
                      $("#paymentMessage").removeClass("hidden");
                  }, 5000);
                  $("#paymentMessage").slideDown("slow");

                  setTimeout(function() {
                      $("#paymentMessage").slideUp("slow");
                      $("#paymentMessage").addClass("hidden");
                  }, 5000);

                  $("#fee_submit").prop("disabled", true).addClass("blurbutton");
              },
              error: function(error) {
                  console.log(error);
              },
          });
      }
  );
}



$(document).ready(function() {
  paymentChangeForm();
  paymentFeeForm();
  initValidate();

  $(document).on("turbo:render", function() {
    initValidate();
  })
});
