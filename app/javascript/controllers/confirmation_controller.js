import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  confirm(event) {
    if (!(window.confirm("Do you want to buy this product?"))) {
      event.preventDefault()
    }
  }
}