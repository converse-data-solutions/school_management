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
  $("form").on("submit", function (e) {
    let section_value = $("#student_section_id").val();
    let err = $("#error-div");

    $(".error").text("");
   
    let errors = false;

    if (!section_value || !section_value.trim()) {
      $("#section-error").text("Please enter a Section.");
      errors = true;
      
    }

    if (errors == true) {
      err.removeClass("hidden");
    } else {
      err.addClass("hidden");
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
  $(document).on("change", "#student_standard_id", function () {
    let standard_id = $(this).val();
    $.ajax({
      url: "/students/find_sections",
      type: "GET",
      data: { standard_id: standard_id },
    });
  });
});
