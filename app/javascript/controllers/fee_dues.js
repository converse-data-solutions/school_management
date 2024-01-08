function genereteDues() {

console.log("genereteDues");
$("#fee_due").on("change", "#standard_id", function() {
  let standard_id = $(this).val();
  console.log(standard_id);
  $.ajax({
      url: "/fee_dues/find_academic_sections",
      type: "GET",
      data: {
          standard_id: standard_id
      },
  });
});
 
$("#payment-details").on("click", "#updown", function () {
  console.log("accordian");
  $(this).toggleClass("active");

  const accordianBody = $(this).parent().next();
  accordianBody.slideToggle();
});

}

$(document).ready(function () {
  genereteDues();

  $(document).on("turbo:render", function () {
    genereteDues();
  });
});
