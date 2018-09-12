import axios from "axios";

const csrfToken = () => {
  return document
    .getElementsByName("csrf-token")[0]
    .attributes["content"]
    .value;
}

const imageId = () => {
  return document
    .getElementsByClassName("show-image")[0]
    .attributes["data-image-id"]
    .value;
}

const config = () => ({
  headers: { "X-CSRF-Token": csrfToken() }
});

export default {
  createTag: (tag) => {
    return axios.post(`/user/images/${imageId()}/tags`, { tag }, config());
  },

  deleteTag: (tag) => {
    return axios.delete(
      `/user/images/${imageId()}/tags/${encodeURIComponent(tag)}`,
      config()
    );
  }
}
