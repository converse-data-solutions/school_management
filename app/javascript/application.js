// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "flowbite";
import "flowbite-datepicker";
import DataTable from "datatables.net-dt";

$(document).ready(function () {
  $(".activebar").on("click", function (e) {
    $(".activebar").removeClass("activenav");
    $(this).addClass("activenav");
  });
});

function initValidate() {

  $('#button').click(function() {
    $(this).addClass("border-2 border-[#000]");
    
  });
  //accordian for all models
  $(".accordian-header").click(function () {
    $(this).toggleClass("active");

    const accordianBody = $(this).parent().next();
    accordianBody.slideToggle();
  });

  setTimeout(function () {
    $("#notice").fadeOut();
  }, 5000);

  $(".main").click(function () {
    const el = $(this).parent().find(".sub");
    el.slideToggle("slow");
  });
  $(".theme-opener").click(function () {
    $(".theme-content").toggle();
    $(".admin-content").hide();
    $(".more-content").hide();
  });
  $(".admin-opener").click(function () {
    $(".admin-content").toggle();
    $(".theme-content").hide();
    $(".more-content").hide();
  });
  $(".more-opener").click(function () {
    $(".more-content").toggle();
    $(".theme-content").hide();
    $(".admin-content").hide();
  });
}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    initValidate();
  });
  
});
