import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";
export default class extends Controller {
  connect() {
    flatpickr("#date_of_birth", {
      dateFormat: "d-m-Y",
    });
    flatpickr("#date_of_admission", {
      dateFormat: "d-m-Y",
    });
  }
}
