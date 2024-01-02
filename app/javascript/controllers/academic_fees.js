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

  $(document).ready(function () {
    $("#payment_form").submit(function (e) {
      $.ajax({
        url: "/academic_fees/pay_fee",
        type: "GET",
      });
    });
  });
});
