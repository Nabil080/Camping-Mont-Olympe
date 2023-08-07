import { Controller } from "@hotwired/stimulus";
import DateRangePicker from "flowbite-datepicker/DateRangePicker";
import { locales } from "../../node_modules/flowbite-datepicker/js/i18n/base-locales.js";
import fr from "../../node_modules/flowbite-datepicker/js/i18n/locales/fr.js";

export default class extends Controller {
  connect() {
    locales.fr = fr.fr;

    const options = {
      language: "fr",
      weekStart: 1,
      clearBtn: true,
      minDate: "01-08-2023",
      maxDate: "11-08-2023",
    };

    const d = new DateRangePicker(this.element, options);

    d.inputs.forEach(input => {
      input.addEventListener('changeDate', event => {
        this.synchronizeValues()
      })

    })
  }

  synchronizeValues() {
    let newStart = this.element.querySelector('[name="start"]').value
    let newEnd = this.element.querySelector('[name="end"]').value
    let startInputs = document.querySelectorAll('[name="start"]')
    let endInputs = document.querySelectorAll('[name="end"]')

    startInputs.forEach(input => input.value = newStart)
    endInputs.forEach(input => input.value = newEnd)
  }


  test() {
    console.log('SLT')

  }
}
