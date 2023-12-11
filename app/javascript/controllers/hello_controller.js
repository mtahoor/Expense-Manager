import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("stimulas controller connected");
  }
  change_transaction_type() {
    console.log("changed");
    const value = document.getElementById("transaction-type");
    value.value === "Account" || value.value === "Bank-Transfer"
      ? (document.getElementById("accounts").style.display = "block")
      : (document.getElementById("accounts").style.display = "none");
  }
  Tabs() {
    const to_show = this.data.get("value");
    const remove = document.getElementsByClassName("nav-item");
    for (let i = 0; i < remove.length; i++) {
      remove[i].classList.remove("btn");
    }
    const e = this.element;
    e.classList.add("btn");
    document.getElementById("Income").style.display = "none";
    document.getElementById("Bank-Transfer").style.display = "none";
    document.getElementById("Expense").style.display = "none";
    document.getElementById(to_show).style.display = "block";
  }
}
