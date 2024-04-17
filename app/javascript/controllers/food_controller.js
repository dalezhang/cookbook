import ApplicationController from './application_controller.js'
import { Multiselect } from '@wizardhealth/stimulus-multiselect'

export default class extends ApplicationController {
  static values = { id: String }

  beforeReflex (element, reflex, noop, id) {
    console.log('beforeReflex', element, reflex, noop, id)
    if (reflex.includes('Food#submit')) {
      const toggleFoodPopup = document.getElementById('toggle-food-popup');
      toggleFoodPopup.click()
    }
  }

  edit(event) {
    event.preventDefault()
    this.stimulate('FoodReflex#edit', this.idValue)
  }

  new(event) {
    event.preventDefault()
    this.stimulate('FoodReflex#new')
  }

  reflexSuccess (element, reflex, noop, id) {
    var toggleFoodPopup = document.getElementById('toggle-food-popup');
    // // show success message
    if (reflex.includes('FoodReflex#edit')) {
      toggleFoodPopup.click()
    }
    if (reflex.includes('FoodReflex#new')) {
      toggleFoodPopup.click()
    }

    if (reflex.includes('FoodReflex#validate_name')) {
      toggleFoodPopup.click()
    }

    if (reflex.includes('Food#submit')) {
      if (document.getElementsByClassName('field_with_errors')[0]) {
        toggleFoodPopup.click()
      }
    }

    // 多选框没出来时重新注册
    if (!document.getElementsByClassName('multiselect__container')[0]) {
      window.Stimulus.register('multiselect', Multiselect)
    }
  }
}
