function initValidate() {
  $("#single_file").on("change", function (event) {
    showPreview(event, $("#previewSingle"));
    $("#defaultUpload").addClass("hidden");
  });

  function showPreview(event, previewBox) {
    previewBox.empty();

    $.each(event.target.files, function (i, file) {
      let img = $("<img>")
        .addClass("aspect-auto h-[130px] w-[130px] mb-4 shadow")
        .attr("src", URL.createObjectURL(file));
      previewBox.append(img);
    });
  }
  $(".SelExample").select2({
    placeholder: "Select an Parent",
  });
  $(".SelExample").val("4").trigger("change");
  $("#but_read").click(function () {
    let username = $(".SelExample option:selected").text();
    let userid = $(".SelExample").val();
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
  $(document).on("change", "#student_standard_id", function () {
    let standard_id = $(this).val();
    console.log(standard_id);
    $.ajax({
      url: "/students/get_sections",
      type: "GET",
      data: { standard_id: standard_id },
    });
  });
});
