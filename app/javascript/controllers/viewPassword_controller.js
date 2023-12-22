import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {

  connect() {

  }

  toggle() {

    let togglePassword = document.getElementById("password-input");
    if (togglePassword.type === "password") {
      togglePassword.type = "text";
    } else {
      togglePassword.type = "password";
    }
  }
}
