// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "flowbite";
import "flowbite-datepicker";
import flatpickr from "flatpickr";
import DataTable from "datatables.net-dt";

function initValidate() {
  function openDropdown(dropdown) {
    const dropdownContent = dropdown.parent().find(".sub");
    dropdownContent.slideDown("fast");
  }

  // Check if the openDropDown class is present and open the dropdown accordingly
  if ($("#dropdownNavbarManageFee").hasClass("openDropDown")) {
    const dropdownFee = $("#dropdownNavbarManageFee");
    openDropdown(dropdownFee);
  }

  if ($("#dropdownNavbarmanageStudent").hasClass("openDropDown")) {
    const dropdownStudent = $("#dropdownNavbarmanageStudent");
    openDropdown(dropdownStudent);
  }

  if ($("#dropdownNavbarManageParent").hasClass("openDropDown")) {
    const dropdownParent = $("#dropdownNavbarManageParent");
    openDropdown(dropdownParent);
  }

  if ($("#dropdownNavbarManageStaff").hasClass("openDropDown")) {
    const dropdownStaff = $("#dropdownNavbarManageStaff");
    openDropdown(dropdownStaff);
  }

  //accordian for all models
  $(".accordian-header").click(function () {
    $(this).toggleClass("active");
  });

  $(".activebar").on("click", function (e) {
    $(".activebar").removeClass("activenav");
    $(this).addClass("activenav");
  });

  setTimeout(function () {
    $("#notice").fadeOut();
  }, 5000);

  $(".main").click(function () {
    const el = $(this).parent().find(".sub");
    el.slideToggle("slow");

    if ($(this).hasClass("openDropDown")) {
      // Hide the next ul list
      $(this).next("ul").toggleClass("hidden");
    }
  });

  $(document).on("click", function (event) {
    if (
      !$(event.target).closest(
        ".theme-opener, .theme-content, .admin-opener, .admin-content, .more-opener, .more-content"
      ).length
    ) {
      $(".theme-content, .admin-content, .more-content").hide();
      $(".more-opener").removeClass("activedropdown");
      $(".admin-opener").removeClass("active-admin");
    }
  });

  $(".theme-opener").click(function () {
    $(".theme-content").toggle();
    $(".admin-content, .more-content").hide();
  });

  $(".admin-opener").click(function () {
    $(".admin-content").toggle();
    $(".theme-content, .more-content").hide();
    $(".admin-opener").toggleClass("active-admin");
  });

  $(".more-opener").click(function () {
    $(".more-content").toggle();
    $(".theme-content, .admin-content").hide();
    $(".more-opener").toggleClass("activedropdown");
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
});
