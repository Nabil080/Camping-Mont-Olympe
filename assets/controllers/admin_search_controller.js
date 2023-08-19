import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["results"];

    onSearchInput(e) {
        if (e.target.value.length > 0) this.search(e);
        else this.stop();
    }

    search(e) {
        this.resultsTarget.classList.remove("hidden");

        let results = values
            .filter((array) =>
                array[0].toLowerCase().includes(e.target.value.toLowerCase())
            )
            .map((array) => new Result(array[0], array[1]));

        this.insertResults(results);
    }

    stop() {
        this.resultsTarget.classList.add("hidden");
    }

    insertResults(results) {
        this.resultsTarget.innerHTML = "";

        results.forEach(
            (result) => (this.resultsTarget.innerHTML += result.getHTML())
        );
    }
}

class Result {
    constructor(display, path) {
        this.display = display;
        this.path = path;
    }

    getHTML() {
        return `<article> <a href="/${this.path}"></a>${this.display}</article>`;
    }
}

let values = [
    ["Voir les Saisons", "admin/settings/seasons"],
    ["Ajouter une Saison", "admin/settings/seasons/add"],
    ["Voir les Saisons", "admin/settings/seasons"],
    ["Ajouter un service supplémentaire", "admin/settings/services/add"],
];
