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
    let form = this.element
    form.style.width = `${form.clientWidth + 1}px`
    
    console.log(this.element);
  }


  toggleForm(event) {
    event.preventDefault()
    
    this.element.querySelectorAll('p').forEach(info => {
      info.classList.toggle('hidden')
    })

    this.element.querySelectorAll('input').forEach(input => {
      input.classList.toggle('hidden')
    })

    
    this.element.querySelector('#form-buttons').querySelectorAll('button').forEach(button => button.classList.toggle('hidden'))
    this.element.querySelector('button#update').classList.toggle('hidden')
  }

}
