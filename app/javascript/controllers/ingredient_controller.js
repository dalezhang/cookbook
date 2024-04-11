import ApplicationController from './application_controller.js'
import { Modal } from 'flowbite';


// instance options object
const instanceOptions = {
  id: 'ingredient-popup',
  override: true
};
// options with default values
const options = {
  placement: 'center',
  backdrop: 'static',
  backdropClasses:
      'bg-gray-900/50 dark:bg-gray-900/80 fixed inset-0 z-40',
  closable: true,
  onHide: () => {
    console.log('modal is hidden');
  },
  onShow: () => {
    console.log('modal is shown');
  },
  onToggle: () => {
    console.log('modal has been toggled');
  },
};


export default class extends ApplicationController {
  static values = { id: String }
  initialize() {
    if (window.ingredientModel == undefined) {
      window.ingredientModel = new Modal(document.getElementById('ingredient-popup'), options, instanceOptions)
    }
  }


  connect() {
    super.connect()
  }

  edit(event) {
    event.preventDefault()
    this.stimulate('IngredientReflex#edit', this.idValue)
  }

  new(event) {
    event.preventDefault()
    console.log('new')
    this.stimulate('IngredientReflex#new')
  }

  validate(event) {
    event.preventDefault()
    console.log('validate')
    window.ingredientModel.hide()
    this.stimulate('IngredientReflex#validate_name', event.target.value)
  }

  reflexSuccess (element, reflex, noop, id) {
    // modal.toggle()
    console.log('reflexSuccess')
    console.log(element, reflex, noop, id)
    // // show success message
    if (reflex.includes('IngredientReflex#edit')) {
      console.log('edit success')
      // show the modal
      window.ingredientModel.show();
    }
    if (reflex.includes('IngredientReflex#new')) {
      console.log('new success');
      // show the modal
      window.ingredientModel.show();
    }

    if (reflex.includes('IngredientReflex#validate_name')) {
      window.ingredientModel.show();
    }
  }

  cancle(event) {
    event.preventDefault()
    console.log('cancle')
    window.ingredientModel.toggle()
  }
}
