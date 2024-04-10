# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin 'stimulus_reflex', to: 'stimulus_reflex.js', preload: true
pin_all_from "app/javascript/channels", under: "channels"
pin_all_from "app/javascript/config", under: "config"
pin "@rails/actioncable", to: "actioncable.esm.js", preload: true
pin "morphdom", to: "https://ga.jspm.io/npm:morphdom@2.6.1/dist/morphdom.js", preload: true
pin "cable_ready", to: "cable_ready.js", preload: true
pin "stimulus_reflex", to: "stimulus_reflex.js", preload: true
pin "@wizardhealth/stimulus-multiselect", to: "wizardhealth--stimulus-multiselect.js"
pin "flowbite", to: "https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/flowbite.turbo.min.js"
pin "flowbite-datepicker", to: "https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.3.0/datepicker.turbo.min.js"
