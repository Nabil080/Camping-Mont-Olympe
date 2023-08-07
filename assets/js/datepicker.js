import DateRangePicker from 'flowbite-datepicker/DateRangePicker';
import { locales } from "../../node_modules/flowbite-datepicker/js/i18n/base-locales.js";
import fr from "../../node_modules/flowbite-datepicker/js/i18n/locales/fr.js";

console.log(locales)
locales.fr = fr.fr;

const datepickerOptions = {
  language: "fr",
  weekStart: 1,
  clearBtn: true,
  minDate: '01-08-2023',
  maxDate: '11-08-2023',
  title: 'Date de réservation'
};

const dateRangePickerEl = document.getElementById('reservation');
const d = new DateRangePicker(dateRangePickerEl);
d.setOptions(datepickerOptions) 

// console.log(d)