import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log('stimulas controller connected')
  }
  disconnect(){
    console.log('stimulas controller disconnected')

  }
}
