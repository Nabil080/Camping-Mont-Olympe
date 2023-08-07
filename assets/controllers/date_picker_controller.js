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
    // console.log(this.element);

    new DateRangePicker(this.element, options);
  }
}
