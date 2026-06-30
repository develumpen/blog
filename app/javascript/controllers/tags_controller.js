import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tags"
export default class extends Controller {
  static targets = [ "button" ]

  connect() {
    this.buttonTarget.hidden = true
  }

  submit() {
    this.element.requestSubmit()
  }
}
