import { Controller } from "@hotwired/stimulus"
import { Button } from "bootstrap";

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["daybutton", "monthbutton", "yearbutton", "day", "month", "year"]
  connect() {
    setTimeout(() => {
      this.day()}, 50);
  }

  dayButton() {
    this.daybuttonTarget.classList.add("toggle-button-active")
    this.monthbuttonTarget.classList.remove("toggle-button-active")
    this.yearbuttonTarget.classList.remove("toggle-button-active")
  }

  day() {
    this.dayTarget.classList.remove("d-none")
    this.monthTarget.classList.add("d-none")
    this.yearTarget.classList.add("d-none")
  }

  monthButton() {
    this.daybuttonTarget.classList.remove("toggle-button-active")
    this.daybuttonTarget.classList.add("toggle-button")
    this.monthbuttonTarget.classList.add("toggle-button-active")
    this.yearbuttonTarget.classList.remove("toggle-button-active")
  }

  month() {
    this.monthTarget.classList.remove("d-none")
    this.dayTarget.classList.add("d-none")
    this.yearTarget.classList.add("d-none")
  }

  yearButton() {
    this.daybuttonTarget.classList.remove("toggle-button-active")
    this.daybuttonTarget.classList.add("toggle-button")
    this.monthbuttonTarget.classList.remove("toggle-button-active")
    this.yearbuttonTarget.classList.add("toggle-button-active")
  }

  year() {
    this.yearTarget.classList.remove("d-none")
    this.dayTarget.classList.add("d-none")
    this.monthTarget.classList.add("d-none")
  }
}
