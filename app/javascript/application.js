// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import 'flowbite';
import 'flowbite-datepicker';
import DataTable from 'datatables.net-dt';



$(document).ready(function() {
  setTimeout(function() {
    $("#notice").fadeOut();
  }, 5000);
});
$(document).ready(function () {
  $('.activebar').on('click', function (e) {
$('.activebar').removeClass('activenav');
$(this).addClass('activenav');
 });
});

function initValidate() {
  //accordian for all models
    $('.accordian-header').click(function() {
  $(this).toggleClass('active');
  const accordianBody = $(this).next();
  if ($(this).hasClass('active')) {
    accordianBody.css('maxHeight', 800 + 'px');
  } else {
    accordianBody.css('maxHeight', 0);
  
  }
    });
  

  console.log("init validate");
  $('.main').click(function() {
    const el = $(this).parent().find('.sub');
    el.slideToggle('slow');
  });


}

$(document).ready(function () {
  initValidate();

  $(document).on("turbo:render", function () {
    console.log("turbo rendered for form");
    initValidate();
  });
});
