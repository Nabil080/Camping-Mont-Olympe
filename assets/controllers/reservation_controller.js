import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // console.log(this.element)

    // this.open()
  }

  open() {
    const container = document.querySelector('#reservation-container')
    const overlay = document.querySelector('#reservation-overlay')

    overlay.classList.remove('hidden')
    container.classList.remove('translate-x-full');
  }

  close() {
    const container = document.querySelector('#reservation-container')
    const overlay = document.querySelector('#reservation-overlay')

    overlay.classList.add('hidden')
    container.classList.add('translate-x-full');
  }

  updateValue() {
    const container = document.querySelector('#reservation-container')
    const start = container.querySelector('#start-date')
    const end = container.querySelector('#end-date')

    const startInput = document.querySelector('#reservation [name="start"]') 
    const endInput = document.querySelector('#reservation [name="end"]')
    
    start.innerText = startInput.value;
    end.innerText = endInput.value;
  }


}
