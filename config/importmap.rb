# Pin npm packages by running ./bin/importmap
pin 'application'

# hotwire.js
pin '@hotwired/turbo-rails',      to: 'turbo.min.js'
pin '@hotwired/stimulus',         to: 'stimulus.min.js'
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js'

# bootstrap + popper js
pin '@popperjs/core',      to: 'https://cdn.jsdelivr.net/npm/@popperjs/core@latest/+esm', preload: false
pin 'bootstrap.bundle.js', to: 'https://cdn.jsdelivr.net/npm/bootstrap@latest/+esm'

# stimulus controllers
pin_all_from 'app/javascript/controllers', under: 'controllers'
