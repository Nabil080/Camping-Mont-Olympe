import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        this.container = document.querySelector("#reservation-container");
        this.overlay = document.querySelector("#reservation-overlay");
        this.cardsContainer = this.container.querySelector("#reservation-cards");
    }

    open() {
        this.overlay.classList.remove("hidden");
        setTimeout(() => this.overlay.classList.add("!bg-opacity-30"), 10);
        this.container.classList.remove("translate-x-full");

        this.find();
    }

    close() {
        this.overlay.classList.remove("!bg-opacity-30");
        setTimeout(() => this.overlay.classList.add("hidden"), 1000);
        this.container.classList.add("translate-x-full");
    }

    async find() {
        this.start = this.container.querySelector('input[name="start"]').value;
        this.end = this.container.querySelector('input[name="end"]').value;
        if (!this.start && !this.end) return;

        this.showLoader();
        let data = await this.fetchData(this.start, this.end);

        if (data.count.found > 0) this.insertData(data);
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
                adults: 2,
                childs: 1,
            }),
        }).then((data) => data.json());
    }

    insertData(data) {
        this.cardsContainer.innerHTML = `<header class="text-sm opacity-80">${data.count.found} résultats sur ${data.count.total}</header>`;

        data.available.forEach((card) => this.cardsContainer.innerHTML += this.getAvailableHTMLCard(card) );

        data.unavailable.forEach((card) => this.cardsContainer.innerHTML +=this.getUnavailableHTMLCard(card) );
    }

    getAvailableHTMLCard(card) {
        let tags = "";
        card.accomodation.tags.forEach((tag) => tags += `<div class='bg-main-100 rounded-full p-1 px-4 text-sm'>${tag}</div>` );

        return `
                <article id="accom-${card.accomodation.id}" data-location-id="${card.location.id}" data-location-number="${card.location.number}" class="reservation-card available-reservation bg-white border border-gray-200 p-2 text-black">
                    <section class="flex gap-4">
                        <div class="image-container w-1/3 aspect-[16/12] border border-white outline-1 outline-gray-200">
                            <img class="h-full" src="uploads/accomodations/${card.accomodation.image}">
                        </div>
                        <div class="description-container flex flex-col relative flex-1 mt-2">
                            <div class="text-lg font-title">${card.accomodation.name}</div>
                            <p class="text-sm opacity-50"><i class="fa-solid fa-users"></i> 2/6 personnes | <i class="fa-solid fa-bed"></i> 8/16 emplacements restants</p>
                            <div class="flex flex-wrap gap-2 mt-2">${tags}</div>
                            <div class="flex items-center self-end place-self-end gap-2 w-fit h-fit mt-auto">
                                <p class="text-xs opacity-80">prix pour ${card.reservation.stay} nuits,</p>
                                <button data-action="click->reservation#price" data-div="price-${card.accomodation.id}" class="text-xs opacity-80 underline hover:opacity-100">voir le détail du prix</button>
                                <button class='bg-main-400 text-white rounded-full py-2 px-4'>${card.price.total}€ <i class="fa fa-chevron-right"></i></button>
                            </div>
                        </div>
                    </section>
                    <div id="price-${card.accomodation.id}" class="hidden my-2 text-sm opacity-80">
                        <span class="font-bold"> Prix de l'hébergement : ${card.price.accomodation}€ </span> <br>
                        Du ${card.reservation.start} au ${card.reservation.end} (${card.reservation.stay} nuits x ${card.price.accomodation}€) : ${card.price.accomodation * card.reservation.stay}€ <br>
                        <span class="font-bold"> Adultes supplémentaires (${card.reservation.adults}) : ${card.price.adult}€ </span> <br>
                        Du ${card.reservation.start} au ${card.reservation.end} (${card.reservation.stay} nuits x ${card.reservation.adults} x ${card.price.adult}€) : ${card.price.adult * card.reservation.adults *card.reservation.stay}€ <br>
                        <span class="font-bold"> Enfants supplémentaires (${card.reservation.childs}) : ${card.price.child}€ </span> <br>
                        Du ${card.reservation.start} au ${card.reservation.end} (${card.reservation.stay} nuits x ${card.reservation.childs} x ${card.price.child}€) : ${card.price.child *card.reservation.childs *card.reservation.stay}€ <br>
                    </div>
                </article>
            `;
    }

    getUnavailableHTMLCard(card) {
        let tags = "";
        card.accomodation.tags.forEach(
            (tag) => (tags += `<div class='reservation-tag'>${tag}</div>`)
        );

        let errorMessage = this.getErrorMessage(card.error);

        return `
                <article id="accom-${card.accomodation.id}" data-location-id="${card.location.id}" data-location-number="${card.location.number}" class="reservation-card unavailable-reservation flex gap-4 bg-white border border-gray-200 p-2">
                <div class="overlay z-50 bg-black bg-opacity-70 text-white">
                    <div class="grid w-full h-full place-items-center text-xl text-center">
                        ${errorMessage} 
                    </div>
                </div>
                    <div class="image-container w-1/3 aspect-[16/12] border border-white outline-1 outline-gray-200">
                        <img class="h-full" src="uploads/accomodations/${card.accomodation.image}">
                    </div>
                    <div class="description-container relative flex-1 mt-2 text-black">
                        <div class="text-lg font-title">${card.accomodation.name}</div>
                        <p class="text-sm opacity-50"><i class="fa-solid fa-users"></i> 2/6 personnes | <i class="fa-solid fa-bed"></i> 8/16 emplacements restants</p>
                        <div class="flex flex-wrap gap-2 mt-2">${tags}</div>
                        <div class="absolute bottom-2 right-2 flex items-center gap-2">
                            <p class="text-xs opacity-80">prix pour ${card.reservation.stay} nuits,</p>
                            <p class="text-xs opacity-80 underline hover:opacity-100">voir le détail</p>
                            <button class='bg-main-400 text-white rounded-full py-2 px-4'>${card.price.total}€ <i class="fa fa-chevron-right"></i></button>
                        </div>
                    </div>
                </article>
            `;
    }

    getErrorMessage(error) {
        let value = error.value;
        const days = ["lundi","mardi","mercredi","jeudi","vendredi","samedi","dimanche",];
        let messageDays;
        if((typeof value != 'number')) messageDays = value.map((value) => days[value - 1]).join(", ");

        switch (error.rule) {
            case "checkIn":
                return `Jour d'arrivée non autorisé. <br> Sont autorisés : ${messageDays} `;
            case "checkOut":
                return `Jour de départ non autorisé. <br> Sont autorisés : ${messageDays} `;
            case "minStay":
                return `Le séjour doit durer au minimum ${value} nuits`;
            case "maxStay":
                return `Le séjour doit durer au minimum ${value} nuits`;
            case "full":
                return `Aucun emplacement disponible pour cette période`;
            default:
                return `Une règle de réservation n'a pas été respectée`;
        }
    }

    price(e) {
        this.container
            .querySelector(`#${e.target.dataset.div}`)
            .classList.toggle("hidden");
        e.target.innerText =
            e.target.innerText === "Cacher le détail du prix"
                ? "Voir le détail du prix"
                : "Cacher le détail du prix";
    }

    showLoader() {
        this.cardsContainer.innerHTML = `
        <div class="animate-spin grid h-full w-full place-items-center">
            CA CHAAAAARGEEEEEE
        </div>
    `;
    }
}
