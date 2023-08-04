import { Controller } from "@hotwired/stimulus";

/*
 * This is an example Stimulus controller!
 *
 * Any element with a data-controller="hello" attribute will cause
 * this controller to be executed. The name "hello" comes from the filename:
 * hello_controller.js -> "hello"
 *
 * Delete this file or adapt it for your use!
 */
export default class extends Controller {
  connect() {
    this.element.dataset.action = "hello#click";

    console.log("début");
  }


  count(event) {
    event.preventDefault();

    this.element.textContent = "Sympa";

    document.querySelector("body").dataset.action = "hello#click";

    console.log("hi");
  }
}
