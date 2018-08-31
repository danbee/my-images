import { Controller } from "stimulus";
import ajaxService from "../services/ajax_service";

export default class extends Controller {
  static targets = [ "name" ];

  connect() {
    console.log("Connected to our tags");
  }

  disconnect() {
    console.log("Bye bye tag!");
  }

  delete(event) {
    const imageId = this.element.dataset.imageId;
    const tag = this.nameTarget.innerText;

    event.preventDefault();

    this.element.classList.add("hidden");

    ajaxService.deleteTag(tag)
      .then(response => {
        this.element.parentElement.removeChild(this.element);
      })
      .catch(error => {
        this.element.classList.remove("hidden")
      });
  }
}
