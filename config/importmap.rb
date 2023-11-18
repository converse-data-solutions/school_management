# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "flowbite", to: "https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.0.0/flowbite.turbo.min.js"
pin "flowbite-datepicker", to: "https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.0.0/datepicker.turbo.min.js"
pin "datatables.net-dt", to: "https://ga.jspm.io/npm:datatables.net-dt@1.13.3/js/dataTables.dataTables.mjs"
pin "datatables.net", to: "https://ga.jspm.io/npm:datatables.net@1.13.3/js/jquery.dataTables.mjs"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.1/dist/jquery.js"
