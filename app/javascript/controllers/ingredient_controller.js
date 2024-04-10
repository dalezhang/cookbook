import ApplicationController from './application_controller.js'

const $targetEl = document.getElementById('ingredient-popup');
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

// instance options object
const instanceOptions = {
  id: 'ingredient-popup',
  override: true
};
const modal = new Modal($targetEl, options, instanceOptions);

export default class extends ApplicationController {
  static values = { id: String }


  connect() {
    super.connect()
  }

  edit(event) {
    event.preventDefault()
    this.stimulate('IngredientReflex#edit', this.idValue)
  }

  new(event) {
    event.preventDefault()
    this.stimulate('IngredientReflex#new')
  }

  validate(event) {
    event.preventDefault()
    console.log('validate')
    modal.hide()
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
      modal.show();
    }
    if (reflex.includes('IngredientReflex#new')) {
      console.log('new success');
      // show the modal
      modal.show();
    }

    if (reflex.includes('IngredientReflex#validate_name')) {
      console.log('new success');
      // show the modal
      modal.show();
    }
  }

  cancle(event) {
    event.preventDefault()
    console.log('cancle')
    modal.hide()
  }
}
