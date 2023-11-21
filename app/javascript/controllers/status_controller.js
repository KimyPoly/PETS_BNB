import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="status"
export default class extends Controller {
  static targets = ["acceptButton", "refuseBooking"]

  connect() {
    console.log("Hello from the status controller")
  }

  change_status() {
    
  }
}
