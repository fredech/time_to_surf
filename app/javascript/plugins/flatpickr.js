import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css"
import "flatpickr/dist/themes/airbnb.css"

flatpickr(".datepicker", {
  enableTime: true,
  time_24hr: true,
  minDate: "today",
  maxDate: new Date().fp_incr(3),
  defaultHour: 12,
  defaultMinute: 0,
})
