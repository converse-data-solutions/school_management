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