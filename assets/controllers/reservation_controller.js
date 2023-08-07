import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // console.log(this.element)

    this.open()
  }

  open() {

    const container = document.querySelector('#reservation-container')
    container.classList.remove('translate-x-full');
  }

  close() {

    const container = document.querySelector('#reservation-container')
    container.classList.add('translate-x-full');
  }

}
