import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.container = document.querySelector("#reservation-container");
    this.overlay = document.querySelector("#reservation-overlay");
  }

  open() {
    this.overlay.classList.remove("hidden");
    this.container.classList.remove("translate-x-full");
  }

  close() {
    this.overlay.classList.add("hidden");
    this.container.classList.add("translate-x-full");
  }

  updateValue() {
    const start = this.container.querySelector("#start-date");
    const end = this.container.querySelector("#end-date");

    const startInput = document.querySelector('#reservation [name="start"]');
    const endInput = document.querySelector('#reservation [name="end"]');

    start.innerText = startInput.value;
    end.innerText = endInput.value;
  }
}
