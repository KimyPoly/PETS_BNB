import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-pop"
export default class extends Controller {
  static targets = ["popElement"]


  connect() {
    console.log("Hello there")
  }

  pop() {
    this.popElementTarget.classList.toggle("d-none");
  }
}
