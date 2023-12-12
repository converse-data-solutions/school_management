function initValidate() {
  $("#single_file").on("change", function (event) {
    showPreview(event, $("#previewSingle"));
    $("#defaultUpload").addClass("hidden");
  });

  function showPreview(event, previewBox) {
    previewBox.empty();

    $.each(event.target.files, function (index, file) {
      let img = $("<img>")
        .addClass("aspect-auto h-[130px] w-[130px] mb-4 shadow")
        .attr("src", URL.createObjectURL(file));
      previewBox.append(img);
    });
  }
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
