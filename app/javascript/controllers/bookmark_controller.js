import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  openModal(event) {
    document.getElementById("modal").querySelector(".modal-content").innerHTML =
      event.target.parentElement.innerHTML;
    document.getElementById("modal").setAttribute("style", "display: block;");
    document.getElementById("modal").classList.add("show");

    document.querySelector("body").classList.add("modal-open");
    document
      .querySelector("body")
      .insertAdjacentHTML(
        "beforeend",
        '<div class="modal-backdrop fade show"></div>',
      );
  }

  closeModal() {
    document.querySelector("body").classList.remove("modal-open");
    document.getElementById("modal").removeAttribute("style");
    document.getElementById("modal").classList.remove("show");
    document.getElementsByClassName("modal-backdrop")[0].remove();
  }
}
