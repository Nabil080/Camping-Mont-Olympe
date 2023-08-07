import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.element.classList.add("opacity-0", "translate-y-20");
    this.element.classList.remove("hidden");

    setTimeout(() => {
      this.element.classList.add("duration-700", "ease-in");
      this.element.classList.remove("opacity-0", "translate-y-20");
    });
  }
}
