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
        setTimeout(() => this.resultsTarget.classList.add("hidden"), 200);
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
    ["Voir les Services supplémentaires", "admin/settings/services"],
    ["Ajouter un Service supplémentaire", "admin/settings/services/add"],
];
