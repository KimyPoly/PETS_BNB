import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2'

// Connects to data-controller="alert"
export default class extends Controller {
  connect() {
  }

  addAlertSuccess(event) {
    console.log(event.detail);
    if (event.detail.success) {
      Swal.fire({
        title: "Your booking is confirmed! 🎉",
        icon: "success",
        showDenyButton: true,
        confirmButtonText: "Find it in dashboard",
        denyButtonText: `Find another pet`
      }).then((result) => {
          if (result.isConfirmed) {
            Turbo.visit(`${window.location.origin}/dashboard`)
          } else if (result.isDenied) {
            Turbo.visit(`${window.location.origin}/`)
          }
      })
    }
  }
}
