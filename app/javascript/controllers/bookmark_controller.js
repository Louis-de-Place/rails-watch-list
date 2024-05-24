import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  openModal(event) {
    document.querySelector(".modal-body").innerHTML =
      event.currentTarget.innerHTML;
  }
}
