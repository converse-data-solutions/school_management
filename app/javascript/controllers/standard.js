function initValidate() {
  function toggleRemoveLink() {
    let visibleSectionCount = $(".section_fields:visible").length;

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

  let sectionIndex = $("#sectionIndex").data("sectionIndex");
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
    let removeSection = $(elem).closest(".section_fields");
    let removeBox = $(elem).closest(".section_fields").find(".checkbox");
    removeSection.addClass("hidden");
    let clicked = false;

    removeBox.prop("checked", !clicked);
    sectionIndex--;
    $("#sectionIndex").data("sectionIndex", sectionIndex);
  }
  function addSectionField() {
    let newSectionField = $("#sections_fields .section_fields:first").clone();
    newSectionField.find("input").val("");
    newSectionField.find("input").each(function () {
      let oldName = $(this).attr("name");
      let newName = oldName.replace(/\[\d\]/, "[" + sectionIndex + "]");
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
      { data: "id" },
      { data: "name" },
      { data: "fee" },
      { data: "section_name" },
      { data: "standard_actions", class: "crud-action" },
    ],
    scrollX: "100%", // Enable horizontal scrolling
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
    let standard_name = $("#standard_name").val();
    let fee = $("#fee").val();
    let section_name = $("#section_name").val();
    let err = $(".error-div");

    $(".error").text("");
    let errors = false;

    if (!standard_name || !standard_name.trim()) {
      $("#standard-error").text("Please enter a Standard Name.");
      errors = true;
    }

    if (validator.isInt(fee) == false) {
      $("#fee-error").text("Please enter a valid Fee.");
      errors = true;
    }

    if (!section_name || !section_name.trim()) {
      $("#section-error").text("Please enter a Section Name.");
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
