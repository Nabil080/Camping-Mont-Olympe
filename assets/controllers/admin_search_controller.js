import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["results"];

    onSearchInput(e) {
        this.searchValue = e.target.value

        if (this.searchValue.length > 0) this.search();
        else this.stop();
    }

    search() {
        this.resultsTarget.classList.remove("hidden");

        let results = values
            .filter((array) => array[0].toLowerCase().includes(this.searchValue.toLowerCase()))
            .map((array) => new Result(array[0], array[1]));

        this.insertResults()
    }

    stop() {
        this.resultsTarget.classList.add("hidden");
    }

    insertResults() {
      this.resultsTarget.innerHTML = 'slt'


    }
}

class Result {
    constructor(display, path) {
        this.display = display;
        this.path = path;
    }
}

let values = [
    ["Ajouter une Saison", "admin_settings_seasons_add"],
    ["Voir les Saisons", "admin_settings_seasons"],
];
