import ApplicationController from './application_controller.js'
import { Modal } from 'flowbite';
import { Multiselect } from '@wizardhealth/stimulus-multiselect'

// instance options object
const instanceOptions = {
  id: 'food-popup',
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
    console.log('food controller')
    if (window.foodModel == undefined) {
      window.foodModel = new Modal(document.getElementById('food-popup'), options, instanceOptions)
    }
  }


  connect() {
    super.connect()
  }

  edit(event) {
    event.preventDefault()
    this.stimulate('FoodReflex#edit', this.idValue)
  }

  new(event) {
    event.preventDefault()
    console.log('new')
    this.stimulate('FoodReflex#new')
  }

  validate(event) {
    event.preventDefault()
    console.log('validate')
    window.foodModel.hide()
    this.stimulate('FoodReflex#validate_name', event.target.value)
  }

  reflexSuccess (element, reflex, noop, id) {
    // modal.toggle()
    console.log('reflexSuccess')
    console.log(element, reflex, noop, id)
    // // show success message
    if (reflex.includes('FoodReflex#edit')) {
      console.log('edit success')
      // show the modal
      window.foodModel.show();
    }
    if (reflex.includes('FoodReflex#new')) {
      console.log('new success');
      // show the modal
      window.foodModel.show();
    }

    if (reflex.includes('FoodReflex#validate_name')) {
      window.foodModel.show();
    }

    // 多选框没出来时重新注册
    if (!document.getElementsByClassName('multiselect__container')[0]) {
      window.Stimulus.register('multiselect', Multiselect)
    }
  }

  cancle(event) {
    event.preventDefault()
    console.log('cancle')
    window.foodModel.toggle()
  }
}
