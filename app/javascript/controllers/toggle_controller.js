import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["day-button", "month-button", "year-button", "day", "month", "year"]
  connect() {
    setTimeout(() => {
      this.day()}, 50);
  }

  day() {
    this.dayTarget.classList.remove("d-none")
    this.monthTarget.classList.add("d-none")
    this.yearTarget.classList.add("d-none")
  }

  month() {
    this.monthTarget.classList.remove("d-none")
    this.dayTarget.classList.add("d-none")
    this.yearTarget.classList.add("d-none")
  }

  year() {
    this.yearTarget.classList.remove("d-none")
    this.dayTarget.classList.add("d-none")
    this.monthTarget.classList.add("d-none")
  }
}
