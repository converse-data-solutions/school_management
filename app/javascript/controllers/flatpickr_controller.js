import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
export default class extends Controller {
  
  connect() {
    console.log("hello from flatpickr controller");
    console.log(this.element);
    flatpickr("#date_of_birth")
    flatpickr("#date_of_admission", {
      dateFormat: "d.m.Y"
    })
  }
}