// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "flowbite";
import "flowbite-datepicker";
import flatpickr from "flatpickr";
import DataTable from "datatables.net-dt";

function initValidate() {
    (function() {
        $("#hamburger-menu").on("click", function() {
            $("#hamburger-menu").toggleClass("active");
            $("#logo-sidebar").toggleClass("-translate-x-full transform-none");
        });
    })();

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
    $(".accordian-header").click(function() {
        $(this).toggleClass("active");

        const accordianBody = $(this).parent().next();
        accordianBody.slideToggle();
    });

    $(".activebar").on("click", function(e) {
        $(".activebar").removeClass("activenav");
        $(this).addClass("activenav");
    });

    setTimeout(function() {
        $("#notice").fadeOut();
    }, 5000);

    setTimeout(function() {
        $("#alert").fadeOut();
    }, 5000);

    $(".main").click(function() {
        const el = $(this).parent().find(".sub");
        el.slideToggle("slow");

        if ($(this).hasClass("openDropDown")) {
            // Hide the next ul list
            $(this).next("ul").toggleClass("hidden");
        }
    });

    $(document).on("click", function(event) {
        if (
            !$(event.target).closest(
                ".theme-opener, .theme-content, .admin-opener, .admin-content, .more-opener, .more-content"
            ).length
        ) {
            $(".theme-content, .admin-content, .more-content").hide();
            $(".more-opener").removeClass("activedropdown");
            $(".admin-opener").removeClass("active-admin");
            $(".theme-opener").removeClass("active-theme");

        }
    });

    $(".theme-opener").click(function() {
        $(".theme-content").toggle();
        $(".admin-content, .more-content").hide();
        $(".theme-opener").toggleClass("active-theme");
        $(".admin-opener").removeClass("active-admin");
    });

    $(".admin-opener").click(function() {
        $(".admin-content").toggle();
        $(".theme-content, .more-content").hide();
        $(".admin-opener").toggleClass("active-admin");
        $(".theme-opener").removeClass("active-theme");
    });

    $(".more-opener").click(function() {
        $(".more-content").toggle();
        $(".theme-content, .admin-content").hide();
        $(".more-opener").toggleClass("activedropdown");
    });
    $("#single_file").on("change", function(event) {
        showPreview(event, $("#previewSingle"));
        $("#defaultUpload").addClass("hidden");
    });
}

function showPreview(event, previewBox) {
    previewBox.empty();

    $.each(event.target.files, function(i, file) {
        let img = $("<img>")
            .addClass("aspect-auto h-[130px] w-[130px] mb-4 shadow")
            .attr("src", URL.createObjectURL(file));
        previewBox.append(img);
    });
}

$(document).ready(function() {
    initValidate();

    $(document).on("turbo:render", function() {
        initValidate();
    });
});