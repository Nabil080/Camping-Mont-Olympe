import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {}

    submit() {
        this.element.querySelector('button[type="submit"]').click();
    }
}
