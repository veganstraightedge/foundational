# Ruby installer and version switcher
# Prefer ruby-install/chruby, but allow rbenv
# Check for existing rbenv, otherwise install ruby-install and chruby
brew 'ruby-install' unless system 'command -v rbenv > /dev/null 2>&1'
brew 'chruby'       unless system 'command -v rbenv > /dev/null 2>&1'

# Check for existing ruby-install, otherwise install rbenv
brew 'rbenv' unless system 'command -v ruby-install > /dev/null 2>&1'

# Heroku (PaaS) CLI
tap 'heroku/brew'
brew 'heroku'

# Active Storage PDF previews
cask 'xquartz'
brew 'mupdf'
brew 'poppler'

# Importing and converting Word DOCX uploads
brew 'pandoc'

# Database
brew 'postgresql@17'

# Overcommit hooks
brew 'yamllint'

# Entity relationship diagram (ERD)
brew 'graphviz'
