import { Controller } from "stimulus";
import ajaxService from "../services/ajax_service";

export default class extends Controller {
  static targets = ["name"];

  delete(event) {
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
