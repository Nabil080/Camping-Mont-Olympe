import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button","content"]

  connect() {
    this.buttonTarget.dataset.action = "collapse#toggle"
  }

  toggle() {
    this.contentTarget.classList.toggle('hidden')
  }
}
