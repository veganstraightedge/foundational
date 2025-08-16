Rails.logger.info '==> Seeding…'

# Settings
Rails.logger.info '==> Creating required Settings with default content…'

# Localization
Setting.find_or_create_by name: 'Default Locale' do |setting|
  setting.group           = 'Localization'
  setting.description     = 'What locale (language + optional dialect / region) will your website
                             be used in primarily? For example: `en` for English (no dialect),
                             `pt-br` for Brazilian Portuguese, `it` for Italian, etc.'.squish
  setting.content         = ENV.fetch('FOUNDATIONAL_LOCALE') { 'en' }
  setting.default_content = 'en'
  setting.form_control    = 'text_field'
end

# Brand
Setting.find_or_create_by name: 'Website Name' do |setting|
  setting.group           = 'Branding'
  setting.description     = 'What text will display in the header nav bar?
                             It will link to the homepage.'.squish
  setting.content         = ENV.fetch('FOUNDATIONAL_WEBSITE_NAME') { 'TODO' }
  setting.default_content = 'TODO'
  setting.update_required = true
  setting.form_control    = 'text_field'
end

Setting.find_or_create_by name: 'Website Header Image' do |setting|
  setting.group           = 'Branding'
  setting.description     = 'What image will display in the header nav bar next
                             to the Website Name? A square image is recommended.'.squish
  setting.content         = ENV.fetch('FOUNDATIONAL_WEBSITE_IMAGE', nil)
  setting.default_content = nil
  setting.form_control    = 'image_field'
end

# Users
Rails.logger.info '==> Creating sample users…'

users_data = [
  { name: 'Alice Johnson', username: 'alice_j',      email_address: 'alice@example.com' },
  { name: 'Bob Smith',     username: 'bobsmith',     email_address: 'bob@example.com' },
  { name: 'Carol Davis',   username: 'carol_d',      email_address: 'carol@example.com' },
  { name: 'David Wilson',  username: 'dwilson',      email_address: 'david@example.com' },
  { name: 'Emma Brown',    username: 'emma_brown',   email_address: 'emma@example.com' },
  { name: 'Frank Miller',  username: 'frankmiller',  email_address: 'frank@example.com' },
  { name: 'Grace Lee',     username: 'grace_lee',    email_address: 'grace@example.com' },
  { name: '',              username: 'techguru',     email_address: 'techguru@example.com' },
  { name: 'Ivy Chen',      username: 'ivy_chen',     email_address: 'ivy@example.com' },
  { name: '',              username: 'developer123', email_address: 'dev@example.com' }
]

users_data.each do |user_attrs|
  User.find_or_create_by email_address: user_attrs[:email_address] do |user|
    user.name                  = user_attrs[:name]
    user.username              = user_attrs[:username]
    user.password              = 'password123'
    user.password_confirmation = 'password123'
  end
end

Rails.logger.info "==> Created #{User.count} users"
Rails.logger.info '==> Seeding… complete.'
