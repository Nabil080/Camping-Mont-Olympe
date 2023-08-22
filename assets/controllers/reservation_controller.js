import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.container = document.querySelector("#reservation-container");
        this.overlay = document.querySelector("#reservation-overlay");
        this.cardsContainer = this.container.querySelector(
            "#reservation-cards-container"
        );
    }

    open() {
        this.overlay.classList.remove("hidden");
        this.container.classList.remove("translate-x-full");

        this.find();
    }

    close() {
        this.overlay.classList.add("hidden");
        this.container.classList.add("translate-x-full");
    }

    async find() {
        this.start = this.container.querySelector('input[name="start"]').value;
        this.end = this.container.querySelector('input[name="end"]').value;
        if (!this.start && !this.end) return;

        let data = await this.fetchData(this.start, this.end);

        this.cardsContainer.innerHTML = ``;
        this.cardsContainer.innerHTML += `slt`;
    }

    async fetchData(start, end) {
        return fetch("/reservations/find", {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                start: start,
                end: end,
                adults: 1,
                childs: 0,
            }),
        }).then((data) => data.json());
    }
}
