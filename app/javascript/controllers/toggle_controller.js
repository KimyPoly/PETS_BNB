import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["togglableElement"]

  connect() {

    if (this.hasTogglableElementTarget) {
    }
  }

  fire() {
    if (this.hasTogglableElementTarget) {
      this.togglableElementTarget.classList.toggle("d-none");
    }
  }
}
