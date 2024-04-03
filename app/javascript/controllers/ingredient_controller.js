import ApplicationController from "controllers/application_controller"

export default class extends ApplicationController {
  static classes = ['supported']

  connect() {
    super.connect()
  }

  edit(event) {
    event.preventDefault()
    console.log(this.element)
    console.log(this.element.nextElementSibling)
    this.element.classList.add(this.supportedClass)

  }
}
