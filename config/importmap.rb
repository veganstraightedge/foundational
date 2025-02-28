# Pin npm packages by running ./bin/importmap
pin 'application'

# hotwire.js
pin '@hotwired/turbo-rails',      to: 'turbo.min.js'
pin '@hotwired/stimulus',         to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'

# stimulus controllers
pin_all_from 'app/javascript/controllers', under: 'controllers'

# bootstrap + popper js
pin 'bootstrap.bundle.js', to: 'https://cdn.jsdelivr.net/npm/bootstrap@latest/+esm', preload: true
