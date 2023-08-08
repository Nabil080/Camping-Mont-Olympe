import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["button", "content"];

  connect() {
    this.buttonTarget.dataset.action = "collapse#toggle";
    this.contentTarget.classList.add(
      "hidden",
      "scale-y-0",
      "transition",
      "ease-in-out",
      "duration-300",
      "origin-top",
    );

    // this.toggle()
  }

  toggle() {
    if (this.contentTarget.classList.contains("scale-y-0")) {
      this.contentTarget.classList.remove("hidden");
      setTimeout(() =>
        this.contentTarget.classList.replace("scale-y-0", "scale-y-100"),
      );
    } else {
      this.contentTarget.classList.replace("scale-y-100", "scale-y-0"),
        setTimeout(() => this.contentTarget.classList.add("hidden"),150);
    }
  }
}
