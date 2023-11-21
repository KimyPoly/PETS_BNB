import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="review-pop"
export default class extends Controller {
  static targets = ["popElement"]


  connect() {

  }

  pop() {
    this.popElementTarget.classList.toggle("d-none");
  }
}
