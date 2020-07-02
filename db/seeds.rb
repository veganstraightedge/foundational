puts '==> Seeding…'

if Rails.env.development?
  puts '==> Creating default admin user…'
  admin_user = User.create! email:                 'admin@example.com',
                            password:              '123456789012345678901234567890',
                            password_confirmation: '123456789012345678901234567890'

  # Confirm admin user email
  admin_user.update confirmed_at: Time.current, remember_created_at: Time.current

  # Add the admin role to the admin user
  admin_user.add_role :admin
end

# Settings
puts '==> Creating required Settings with default content…'

# Localization
Setting.create! name:            'Default Locale',
                group:           'Localization',
                description:     'What locale (language + optional dialect / region) will your website
                                  be used in primarily? For example: “en” for English (no dialect),
                                  “pt-br” for Brazilian Portuguese, “it” for Italian, etc.'.squish,
                content:         ENV.fetch('FOUNDATIONAL_LOCALE') { 'en' },
                default_content: 'en',
                form_control:    'text_field'

# Devise
Setting.create! name:            'Host',
                group:           'Authentication',
                description:     'What domain will you use for your website? For example: example.com.',
                content:         ENV.fetch('FOUNDATIONAL_HOST') { 'example.com' },
                default_content: 'example.com',
                update_required: true,
                form_control:    'text_field'

Setting.create! name:            'FROM Email Address',
                group:           'Authentication',
                description:     'What address will your site send emails FROM,
                                  such as the password reset email?'.squish,
                content:         ENV.fetch('FOUNDATIONAL_FROM_EMAIL') { 'from@example.com' },
                default_content: 'from@example.com',
                update_required: true,
                form_control:    'email_field'

Setting.create! name:            'Minimum Password Length',
                group:           'Authentication',
                description:     'How long does a user’s password have to be?',
                content:         ENV.fetch('FOUNDATIONAL_PASSWORD_MINIMUM') { 12 },
                default_content: 12,
                form_control:    'number_field'

# Brand
Setting.create! name:            'Website Name',
                group:           'Branding',
                description:     'What text will display in the header nav bar?
                                  It will link to the homepage.'.squish,
                content:         ENV.fetch('FOUNDATIONAL_WEBSITE_NAME') { 'TODO' },
                default_content: 'TODO',
                update_required: true,
                form_control:    'text_field'

Setting.create! name:            'Website Header Image',
                group:           'Branding',
                description:     'What image will display in the header nav bar next
                                  to the Website Name? A square image is recommended.'.squish,
                content:         ENV.fetch('FOUNDATIONAL_WEBSITE_IMAGE') { nil },
                default_content: nil,
                form_control:    'image_field'

puts '==> Seeding… complete.'
