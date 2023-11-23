import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {

  }

  trashHover(event) {
    event.target.classList.toggle('fa-bounce');
  }

  trashRemove(event) {
    event.target.classList.remove('fa-bounce');
  }


}
