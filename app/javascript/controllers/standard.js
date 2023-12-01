function initValidate() {
  function toggleRemoveLink() {
    var visibleSectionCount = $(".section_fields:visible").length;

    console.log(visibleSectionCount);
    if (visibleSectionCount === 1) {
      $(".remove_section").hide();
    } else {
      $(".remove_section").show();
    }
  }

  toggleRemoveLink();
  $(document).on("click", "#add_section, .remove_section", function () {
    toggleRemoveLink();
  });

  var sectionIndex = $("#sectionIndex").data("sectionIndex");
  console.log(sectionIndex);

  $("#add_section").click(function (e) {
    e.preventDefault();
    addSectionField();
  });

  $("#sections_fields").on("click", ".remove_section", function (e) {
    e.preventDefault();
    removeSectioField(this);
  });
  function removeSectioField(elem) {
    var removeSection = $(elem).closest(".section_fields");
    var removeBox = $(elem).closest(".section_fields").find(".checkbox");
    removeSection.addClass("hidden");
    var clicked = false;

    removeBox.prop("checked", !clicked);
    sectionIndex--;
    $("#sectionIndex").data("sectionIndex", sectionIndex);
  }
  function addSectionField() {
    var newSectionField = $("#sections_fields .section_fields:first").clone();
    newSectionField.find("input").val("");
    newSectionField.find("input").each(function () {
      var oldName = $(this).attr("name");
      var newName = oldName.replace(/\[\d\]/, "[" + sectionIndex + "]");
      $(this).attr("name", newName);
    });
    $("#sections_fields").append(newSectionField);
    sectionIndex++;

    $("#sectionIndex").data("sectionIndex", sectionIndex);
  }

  $("#standardTable").dataTable({
    processing: true,
    serverSide: true,
    ajax: {
      url: $("#standardTable").data("source"),
    },
    pagingType: "simple_numbers",
    language: {
      sLengthMenu: "_MENU_ records per page",
    },

    columns: [
      { data: "id", class: "standard_id" },
      { data: "name", class: "standard_name" },
      { data: "fee", class: "standard_fee" },
      { data: "section_name", class: "standard_name" },
      { data: "standard_actions", class: "standard_action" },
    ],
    oLanguage: {
      oPaginate: {
        sPrevious:
          '<span class="pagination-btn"><i class="fas fa-arrow-left"></i> Previous</span>',
        sNext:
          '<span class="pagination-btn">Next <i class="fas fa-arrow-right"></i></span>',
      },
    },
  });
  $("form").on("submit", function (e) {
    var standard_name = $("#standard_name").val();
    var fee = $("#fee").val();
    var section_name = $("#section_name").val();
    var err = $(".error-div");

    $(".error").text("");
    $(".error").css("color", "red");
    var errors = false;

    if (!standard_name || !standard_name.trim()) {
      $("#standard-error").text("Please enter a Standard Name.");
      errors = true;
    }
    if (!fee || !fee.trim()) {
      $("#fee-error").text("Please enter a Fee.");
      errors = true;
    }

    if (!section_name || !section_name.trim()) {
      $("#section-error").text("Please enter a Section Name.");
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
});
