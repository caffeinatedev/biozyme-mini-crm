import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["field", "error"]

  submit(event) {
    let valid = true

    this.fieldTargets.forEach((field) => {
      const error = field.closest(".form-group")?.querySelector(".error-message")

      if (!field.checkValidity()) {
        valid = false
        field.classList.add("is-invalid")

        if (error) {
          error.textContent = field.validationMessage
          error.classList.remove("d-none")
        }
      } else {
        field.classList.remove("is-invalid")
        field.classList.add("is-valid")

        if (error) {
          error.textContent = ""
          error.classList.add("d-none")
        }
      }
    })

    if (!valid) {
      event.preventDefault()
    }
  }
}
