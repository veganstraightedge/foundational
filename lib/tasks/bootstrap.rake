namespace :bootstrap do
  desc 'Download Bootstrap CSS & JS'
  task download: %i[css js] do
    puts 'Downloading…'
  end

  # Download bootstrap.css from
  desc 'Download CSS'
  task css: :environment do
    puts 'Downloading CSS…'
    css_url       = 'https://cdn.jsdelivr.net/npm/bootstrap@latest/dist/css/bootstrap.css'
    css_file_path = Rails.root.join 'vendor/assets/stylesheets/bootstrap.css'

    puts "Saving CSS to #{css_file_path}…"
    Down.download css_url, destination: css_file_path

    css_map_url       = 'https://cdn.jsdelivr.net/npm/bootstrap@latest/dist/css/bootstrap.css.map'
    css_file_map_path = Rails.root.join 'vendor/assets/stylesheets/bootstrap.css.map'

    puts "Saving CSS map to #{css_file_map_path}…"
    Down.download css_map_url, destination: css_file_map_path
  end

  desc 'Download JS'
  # Download bootstrap.bundle.js which includes Popper,
  # because importmap.rb doesn't Just Work™ for Bootstrap+Popper
  task js: :environment do
    puts 'Downloading JS…'
    js_url        = 'https://cdn.jsdelivr.net/npm/bootstrap@latest/+esm'
    js_file_path  = Rails.root.join 'vendor/javascript/bootstrap.bundle.js'

    puts "Saving JS to #{js_file_path}…"
    Down.download js_url, destination: js_file_path
  end
end
