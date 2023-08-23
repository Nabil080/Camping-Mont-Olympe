import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.container = document.querySelector("#reservation-container");
        this.overlay = document.querySelector("#reservation-overlay");
        this.cardsContainer =
            this.container.querySelector("#reservation-cards");
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
        
        this.showLoader()
        let data = await this.fetchData(this.start, this.end);
        // this.hideLoader()

        this.insertData(data);
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
                childs: 2,
            }),
        }).then((data) => data.json());
    }

    insertData(data) {
        this.cardsContainer.innerHTML = `
            <header>${data.count} résultats</header>
        `;

        console.log(data);

        data.available.forEach(
            (card) =>
                (this.cardsContainer.innerHTML += `
                    <article id="accom-${card.accomodation.id}" data-location-id="${card.location.id}" data-location-number="${card.location.number}" class="reservation-card available-reservation">
                        <div>${card.accomodation.name}</div>
                        <div>${card.accomodation.description}</div>
                        <div>${card.price.total}€</div>
                        <div>${card.reservation.stay} nuits</div>
                    </article>
                `)
        );

        if(data.unavailable){
            data.unavailable.forEach(
                (card) =>
                (this.cardsContainer.innerHTML += `
                <article id="accom-${card.accomodation.id}" data-location-id="${card.location.id}" data-location-number="${card.location.number}" class="reservation-card unavailable-reservation">
                <div class="overlay bg-black bg-opacity-50 text-white">
                        <div class="grid w-full h-full place-items-center text-xl">
                            Emplacement indisponible car ${card.error.rule} ${card.error.value} 
                            </div>
                    </div>
                    <div>${card.accomodation.name}</div>
                    <div>${card.accomodation.description}</div>
                    <div>${card.price.total}€</div>
                    </article>
                `)
            );
        }
    }

    showLoader() {
        this.cardsContainer.innerHTML = `
        <div class="animate-spin grid h-full w-full place-items-center">
            CA CHAAAAARGEEEEEE
        </div>
    `;
    }
}
