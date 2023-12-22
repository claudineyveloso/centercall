# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin 'plugin/bootstrap.bundle.min'
pin 'plugin/metismenujs.min'
pin 'plugin/simplebar.min'
pin 'plugin/feather.min'
pin 'plugin/apexcharts.min'
pin 'plugin/jsvectormap.min'
pin 'plugin/world-merc'
pin 'plugin/flatpickr.min.js'
pin 'plugin/dashboard.init.js'
pin 'plugin/app.js'
pin_all_from 'app/javascript/controllers', under: 'controllers'
