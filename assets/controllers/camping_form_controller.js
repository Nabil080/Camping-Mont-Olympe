import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        let form = this.element;
        form.style.width = `${form.clientWidth + 1}px`;

        console.log(this.element);
    }

    toggleForm(event) {
        event.preventDefault();

        this.element.querySelectorAll("p").forEach((info) => {
            info.classList.toggle("hidden");
        });

        this.element.querySelectorAll("input").forEach((input) => {
            input.classList.toggle("hidden");
        });

        this.element
            .querySelector("#form-buttons")
            .querySelectorAll("button")
            .forEach((button) => button.classList.toggle("hidden"));
        this.element.querySelector("button#update").classList.toggle("hidden");
    }
}
