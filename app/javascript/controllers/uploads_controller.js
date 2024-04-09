import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form", "fileField"];

  connect() {
    this.element.addEventListener("dragenter", (event) => {
      console.log(event);
    });

    this.fileFieldTarget.addEventListener("change", (event) => {
      this.formTarget.submit();
    });
  }
}
