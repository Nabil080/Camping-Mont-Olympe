import DateRangePicker from 'flowbite-datepicker/DateRangePicker';
// import { locales } from "flowbite-datepicker/";
// import fr from "flowbite-datepicker/js/i18n/locales/fr.js";

// DateRangePicker.locales.fr = fr;

const datepickerOptions = {
  language: "fr",
  weekStart: 1,
};

const dateRangePickerEl = document.getElementById('reservation');
const d = new DateRangePicker(dateRangePickerEl);
d.setOptions(datepickerOptions) 

console.log(d)