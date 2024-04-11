import { Application } from '@hotwired/stimulus'
import { Multiselect } from '@wizardhealth/stimulus-multiselect'

import consumer from "../channels/consumer"

const application = Application.start()
application.register('multiselect', Multiselect)

// Configure Stimulus development experience
application.debug = false
application.consumer = consumer
window.Stimulus   = application
window.multiselect = Multiselect

export { application }
