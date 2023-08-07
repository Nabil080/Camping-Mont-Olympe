import DateRangePicker from 'flowbite-datepicker/DateRangePicker';
import { locales } from "../../node_modules/flowbite-datepicker/js/i18n/base-locales.js";
import fr from "../../node_modules/flowbite-datepicker/js/i18n/locales/fr.js";

// console.log(locales)
// locales = fr;

const datepickerOptions = {
//   language: "fr",
  weekStart: 1,
};

const dateRangePickerEl = document.getElementById('reservation');
const d = new DateRangePicker(dateRangePickerEl);
d.setOptions(datepickerOptions) 

console.log(d)