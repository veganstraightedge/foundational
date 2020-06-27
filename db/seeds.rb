puts '==> Seeding…'

if Rails.env.development?
  puts '==> Creating default admin user…'
  admin_user = User.create! email:                 'admin@example.com',
                            password:              '123456789012345678901234567890',
                            password_confirmation: '123456789012345678901234567890'

  # Confirm admin user email
  admin_user.update confirmed_at: Time.current, remember_created_at: Time.current
end

# Settings
puts '==> Creating required Settings with default content…'
Setting.create! name:         'Host name',
                description:  'What domain will you use for your website? For example: example.com.',
                content:      ENV.fetch('WHEN_AND_WHERE_HOST') { 'example.com' },
                form_control: 'text_field'

Setting.create! name:         'Default locale',
                description:  'What locale (language + optional dialect / region) your website be used in primarily?
                              For example: “en” for English (no dialect), “pt-br” for Brazilian Portuguese,
                              “it” for Italian, etc.'.squish,
                content:      ENV.fetch('WHEN_AND_WHERE_LOCALE') { 'en' },
                form_control: 'text_field'

Setting.create! name:         'FROM email address',
                description:  'What address will your site send emails FROM? For example, the password reset email.',
                content:      ENV.fetch('WHEN_AND_WHERE_FROM_EMAIL') { 'from@example.com' },
                form_control: 'email_field'

Setting.create! name:         'Minimum password length',
                description:  'How long does a user’s password have to be?',
                content:      ENV.fetch('WHEN_AND_WHERE_PASSWORD_MINIMUM') { 12 },
                form_control: 'number_field'

puts '==> Seeding… complete.'
