import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";
import rangePlugin from "flatpickrRangePlugin";



export default class extends Controller {
  static targets = [ "startDate", "endDate" ]

  connect() {
    flatpickr(this.startDateTarget, {
      enableTime: false,
      inline: true,
      plugins: [new rangePlugin({ input: "#endDate"})]})

    flatpickr(this.endDateTarget, {})
  }
}
