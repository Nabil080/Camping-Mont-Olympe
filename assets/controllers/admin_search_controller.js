import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["results"];

  connect() {
    console.log(this.resultsTarget)
  }

  onSearchInput() {

    console.log(this.searchResults)
  }
}
