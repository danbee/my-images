import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["tag", "tagList"]

  onPostSuccess(event) {
    let [data, status, xhr] = event.detail;
    this.tagListTarget.innerHTML += xhr.response;
    this.tagTarget.value = "";
  }
}
