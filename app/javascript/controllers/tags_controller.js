import { Controller } from "stimulus";
import ajaxService from "../services/ajax_service";

export default class extends Controller {
  static targets = ["tag", "tagList"]

  create(event) {
    const tag = this.tagTarget.value;

    event.preventDefault();

    ajaxService.createTag(tag)
      .then(response => {
        if (response.status == 200) {
          this.tagListTarget.innerHTML += response.data;
          this.tagTarget.value = "";
        };
      })
  }
}
