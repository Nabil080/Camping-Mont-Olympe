import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["button", "content"];

    connect() {
        this.buttonTarget.dataset.action = "collapse#toggle";
        this.contentTarget.classList.add(
            "max-h-0",
            "h-auto",
            "overflow-hidden",
            "transition",
            "ease-in-out",
            "duration-300"
        );

        // this.toggle()
    }

    toggle() {
        this.contentTarget.classList.toggle("max-h-[300px]");
        this.contentTarget.classList.toggle("p-5");
    }
}
