import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("stimulas controller connected");
  }
  change_transaction_type(event) {
    console.log("changed");
    const value = document.getElementById("transaction-type");
    value.value === "Account" || value.value === "Bank-Transfer"
      ? (document.getElementById("accounts").style.display = "block")
      : (document.getElementById("accounts").style.display = "none");
  }
}
