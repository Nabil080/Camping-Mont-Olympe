import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.element.classList.add("-translate-y-full", "duration-700");
        this.element.classList.remove("hidden");

        document.addEventListener("scroll", () => {
            if (window.scrollY > 400) {
                this.show();
            } else {
                this.hide();
            }
        });
    }

    show() {
        this.element.classList.remove("-translate-y-full");
    }

    hide() {
        this.element.classList.add("-translate-y-full");
    }
}
